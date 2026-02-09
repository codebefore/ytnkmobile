part of 'global_bloc.dart';

class GlobalState extends Equatable {
  //STATUS FIELDS
  //whether state is available or an inconsistent state like waiting for changes
  final bool isProcessing;
  //whether last action was successful or not
  final bool isSuccessful;
  //whether last action failed or not
  final bool isFailure;
  //info message according to last action
  final String infoMessage;
  //last operation that has been trying to do
  final Operations lastOperation;

  //NAVIGATIONAL FIELDS
  //whether landing page is completed or not. It chooses that we can navigate to login page directly or show landing page
  final bool isLandingCompleted;

  //AUTHENTICATION STATUS FIELDS
  //whether user is authenticated or not. So is there any valid info in user field
  final bool isAuthenticated;
  //user info
  final AuthUserInfo? user;
  //device id that is used to identify the device that application installed
  final String? deviceId;
  //user verification sync code, user send this code with request to sync with generated verification code
  final String? verificationSyncCode;
  //user verification sent email
  final String? verificationSentEmail;

  //PROFILE RELATED FIELDS
  //Indicates the status of the profile of the user. It is used to determine the next step after login
  final ProfileStatus profileStatus;
  //profile info
  final Profile profile;
  //Indicates whether the profile is dirty or not. It is used to determine whether the profile is updated or not
  final bool isProfileDirty;

  /// Indicates whether the preferences have unsaved modifications.
  final bool isPreferencesDirty;
  //list of matches
  final List<Match> matches;

  const GlobalState({
    required this.isProcessing,
    required this.isSuccessful,
    required this.isFailure,
    required this.infoMessage,
    required this.isLandingCompleted,
    required this.isAuthenticated,
    required this.user,
    required this.profileStatus,
    required this.profile,
    required this.matches,
    required this.deviceId,
    required this.verificationSyncCode,
    required this.verificationSentEmail,
    required this.lastOperation,
    required this.isProfileDirty,
    required this.isPreferencesDirty,
  });

  factory GlobalState.initial() {
    return GlobalState(
      isProcessing: false,
      isSuccessful: false,
      isFailure: false,
      infoMessage: "",
      isLandingCompleted: false,
      isAuthenticated: false,
      user: AuthUserInfo.initial(),
      profileStatus: ProfileStatus.unknown,
      profile: Profile.initial(),
      matches: const [],
      deviceId: null,
      verificationSyncCode: "",
      verificationSentEmail: "",
      lastOperation: Operations.other,
      isProfileDirty: false,
      isPreferencesDirty: false,
    );
  }

  @override
  List<Object?> get props => [
        isProcessing,
        isSuccessful,
        isFailure,
        infoMessage,
        isLandingCompleted,
        isAuthenticated,
        user,
        profileStatus,
        profile,
        matches,
        deviceId,
        verificationSyncCode,
        verificationSentEmail,
        lastOperation,
        isProfileDirty,
        isPreferencesDirty,
      ];

  GlobalState processing({
    String? infoMessage,
    bool? isLandingCompleted,
    bool? isAuthenticated,
    AuthUserInfo? user,
    ProfileStatus? profileStatus,
    Profile? profile,
    List<Match>? matches,
    int? navBarIndex,
    String? deviceId,
    String? verificationSyncCode,
    String? verificationSentEmail,
    Operations? lastOperation,
    bool? isProfileDirty,
    bool? isPreferencesDirty,
  }) {
    return copyWith(
      isProcessing: true,
      isSuccessful: false,
      isFailure: false,
      infoMessage: infoMessage,
      isLandingCompleted: isLandingCompleted,
      isAuthenticated: isAuthenticated,
      user: user,
      profileStatus: profileStatus,
      profile: profile,
      matches: matches,
      navBarIndex: navBarIndex,
      deviceId: deviceId,
      verificationSyncCode: verificationSyncCode,
      verificationSentEmail: verificationSentEmail,
      lastOperation: lastOperation,
      isProfileDirty: isProfileDirty,
      isPreferencesDirty: isPreferencesDirty,
    );
  }

  GlobalState success({
    String? infoMessage,
    bool? isLandingCompleted,
    bool? isAuthenticated,
    AuthUserInfo? user,
    ProfileStatus? profileStatus,
    Profile? profile,
    List<Match>? matches,
    int? navBarIndex,
    String? deviceId,
    String? verificationSyncCode,
    String? verificationSentEmail,
    Operations? lastOperation,
    bool? isProfileDirty,
    bool? isPreferencesDirty,
  }) {
    return copyWith(
      isProcessing: false,
      isSuccessful: true,
      isFailure: false,
      infoMessage: infoMessage,
      isLandingCompleted: isLandingCompleted,
      isAuthenticated: isAuthenticated,
      user: user,
      profileStatus: profileStatus,
      profile: profile,
      matches: matches,
      navBarIndex: navBarIndex,
      deviceId: deviceId,
      verificationSyncCode: verificationSyncCode,
      verificationSentEmail: verificationSentEmail,
      lastOperation: lastOperation,
      isProfileDirty: isProfileDirty,
      isPreferencesDirty: isPreferencesDirty,
    );
  }

  GlobalState failure({
    String? infoMessage,
    bool? isLandingCompleted,
    bool? isAuthenticated,
    AuthUserInfo? user,
    ProfileStatus? profileStatus,
    Profile? profile,
    List<Match>? matches,
    int? navBarIndex,
    String? deviceId,
    String? verificationSyncCode,
    String? verificationSentEmail,
    Operations? lastOperation,
    bool? isProfileDirty,
    bool? isPreferencesDirty,
  }) {
    return copyWith(
      isProcessing: false,
      isSuccessful: false,
      isFailure: true,
      infoMessage: infoMessage,
      isLandingCompleted: isLandingCompleted,
      isAuthenticated: isAuthenticated,
      user: user,
      profileStatus: profileStatus,
      profile: profile,
      matches: matches,
      navBarIndex: navBarIndex,
      deviceId: deviceId,
      verificationSyncCode: verificationSyncCode,
      verificationSentEmail: verificationSentEmail,
      lastOperation: lastOperation,
      isProfileDirty: isProfileDirty,
      isPreferencesDirty: isPreferencesDirty,
    );
  }

