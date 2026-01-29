// ignore_for_file: non_constant_identifier_names

abstract class TextFile {
  List<String> get MONTHS;
  List<String> get YEARSBEFORE;
  List<String> get YEARSBEFOREAFTER;
  List<String> get WORKTYPES;

  String get EXCEPTION_emailAlreadyInUse;
  String get EXCEPTION_invalidEmail;
  String get EXCEPTION_unknownException;

  String get SERVICEDOWN_PAGE_title;
  String get SERVICEDOWN_PAGE_pleaseTryAgainLater;
  String get SERVICEDOWN_PAGE_solutionButton;

  String get DRAWER_preferences;
  String get DRAWER_logout;
  String get DRAWER_dashboard;
  String get DRAWER_settings;
  String get DRAWER_uncompleteLanding;

  String get PHONE_FORM_FIELD_searchText;
  String get PHONE_FORM_FIELD_invalidNumberMessage;

  String get CONTACTINFO_ITEM_couldNotLaunch;

  String get LANDING_PAGE_title;
  String get LANDING_PAGE_skip;
  String get LANDING_PAGE_next;
  String get LANDING_PAGE_complete;
  String get LANDING_PAGE_landing1Title;
  String get LANDING_PAGE_landing1Description;
  String get LANDING_PAGE_landing2Title;
  String get LANDING_PAGE_landing2Description;
  String get LANDING_PAGE_landing3Title;
  String get LANDING_PAGE_landing3Description;
  String get LANDING_PAGE_landing4Title;
  String get LANDING_PAGE_landing4Description;

  String get LOGIN_PAGE_title;
  String get LOGIN_PAGE_email;
  String get LOGIN_PAGE_emailExample;
  String get LOGIN_PAGE_emailHint;
  String get LOGIN_PAGE_passwordExample;
  String get LOGIN_PAGE_password;
  String get LOGIN_PAGE_login;
  String get LOGIN_PAGE_retreivingProfileInfo;
  String get LOGIN_PAGE_forgotPassword;
  String get LOGIN_PAGE_or;
  String get LOGIN_PAGE_loginWithGoogle;
  String get LOGIN_PAGE_dontHaveAnAccount;
  String get LOGIN_PAGE_createAccount;
  String get LOGIN_PAGE_unsuccessfulLoginAttempt;
  String get LOGIN_PAGE_noProfile;
  String get LOGIN_PAGE_returnToLoginPage;
  String get LOGIN_PAGE_loginSuccessful;

  String get SIGNUP_OPTIONS_PAGE_title;
  String get SIGNUP_OPTIONS_PAGE_signupWithEmail;
  String get SIGNUP_OPTIONS_PAGE_signupWithGoogle;
  String get SIGNUP_OPTIONS_PAGE_or;
  String get SIGNUP_OPTIONS_PAGE_login;

  String get SIGNUP_PAGE_title;
  String get SIGNUP_PAGE_createAccount;

  String get SIGNUP_PAGE_email;
  String get SIGNUP_PAGE_emailHint;
  String get SIGNUP_PAGE_password;
  String get SIGNUP_PAGE_passwordHint;
  String get SIGNUP_PAGE_passwordAgain;
  String get SIGNUP_PAGE_referenceCode;
  String get SIGNUP_PAGE_fullName;
  String get SIGNUP_PAGE_location;
  String get SIGNUP_PAGE_phone;
  String get SIGNUP_PAGE_aggreeAndJoin;
  String get SIGNUP_PAGE_alreadyHaveAnAccount;
  String get SIGNUP_PAGE_passwordNotMatching;
  String get SIGNUP_PAGE_invalidReferenceCode;
  String get SIGNUP_PAGE_fullNameMustBeFilled;
  String get SIGNUP_PAGE_fullNameMustContainFirstAndLast;
  String get SIGNUP_PAGE_emailMustBeFilled;
  String get SIGNUP_PAGE_emailIsNotValid;
  String get SIGNUP_PAGE_phoneMustBeFilled;
  String get SIGNUP_PAGE_locationMustBeFilled;
  String get SIGNUP_PAGE_locationIsNotValid;
  String get SIGNUP_PAGE_passwordMustBeFilled;
  String get SIGNUP_PAGE_passwordIsNotValid;
  String get SIGNUP_PAGE_signupFailed;
  String get SIGNUP_PAGE_signupSuccess;

