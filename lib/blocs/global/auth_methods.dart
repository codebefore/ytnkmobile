part of 'global_bloc.dart';

extension AuthMethods on GlobalBloc {
  static const _deviceSyncMaxAttempts = 3;
  static const _deviceSyncWarningMessage =
      "Notification setup could not be refreshed. We will retry later.";

  Future<void> _syncDeviceInBackground({
    String? deviceId,
  }) async {
    final normalizedDeviceId = deviceId?.trim();
    if (normalizedDeviceId != null && normalizedDeviceId.isNotEmpty) {
      _pendingDeviceSyncId = normalizedDeviceId;
    }

    _hasPendingDeviceSyncRequest = true;
    if (_isDeviceSyncWorkerRunning) {
      return;
    }

    _isDeviceSyncWorkerRunning = true;
    try {
      while (_hasPendingDeviceSyncRequest) {
        _hasPendingDeviceSyncRequest = false;

        final resolvedDeviceId =
            await _resolveDeviceIdForSync(_pendingDeviceSyncId);
        _pendingDeviceSyncId = null;
        if (resolvedDeviceId.isEmpty) {
          continue;
        }

        final isSynced = await _syncDeviceWithRetries(resolvedDeviceId);
        if (isSynced) {
          _didShowDeviceSyncWarning = false;
          continue;
        }

        if (_hasPendingDeviceSyncRequest) {
          if (kDebugMode) {
            debugPrint(
                "Device sync failed for a previous request. Retrying the latest queued device id.");
          }
          continue;
        }

        if (!_didShowDeviceSyncWarning) {
          _didShowDeviceSyncWarning = true;
          EasyLoading.showInfo(_deviceSyncWarningMessage);
        }
      }
    } catch (error) {
      // Background sync should never block or break login / restore flow.
      if (kDebugMode) {
        debugPrint("Device sync threw an exception: $error");
      }

      if (!_didShowDeviceSyncWarning) {
        _didShowDeviceSyncWarning = true;
        EasyLoading.showInfo(_deviceSyncWarningMessage);
      }
    } finally {
      _isDeviceSyncWorkerRunning = false;
      if (_hasPendingDeviceSyncRequest) {
        unawaited(_syncDeviceInBackground());
      }
    }
  }

  Future<String> _resolveDeviceIdForSync(String? deviceId) async {
    var resolvedDeviceId = (deviceId ?? state.deviceId ?? "").trim();
    if (resolvedDeviceId.isEmpty) {
      final wonderPushDeviceId = await WonderPush.getDeviceId();
      resolvedDeviceId = (wonderPushDeviceId ?? "").toString().trim();
    }

    return resolvedDeviceId;
  }

  Future<bool> _syncDeviceWithRetries(String deviceId) async {
    for (var attempt = 1; attempt <= _deviceSyncMaxAttempts; attempt++) {
      final response = await _authService.syncDevice(deviceId);
      if (response.isSuccess) {
        if (kDebugMode) {
          debugPrint(
              "Device sync completed on attempt $attempt for current device.");
        }
        return true;
      }

      if (kDebugMode) {
        debugPrint("Device sync failed on attempt $attempt: ${response.message}");
      }

      if (attempt < _deviceSyncMaxAttempts) {
        await Future.delayed(Duration(seconds: attempt));
      }
    }

    return false;
  }

