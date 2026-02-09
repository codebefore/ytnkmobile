part of 'global_bloc.dart';

extension AuthMethods on GlobalBloc {
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
        emit(state.success(
          isAuthenticated: true,
          user: userInfo,
          profileStatus: ProfileStatus.unknown,
          lastOperation: Operations.restoreSession,
        ));

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
  }

  ///Logs in with [email] and [password]
  FutureOr<void> _loggedInWithEmailPassword(
      LoginWithEmailPasswordEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.login));

    final response =
        await _authService.loginWithEmailPassword(event.email, event.password);

    if (response.isSuccess) {
      emit(state.success(
          isAuthenticated: true,
          user: response.responseObject,
          profileStatus: ProfileStatus.unknown));
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
      emit(state.success(
          isAuthenticated: true,
          user: response.responseObject,
          profileStatus: ProfileStatus.unknown));
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
    emit(state.processing());

    var response = await _authService.forgotPassword(event.email);

    if (response.isSuccess) {
      emit(state.success());
    } else {
      emit(state.failure(infoMessage: response.message));
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