  GlobalState copyWith({
    bool? isProcessing,
    bool? isSuccessful,
    bool? isFailure,
    String? infoMessage,
    bool? isLandingCompleted,
    bool? isAuthenticated,
    AuthUserInfo? user,
    ProfileStatus? profileStatus,
    Profile? profile,
    List<Match>? matches,
    int? navBarIndex,
    String? deviceId,
    String? verificationSyncCode,
    String? verificationSentEmail,
    Operations? lastOperation,
    bool? isProfileDirty,
    bool? isPreferencesDirty,
  }) {
    return GlobalState(
      isProcessing: isProcessing ?? this.isProcessing,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      isFailure: isFailure ?? this.isFailure,
      infoMessage: infoMessage ?? this.infoMessage,
      isLandingCompleted: isLandingCompleted ?? this.isLandingCompleted,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      profileStatus: profileStatus ?? this.profileStatus,
      profile: profile ?? this.profile,
      matches: matches ?? this.matches,
      deviceId: deviceId ?? this.deviceId,
      verificationSyncCode: verificationSyncCode ?? this.verificationSyncCode,
      verificationSentEmail:
          verificationSentEmail ?? this.verificationSentEmail,
      lastOperation: lastOperation ?? this.lastOperation,
      isProfileDirty: isProfileDirty ?? this.isProfileDirty,
      isPreferencesDirty: isPreferencesDirty ?? this.isPreferencesDirty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isProcessing': isProcessing,
      'isSuccessful': isSuccessful,
      'isFailure': isFailure,
      'infoMessage': infoMessage,
      'isLandingCompleted': isLandingCompleted,
      'isAuthenticated': isAuthenticated,
      'user': user?.toMap(),
      'profileStatus': profileStatus.toMap(),
      'profile': profile.toMap(),
      'matches': matches.map((x) => x.toMap()).toList(),
      'deviceId': deviceId,
      'verificationSyncCode': verificationSyncCode,
      'verificationSentEmail': verificationSentEmail,
      'lastOperation': lastOperation.toMap(),
      'isProfileDirty': isProfileDirty,
      'isPreferencesDirty': isPreferencesDirty,
    };
  }

  factory GlobalState.fromMap(Map<String, dynamic> map) {
    return GlobalState(
      isProcessing: map['isProcessing'] as bool,
      isSuccessful: map['isSuccessful'] as bool,
      isFailure: map['isFailure'] as bool,
      infoMessage: map['infoMessage'] as String,
      isLandingCompleted: map['isLandingCompleted'] as bool,
      isAuthenticated: map['isAuthenticated'] as bool,
      user: map['user'] != null
          ? AuthUserInfo.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      profileStatus:
          ProfileStatus.fromMap(map['profileStatus'] as Map<String, dynamic>),
      profile: Profile.fromMap(map['profile'] as Map<String, dynamic>),
      matches: List<Match>.from(
        (map['matches'] as List<int>).map<Match>(
          (x) => Match.fromMap(x as Map<String, dynamic>),
        ),
      ),
      deviceId: map['deviceId'] as String?,
      verificationSyncCode: map['verificationSyncCode'] as String,
      verificationSentEmail: map['verificationSentEmail'] as String,
      lastOperation:
          Operations.fromMap(map['lastOperation'] as Map<String, dynamic>),
      isProfileDirty: map['isProfileDirty'] as bool,
      isPreferencesDirty: map['isPreferencesDirty'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory GlobalState.fromJson(String source) =>
      GlobalState.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum ProfileStatus {
  unknown(value: "unknown"),
  noProfile(value: "noProfile"),
  generatingNewProfile(value: "generatingNewProfile"),
  hasProfile(value: "hasProfile");

  const ProfileStatus({required this.value});

  final String value;

  factory ProfileStatus.fromMap(Map<String, dynamic> map) {
    return ProfileStatus.values.firstWhere(
      (e) => e.value == map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }
}

enum Operations {
  other(value: "other"),
  restoreSession(value: "restoreSession"),
  login(value: "login"),
  logout(value: "logout"),
  signup(value: "signup"),
  changeLanguage(value: "changeLanguage"),
  saveProfile(value: "saveProfile"),
  savePreferences(value: "savePreferences"),
  editProfileAvatar(value: "editProfileAvatar"),
  editProfileHeadline(value: "editProfileHeadline"),
  editProfilePersonalInfo(value: "editProfilePersonalInfo"),
  editProfileSummary(value: "editProfileSummary"),
  editWorkExperience(value: "editWorkExperience"),
  editEducation(value: "editEducation"),
  editSkill(value: "editSkill"),
  editCertificate(value: "editCertificate"),
  editPreferences(value: "editPreferences"),
  fillProfileFromResume(value: "fillProfileFromResume"),
  deleteWorkExperience(value: "deleteWorkExperience"),
  deleteEducation(value: "deleteEducation"),
  deleteCertificate(value: "deleteCertificate"),
  deleteSkill(value: "deleteSkill"),
  addSkills(value: "addSkills");

  const Operations({required this.value});

  final String value;

  factory Operations.fromMap(Map<String, dynamic> map) {
    return Operations.values.firstWhere(
      (e) => e.value == map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }
}