  String get SIGNUP_PAGE_userAgreementBeginning;
  String get SIGNUP_PAGE_privacyPolicy;
  String get SIGNUP_PAGE_privacyPolicyText;
  String get SIGNUP_PAGE_termsOfService;
  String get SIGNUP_PAGE_termsOfServiceText;
  String get SIGNUP_PAGE_gdprCompliance;
  String get SIGNUP_PAGE_gdprComplianceText;
  String get SIGNUP_PAGE_cookies;
  String get SIGNUP_PAGE_cookiesText;
  String get SIGNUP_PAGE_userAgreementEnding;
  String get FORGOT_PASSWORD_PAGE_title;
  String get FORGOT_PASSWORD_PAGE_email;
  String get FORGOT_PASSWORD_PAGE_emailHint;
  String get FORGOT_PASSWORD_PAGE_resetPassword;
  String get FORGOT_PASSWORD_PAGE_emailIsNotValid;
  String get FORGOT_PASSWORD_PAGE_resetLinkGenerated;
  String get EMAIL_VERIFICATION_PAGE_title;
  String get EMAIL_VERIFICATION_PAGE_emailVerificationSuccess;
  String get EMAIL_VERIFICATION_PAGE_verificationCodeLabel;
  String get EMAIL_VERIFICATION_PAGE_verificationCodeHelper;
  String get EMAIL_VERIFICATION_PAGE_verifyEmail;
  String get EMAIL_VERIFICATION_PAGE_verificationSentTo;
  String get EMAIL_VERIFICATION_PAGE_verificationCodeEmpty;
  String get EMAIL_VERIFICATION_PAGE_emailSentSuccessfully;

  String get NAVIGATION_BAR_profile;
  String get NAVIGATION_BAR_dashboard;
  String get NAVIGATION_BAR_matches;

  String get VIEWPROFILE_PAGE_title;
  String get VIEWPROFILE_PAGE_summary;
  String get VIEWPROFILE_PAGE_workExperiences;
  String get VIEWPROFILE_PAGE_educations;
  String get VIEWPROFILE_PAGE_certificates;
  String get VIEWPROFILE_PAGE_skills;
  String get VIEWPROFILE_PAGE_profileDirty;
  String get VIEWPROFILE_PAGE_preferencesDirty;

  String get VIEWPROFILE_PAGE_fillManually;
  String get VIEWPROFILE_PAGE_importFromLinkedin;
  String get VIEWPROFILE_PAGE_emptyHeadline;
  String get VIEWPROFILE_PAGE_emptySummary;
  String get VIEWPROFILE_PAGE_emptyWorkExperiences;
  String get VIEWPROFILE_PAGE_saveProfileText;

  String get VIEWPROFILE_PAGE_addWorkExperience;
  String get VIEWPROFILE_PAGE_addEducation;
  String get VIEWPROFILE_PAGE_addSkill;
  String get VIEWPROFILE_PAGE_addCertificate;

  String get VIEWPROFILE_PAGE_personalInfo;
  String get VIEWPROFILE_PAGE_emptyPersonalInfo;

  String get VIEWPROFILE_PAGE_profileSavedSuccessfully;
  String get VIEWPROFILE_PAGE_profileFetchedSuccessfullyFromResume;
  String get VIEWPROFILE_PAGE_avatarSavedSuccessfully;