  FutureOr<void> _restoreSession(
      RestoreSessionEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.restoreSession));

    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      emit(state.success(
        isAuthenticated: false,
        user: AuthUserInfo.initial(),
        profileStatus: ProfileStatus.unknown,
        lastOperation: Operations.restoreSession,
      ));
      return;
    }

    try {
      final token = await firebaseUser.getIdToken(true);
      if (token == null || token.isEmpty) {
        await _authService.logout();
        emit(state.success(
          isAuthenticated: false,
          user: AuthUserInfo.initial(),
          profileStatus: ProfileStatus.unknown,
          lastOperation: Operations.restoreSession,
        ));
        return;
      }

      final loginResponse = await _authService.login(token, firebaseUser.uid);

      if (loginResponse.isSuccess && loginResponse.responseObject != null) {
        final userInfo = AuthUserInfo.fromJson(loginResponse.responseObject);
        final currentDeviceId = state.deviceId;
        emit(state.success(
          isAuthenticated: true,
          user: currentDeviceId != null && currentDeviceId.isNotEmpty
              ? userInfo.copyWith(deviceId: currentDeviceId)
              : userInfo,
          profileStatus: ProfileStatus.unknown,
          lastOperation: Operations.restoreSession,
        ));

        unawaited(_syncDeviceInBackground());
        add(GetProfileFromEmailEvent(email: userInfo.email));
      } else {
        if (loginResponse.isUnauthorized) {
          await _authService.logout();
        }
        emit(state.failure(
          isAuthenticated: false,
          user: AuthUserInfo.initial(),
          profileStatus: ProfileStatus.unknown,
          infoMessage: loginResponse.message,
          lastOperation: Operations.restoreSession,
        ));
      }
    } catch (e) {
      emit(state.failure(
        isAuthenticated: false,
        user: AuthUserInfo.initial(),
        profileStatus: ProfileStatus.unknown,
        infoMessage: e.toString(),
        lastOperation: Operations.restoreSession,
      ));
    }
  }

  FutureOr<void> _retrieveDeviceIdEvent(
      RetrieveDeviceIdEvent event, Emitter<GlobalState> emit) async {
    WonderPush.subscribeToNotifications();
    var deviceId = await WonderPush.getDeviceId();

    emit(state.success(deviceId: deviceId));

    if (state.isAuthenticated && deviceId != null && deviceId.toString().isNotEmpty) {
      unawaited(_syncDeviceInBackground(
        deviceId: deviceId.toString(),
      ));
    }
  }

  ///Logs in with [email] and [password]
  FutureOr<void> _loggedInWithEmailPassword(
      LoginWithEmailPasswordEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.login));

    final response =
        await _authService.loginWithEmailPassword(event.email, event.password);

    if (response.isSuccess) {
      final currentDeviceId = state.deviceId;
      emit(state.success(
          isAuthenticated: true,
          user: currentDeviceId != null && currentDeviceId.isNotEmpty
              ? response.responseObject?.copyWith(deviceId: currentDeviceId)
              : response.responseObject,
          profileStatus: ProfileStatus.unknown));
      unawaited(_syncDeviceInBackground());
    } else {
      emit(state.failure(
        isAuthenticated: false,
        user: AuthUserInfo.initial(),
        infoMessage: response.message,
      ));
    }
  }

  ///Logs in with google account
  FutureOr<void> _loggedInWithGoogle(
      LoginWithGoogleEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.login));

    final response = await _authService.loginWithGoogle();

    if (response.isSuccess) {
      final currentDeviceId = state.deviceId;
      emit(state.success(
          isAuthenticated: true,
          user: currentDeviceId != null && currentDeviceId.isNotEmpty
              ? response.responseObject?.copyWith(deviceId: currentDeviceId)
              : response.responseObject,
          profileStatus: ProfileStatus.unknown));
      unawaited(_syncDeviceInBackground());
    } else {
      emit(state.failure(
        isAuthenticated: false,
        user: AuthUserInfo.initial(),
        infoMessage: response.message,
      ));
    }
  }

  ///Logs out from applications
  FutureOr<void> _loggedout(
      LogoutEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.logout));

    await _authService.logout();

    emit(
      state.success(
        isAuthenticated: false,
        user: AuthUserInfo.initial(),
        profileStatus: ProfileStatus.unknown,
        profile: Profile.initial(),
        isProfileDirty: false,
        matches: List.empty(),
        navBarIndex: 0,
      ),
    );
  }

  ///Logs in with google account
  FutureOr<void> _signupWithGoogle(
      SignupWithGoogleEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing());

    final response = await _authService.loginWithGoogleOnly();

    if (response.isSuccess) {
      emit(state.success(
          isAuthenticated: true,
          user: response.responseObject,
          profileStatus: ProfileStatus.generatingNewProfile));
    } else {
      emit(state.failure(
        isAuthenticated: false,
        user: AuthUserInfo.initial(),
        infoMessage: response.message,
      ));
    }
  }

  FutureOr<void> _signup(SignupEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.signup));

    // Use state.deviceId if available, otherwise generate a fallback GUID
    final deviceId = state.deviceId ?? IDGenerator.generateGUID();

    final response = await _authService.signup(
      event.referenceCode,
      event.fullName,
      event.email,
      event.countryCode,
      event.countryName,
      event.phone,
      event.location,
      event.password,
      event.isSocial,
      deviceId,
    );

    if (response.isSuccess && response.responseObject != null) {
      emit(state.success(
          isAuthenticated: true,
          user: response.responseObject,
          profileStatus: ProfileStatus.generatingNewProfile));
    } else {
      emit(state.failure(infoMessage: response.message));
    }
  }

  FutureOr<void> _forgotPassword(
      ForgotPasswordEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(
      lastOperation: Operations.forgotPassword,
      infoMessage: "",
    ));

    var response = await _authService.forgotPassword(event.email);

    if (response.isSuccess) {
      emit(state.success(
        lastOperation: Operations.forgotPassword,
        infoMessage: "",
      ));
    } else {
      emit(state.failure(
        infoMessage: response.message,
        lastOperation: Operations.forgotPassword,
      ));
    }
  }

  FutureOr<void> _sendVerificationEmail(
      SendVerificationEmailEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing());

    var response = await _authService.sendVerificationEmail(event.user);

    if (response.isSuccess) {
      emit(state.success(
          verificationSyncCode: response.responseObject!.syncCode,
          verificationSentEmail: response.responseObject!.emailSent));
    } else {
      emit(state.failure(infoMessage: response.message));
    }
  }

  FutureOr<void> _verifyEmail(
      VerifyEmailEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing());

    var response = await _authService.verifyEmail(
        event.syncCode, event.verificationCode, event.email, event.userId);

    if (response.isSuccess) {
      emit(state.success(
        user: state.user!.copyWith(isEmailVerified: true),
      ));
    } else {
      emit(state.failure(infoMessage: response.message));
    }
  }
}