  String get PROFILE_FLOATINGBUTTON_WORKEXPERIENCE;
  String get PROFILE_FLOATINGBUTTON_EDUCATION;
  String get PROFILE_FLOATINGBUTTON_CERTIFICATE;
  String get PROFILE_FLOATINGBUTTON_SKILL;
  String get PROFILE_FLOATINGBUTTON_ADD;
  String get PROFILE_FLOATINGBUTTON_CANCEL;

  String get PREFERENCES_PAGE_title;

  String get PARSEPDF_PAGE_title;
  String get PARSEPDF_PAGE_selectPdf;
  String get PARSEPDF_PAGE_fillProfileFromPdf;
  String get PARSEPDF_PAGE_noPdfSelected;

  String get EDITAVATAR_PAGE_title;
  String get EDITAVATAR_PAGE_noImageSelected;
  String get EDITAVATAR_PAGE_selectImage;
  String get EDITAVATAR_PAGE_uploadImage;
  String get EDITAVATAR_PAGE_fileSizeLimitNotification;
  String get EDITAVATAR_PAGE_saveSuccess;

  String get EDITHEADLINE_PAGE_title;
  String get EDITHEADLINE_PAGE_headline;
  String get EDITHEADLINE_PAGE_headlineHint;
  String get EDITHEADLINE_PAGE_save;

  String get EDITSUMMARY_PAGE_title;
  String get EDITSUMMARY_PAGE_summary;
  String get EDITSUMMARY_PAGE_summaryHint;
  String get EDITSUMMARY_PAGE_save;

  String get EDITPERSONALINFO_PAGE_title;
  String get EDITPERSONALINFO_PAGE_firstName;
  String get EDITPERSONALINFO_PAGE_firstNameHint;
  String get EDITPERSONALINFO_PAGE_lastName;
  String get EDITPERSONALINFO_PAGE_lastNameHint;
  String get EDITPERSONALINFO_PAGE_save;
  String get EDITPERSONALINFO_PAGE_country;
  String get EDITPERSONALINFO_PAGE_countryHint;
  String get EDITPERSONALINFO_PAGE_city;
  String get EDITPERSONALINFO_PAGE_cityHint;
  String get EDITPERSONALINFO_PAGE_address;
  String get EDITPERSONALINFO_PAGE_addressHint;
  String get EDITPERSONALINFO_PAGE_phone;
  String get EDITPERSONALINFO_PAGE_phoneHint;
  String get EDITPERSONALINFO_PAGE_linkedin;
  String get EDITPERSONALINFO_PAGE_x;
  String get EDITPERSONALINFO_PAGE_facebook;
  String get EDITPERSONALINFO_PAGE_instagram;
  String get EDITPERSONALINFO_PAGE_linkedinHint;
  String get EDITPERSONALINFO_PAGE_xHint;
  String get EDITPERSONALINFO_PAGE_facebookHint;
  String get EDITPERSONALINFO_PAGE_instagramHint;
  String get EDITPERSONALINFO_PAGE_githubHint;
  String get EDITPERSONALINFO_PAGE_github;
  String get EDITPERSONALINFO_PAGE_websiteHint;
  String get EDITPERSONALINFO_PAGE_website;

  String get EDITWORKEXPERIENCE_PAGE_save;
  String get EDITWORKEXPERIENCE_PAGE_saveSuccess;
  String get EDITWORKEXPERIENCE_PAGE_saveError;
  String get EDITWORKEXPERIENCE_PAGE_title;
  String get EDITWORKEXPERIENCE_PAGE_organisation;
  String get EDITWORKEXPERIENCE_PAGE_titleLabel;
  String get EDITWORKEXPERIENCE_PAGE_workType;
  String get EDITWORKEXPERIENCE_PAGE_description;
  String get EDITWORKEXPERIENCE_PAGE_location;
  String get EDITWORKEXPERIENCE_PAGE_startedOn;
  String get EDITWORKEXPERIENCE_PAGE_endedOn;
  String get EDITWORKEXPERIENCE_PAGE_isCurrent;
  String get EDITWORKEXPERIENCE_PAGE_deleteSuccess;
  String get EDITWORKEXPERIENCE_PAGE_deleteError;
  String get EDITWORKEXPERIENCE_PAGE_deleteConfirmationTitle;
  String get EDITWORKEXPERIENCE_PAGE_deleteConfirmation;
  String get EDITWORKEXPERIENCE_PAGE_delete;
  String get EDITWORKEXPERIENCE_PAGE_deleteCancel;

  String get EDITEDUCATION_PAGE_title;
  String get EDITEDUCATION_PAGE_save;
  String get EDITEDUCATION_PAGE_saveSuccess;
  String get EDITEDUCATION_PAGE_saveError;
  String get EDITEDUCATION_PAGE_deleteSuccess;
  String get EDITEDUCATION_PAGE_deleteError;
  String get EDITEDUCATION_PAGE_deleteConfirmationTitle;
  String get EDITEDUCATION_PAGE_deleteConfirmation;
  String get EDITEDUCATION_PAGE_delete;
  String get EDITEDUCATION_PAGE_deleteCancel;

  String get EDITCERTIFICATE_PAGE_title;
  String get EDITCERTIFICATE_PAGE_name;
  String get EDITCERTIFICATE_PAGE_nameHelper;
  String get EDITCERTIFICATE_PAGE_issuer;
  String get EDITCERTIFICATE_PAGE_issuerHelper;
  String get EDITCERTIFICATE_PAGE_certificateId;
  String get EDITCERTIFICATE_PAGE_certificateIdHelper;
  String get EDITCERTIFICATE_PAGE_certificateUrl;
  String get EDITCERTIFICATE_PAGE_certificateUrlHelper;
  String get EDITCERTIFICATE_PAGE_descriptionHelper;
  String get EDITCERTIFICATE_PAGE_description;
  String get EDITCERTIFICATE_PAGE_save;
  String get EDITCERTIFICATE_PAGE_saveSuccess;
  String get EDITCERTIFICATE_PAGE_saveError;
  String get EDITCERTIFICATE_PAGE_deleteSuccess;
  String get EDITCERTIFICATE_PAGE_deleteError;
  String get EDITCERTIFICATE_PAGE_deleteConfirmationTitle;
  String get EDITCERTIFICATE_PAGE_deleteConfirmation;
  String get EDITCERTIFICATE_PAGE_delete;
  String get EDITCERTIFICATE_PAGE_deleteCancel;

  String get EDITSKILL_PAGE_title;
  String get EDITSKILL_PAGE_selectYourProficiencyLevel;
  String get EDITSKILL_PAGE_save;
  String get EDITSKILL_PAGE_level1Title;
  String get EDITSKILL_PAGE_level2Title;
  String get EDITSKILL_PAGE_level3Title;
  String get EDITSKILL_PAGE_level4Title;
  String get EDITSKILL_PAGE_level5Title;
  String get EDITSKILL_PAGE_level1Description;
  String get EDITSKILL_PAGE_level2Description;
  String get EDITSKILL_PAGE_level3Description;
  String get EDITSKILL_PAGE_level4Description;
  String get EDITSKILL_PAGE_level5Description;
  String get EDITSKILL_PAGE_deleteConfirmationTitle;
  String get EDITSKILL_PAGE_deleteConfirmation;
  String get EDITSKILL_PAGE_delete;
  String get EDITSKILL_PAGE_deleteCancel;
  String get EDITSKILL_PAGE_deleteSuccess;
  String get EDITSKILL_PAGE_saveSuccess;

  String get MATCHINGS_PAGE_title;
  String get MATCHINGS_PAGE_matchingSummaryA;
  String get MATCHINGS_PAGE_matchingSummaryB;
  String get MATCHINGS_PAGE_matchingSummaryHint;
  String get MATCHINGS_PAGE_filterBy;

  String get MATCH_PAGE_title;
  String get MATCH_PAGE_accept;
  String get MATCH_PAGE_reject;
  String get MATCH_PAGE_feature_1_title;
  String get MATCH_PAGE_feature_2_title;
  String get MATCH_PAGE_feature_3_title;
  String get MATCH_PAGE_feature_4_title;
  String get MATCH_PAGE_radar_title;
  String get MATCH_PAGE_skillCloud_title;
  String get MATCH_PAGE_accordion_title_1;
  String get MATCH_PAGE_accordion_title_2;
  String get MATCH_PAGE_accordion_title_3;

  String get SETTINGS_PAGE_title;
  String get SETTINGS_PAGE_language;
  String get SETTINGS_PAGE_changingLanguage;
  String get SETTINGS_PAGE_languageChanged;
  String get SETTINGS_PAGE_languageChangeFailed;

  String get PREFERENCES_PAGE_companySizeQuestion;

  Map<String, String> get PREFERENCES_PAGE_companySizeOptions;

  String get PREFERENCES_PAGE_companyTypeQuestion;

  Map<String, String> get PREFERENCES_PAGE_companyTypeOptions;

  String get PREFERENCES_PAGE_sectorsQuestion;

  String get PREFERENCES_PAGE_typesOfPositionsQuestion;

  Map<String, String> get PREFERENCES_PAGE_typesOfPositionsOptions;

  String get PREFERENCES_PAGE_howUrgentYourHiringQuestion;

  Map<String, String> get PREFERENCES_PAGE_howUrgentIsYourHiringOptions;

  String get PREFERENCES_PAGE_seniorityLevelQuestion;

  Map<String, String> get PREFERENCES_PAGE_seniorityLevelOptions;

  String get PREFERENCES_PAGE_salaryExpectationQuestion;

  String get PREFERENCES_PAGE_currentSalaryHint;
  String get PREFERENCES_PAGE_salaryExpectationHint;
  String get PREFERENCES_PAGE_legalCountryQuestion;

  String get PREFERENCES_PAGE_wantedCountryQuestion;
  String get PREFERENCES_PAGE_workingMethodQuestion;

  Map<String, String> get PREFERENCES_PAGE_workingMethodOptions;

  String get TAKE_SURVE_PAGE_title;

  String get TAKE_SURVE_PAGE_question;

  String get TAKE_SURVE_PAGE_previous;

  String get TAKE_SURVE_PAGE_next;

  String get TAKE_SURVEY_PAGE_remainingPoints;

  String get DASHBOARD_PAGE_title;
  String get DASHBOARD_PAGE_loadingRssFeed;
  String get DASHBOARD_PAGE_updateProfile;
  String get DASHBOARD_PAGE_lastUpdatedOn;
  String get DASHBOARD_PAGE_fillSurvey;
  String get DASHBOARD_PAGE_fillSurveyHeader;
  String get DASHBOARD_PAGE_fillSurveyDescription;
  String get DASHBOARD_PAGE_showTests;
  String get DASHBOARD_PAGE_showTestsHeader;
  String get DASHBOARD_PAGE_showTestsDescription;

  String get PROGRESSVIEWER_activityLevel;

  String get PROGRESSVIEWER_profileScore;

  List<String> get PROGRESSVIEWER_levelNames;

  String get BOTTOM_NAVIGATION_BAR_profile;
  String get BOTTOM_NAVIGATION_BAR_dashboard;
  String get BOTTOM_NAVIGATION_BAR_matchings;

  String get START_SURVEY_PAGE_title;
  String get START_SURVEY_PAGE_startSurvey;
  String get START_SURVEY_PAGE_description;


  String get COMPLETE_SURVEY_PAGE_title;
  String get COMPLETE_SURVEY_PAGE_completeSurvey;
  String get COMPLETE_SURVEY_PAGE_description;
}
