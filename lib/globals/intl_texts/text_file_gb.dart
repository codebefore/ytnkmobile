// ignore_for_file: non_constant_identifier_names, overridden_fields

import 'package:ytnkio/globals/intl_texts/text_file.dart';

class TextFileGB extends TextFile {
  @override
  var MONTHS = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  var YEARSBEFORE = [
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025"
  ];

  @override
  var YEARSBEFOREAFTER = [
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030"
  ];

  @override
  var WORKTYPES = ["Full-time", "Part-time", "Hybrid", "Remote"];

  @override
  String EXCEPTION_emailAlreadyInUse = "The email address is already in use.";
  @override
  String EXCEPTION_invalidEmail = "Invalid email.";
  @override
  String EXCEPTION_unknownException = "Unknown exception: ";

  @override
  String SERVICEDOWN_PAGE_title = "Service Not Available";
  @override
  String SERVICEDOWN_PAGE_pleaseTryAgainLater =
      "Service connection not available.\nPlease try again later.";
  @override
  String SERVICEDOWN_PAGE_solutionButton = "Try again";

  @override
  String DRAWER_preferences = "Preferences";
  @override
  String DRAWER_logout = "Logout";
  @override
  String DRAWER_dashboard = "Dashboard";
  @override
  String DRAWER_settings = "Settings";
  @override
  String DRAWER_uncompleteLanding = "Uncomplete Landing";

  @override
  String PHONE_FORM_FIELD_searchText = "Select country";
  @override
  String PHONE_FORM_FIELD_invalidNumberMessage = "Invalid phone number";

  @override
  String CONTACTINFO_ITEM_couldNotLaunch = "Could not launch ";

  @override
  String LANDING_PAGE_title = "ytnk.io";
  @override
  String LANDING_PAGE_skip = "Skip";
  @override
  String LANDING_PAGE_next = "Next";
  @override
  String LANDING_PAGE_complete = "Complete";
  @override
  String LANDING_PAGE_landing1Title = "Create Your Profile";
  @override
  String LANDING_PAGE_landing1Description =
      "Create your profile for us to know you better";
  @override
  String LANDING_PAGE_landing2Title = "Fill Work Environment Survey";
  @override
  String LANDING_PAGE_landing2Description =
      "Fill the survey to discover the best work environment for you";
  @override
  String LANDING_PAGE_landing3Title = "Join Technical Assessments";
  @override
  String LANDING_PAGE_landing3Description =
      "Join technical assessments for us to discover your skills";
  @override
  String LANDING_PAGE_landing4Title = "Manage Your Matches";
  @override
  String LANDING_PAGE_landing4Description =
      "Manage your matches by evaluating the invitations sent to you";

  @override
  String LOGIN_PAGE_title = "Welcome";
  @override
  String LOGIN_PAGE_email = "Email";
  @override
  String LOGIN_PAGE_emailExample = "jimmymc9ill@proton.me";
  @override
  String LOGIN_PAGE_emailHint = "Ex: test@testmail.com";
  @override
  String LOGIN_PAGE_passwordExample = "123456";
  @override
  String LOGIN_PAGE_password = "Password";
  @override
  String LOGIN_PAGE_login = "Login";
  @override
  String LOGIN_PAGE_retreivingProfileInfo = "Retreiving Profile Info...";
  @override
  String LOGIN_PAGE_forgotPassword = "Forgot Password?";
  @override
  String LOGIN_PAGE_or = " or ";
  @override
  String LOGIN_PAGE_loginWithGoogle = "Login with Google";
  @override
  String LOGIN_PAGE_dontHaveAnAccount = "Don't have an account?";
  @override
  String LOGIN_PAGE_createAccount = "Create Account";
  @override
  String LOGIN_PAGE_unsuccessfulLoginAttempt = "Unsuccessful login attempt";
  @override
  String LOGIN_PAGE_noProfile = "No profile";
  @override
  String LOGIN_PAGE_returnToLoginPage = "Return to login page";
  @override
  String LOGIN_PAGE_loginSuccessful = "Login successful";

  @override
  String SIGNUP_OPTIONS_PAGE_title = "Signup Options";
  @override
  String SIGNUP_OPTIONS_PAGE_signupWithEmail = "Sign up with Email";
  @override
  String SIGNUP_OPTIONS_PAGE_signupWithGoogle = "Sign up with Google";
  @override
  String SIGNUP_OPTIONS_PAGE_or = "or";
  @override
  String SIGNUP_OPTIONS_PAGE_login = "Login";

  @override
  String SIGNUP_PAGE_title = "Create Account";
  @override
  String SIGNUP_PAGE_createAccount = "Create My Account";

  @override
  String SIGNUP_PAGE_email = "Email";
  @override
  String SIGNUP_PAGE_emailHint = "Ex: test@testmail.com";
  @override
  String SIGNUP_PAGE_password = "Password";
  @override
  String SIGNUP_PAGE_passwordHint = "Minimum 6 characters";
  @override
  String SIGNUP_PAGE_passwordAgain = "Password (Again)";
  @override
  String SIGNUP_PAGE_referenceCode = "Reference Code";
  @override
  String SIGNUP_PAGE_fullName = "Full Name";
  @override
  String SIGNUP_PAGE_location = "Location";
  @override
  String SIGNUP_PAGE_phone = "Phone";
  @override
  String SIGNUP_PAGE_aggreeAndJoin = "Agree & Join";
  @override
  String SIGNUP_PAGE_alreadyHaveAnAccount = "Already have an account?";
  @override
  String SIGNUP_PAGE_invalidReferenceCode = "Invalid reference code";
  @override
  String SIGNUP_PAGE_fullNameMustBeFilled = "Fullname field must be filled";
  @override
  String SIGNUP_PAGE_fullNameMustContainFirstAndLast =
      "Fullname must contain both first and last name";
  @override
  String SIGNUP_PAGE_emailMustBeFilled = "Email field must be filled";
  @override
  String SIGNUP_PAGE_emailIsNotValid = "Email is not valid";
  @override
  String SIGNUP_PAGE_phoneMustBeFilled = "Phone field must be filled";
  @override
  String SIGNUP_PAGE_locationMustBeFilled =
      "Signup failed. Please check your information and try again.";
  @override
  String SIGNUP_PAGE_locationIsNotValid = "Location is not valid";
  @override
  String SIGNUP_PAGE_passwordMustBeFilled = "Password field must be filled";
  @override
  String SIGNUP_PAGE_passwordIsNotValid =
      "Password field must be at least 6 characters";
  @override
  String SIGNUP_PAGE_passwordNotMatching = "Passwords do not match";
  @override
  String SIGNUP_PAGE_signupFailed =
      "Signup failed. Please check your information and try again.";
  @override
  String SIGNUP_PAGE_signupSuccess = "Signup successful.";

  @override
  String SIGNUP_PAGE_userAgreementBeginning =
      "By clicking 'Sign up with email' or 'Sign up with Google' buttons you agree to the following:\n\n";
  @override
  String SIGNUP_PAGE_privacyPolicy = "1. Privacy Policy:";
  @override
  String SIGNUP_PAGE_privacyPolicyText =
      " You consent to our collection, use, and disclosure of your personal information as described in our Privacy Policy. \n\n";
  @override
  String SIGNUP_PAGE_termsOfService = "2. Terms of Service:";
  @override
  String SIGNUP_PAGE_termsOfServiceText =
      " You agree to our Terms of Service, which govern your use of our platform.\n\n";
  @override
  String SIGNUP_PAGE_gdprCompliance = "3. GDPR Compliance:";
  @override
  String SIGNUP_PAGE_gdprComplianceText =
      " If you are located in the European Economic Area (EEA), you acknowledge and consent to the processing of your personal data in accordance with the General Data Protection Regulation (GDPR).\n\n";
  @override
  String SIGNUP_PAGE_cookies = "4. Cookies:";
  @override
  String SIGNUP_PAGE_cookiesText =
      " You acknowledge and accept our use of cookies and similar technologies as outlined in our Cookies Policy.\n\n";
  @override
  String SIGNUP_PAGE_userAgreementEnding =
      "By signing up, you confirm that you have read, understood, and accepted these terms and conditions. If you do not agree with any part of these terms, please do not proceed with the sign-up process.";

  @override
  String FORGOT_PASSWORD_PAGE_title = "Forgot Password";
  @override
  String FORGOT_PASSWORD_PAGE_email = "Email";
  @override
  String FORGOT_PASSWORD_PAGE_emailHint =
      "An email that contains a password reset link will be sent to your registered email.";
  @override
  String FORGOT_PASSWORD_PAGE_resetPassword = "Send Password Reset Link";
  @override
  String FORGOT_PASSWORD_PAGE_emailIsNotValid = "Your email is not valid";
  @override
  String FORGOT_PASSWORD_PAGE_resetLinkGenerated =
      "Reset link generated. \r\n\r\n Please check your email.";

  @override
  String EMAIL_VERIFICATION_PAGE_title = "Email Verification";
  @override
  String EMAIL_VERIFICATION_PAGE_emailVerificationSuccess =
      "Email verification successful";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeLabel = "Verification Code";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeHelper =
      "Enter the verification code sent to your email";
  @override
  String EMAIL_VERIFICATION_PAGE_verifyEmail = "Verify Email";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationSentTo =
      "Verification mail sent to ";
  @override
  String EMAIL_VERIFICATION_PAGE_verificationCodeEmpty =
      "Verification code is empty";
  @override
  String EMAIL_VERIFICATION_PAGE_emailSentSuccessfully =
      "Verification email sent";

  @override
  String NAVIGATION_BAR_profile = "Profile";
  @override
  String NAVIGATION_BAR_dashboard = "Dashboard";
  @override
  String NAVIGATION_BAR_matches = "Matches";

  @override
  String VIEWPROFILE_PAGE_title = "View Profile";
  @override
  String VIEWPROFILE_PAGE_summary = "Summary";
  @override
  String VIEWPROFILE_PAGE_workExperiences = "Work Experiences";
  @override
  String VIEWPROFILE_PAGE_educations = "Educations";
  @override
  String VIEWPROFILE_PAGE_certificates = "Certificates";
  @override
  String VIEWPROFILE_PAGE_skills = "Skills";
  @override
  String VIEWPROFILE_PAGE_profileDirty =
      "There are unsaved changes on your profile. Please tap save profile to dont lose information.";
  @override
  String VIEWPROFILE_PAGE_preferencesDirty =
      "There are unsaved changes on your preferences. Please tap save preferences to dont lose information.";

  @override
  String VIEWPROFILE_PAGE_fillManually = "or fill manually";
  @override
  String VIEWPROFILE_PAGE_importFromLinkedin = "Import from Linkedin CV PDF";
  @override
  String VIEWPROFILE_PAGE_emptyHeadline = "Type your headline here";
  @override
  String VIEWPROFILE_PAGE_emptySummary = "Give a brief summary about yourself";
  @override
  String VIEWPROFILE_PAGE_emptyWorkExperiences =
      "Add your work experiences to enrich your profile";
  @override
  String VIEWPROFILE_PAGE_saveProfileText = "Save Profile";

  @override
  String VIEWPROFILE_PAGE_addWorkExperience = "Add work experience";
  @override
  String VIEWPROFILE_PAGE_addEducation = "Add education";
  @override
  String VIEWPROFILE_PAGE_addSkill = "Add skill";
  @override
  String VIEWPROFILE_PAGE_addCertificate = "Add certificate";

  @override
  String VIEWPROFILE_PAGE_personalInfo = "Personal Info";
  @override
  String VIEWPROFILE_PAGE_emptyPersonalInfo =
      "Add your personal information to enrich your profile";

  @override
  String VIEWPROFILE_PAGE_profileSavedSuccessfully = "Profile saved succesfully";
  @override
  String VIEWPROFILE_PAGE_profileFetchedSuccessfullyFromResume =
      "Profile fetched successfully from resume";
  @override
  String VIEWPROFILE_PAGE_avatarSavedSuccessfully = "Avatar saved successfully";

  @override
  String PROFILE_FLOATINGBUTTON_WORKEXPERIENCE = "Work Experience";
  @override
  String PROFILE_FLOATINGBUTTON_EDUCATION = "Education";
  @override
  String PROFILE_FLOATINGBUTTON_CERTIFICATE = "Certificate";
  @override
  String PROFILE_FLOATINGBUTTON_SKILL = "Skill";
  @override
  String PROFILE_FLOATINGBUTTON_ADD = "Add...";
  @override
  String PROFILE_FLOATINGBUTTON_CANCEL = "Cancel";

  @override
  String PREFERENCES_PAGE_title = "Preferences";

  @override
  String PARSEPDF_PAGE_title = "Fill Profile From PDF";
  @override
  String PARSEPDF_PAGE_selectPdf = "Select PDF Resume";
  @override
  String PARSEPDF_PAGE_fillProfileFromPdf = "Fill Profile from Resume";
  @override
  String PARSEPDF_PAGE_noPdfSelected = "No PDF selected";

  @override
  String EDITAVATAR_PAGE_title = "Edit Avatar";
  @override
  String EDITAVATAR_PAGE_noImageSelected = "No image selected";
  @override
  String EDITAVATAR_PAGE_selectImage = "Choose image from gallery";
  @override
  String EDITAVATAR_PAGE_uploadImage = "Upload Image";
  @override
  String EDITAVATAR_PAGE_fileSizeLimitNotification =
      "Image size must be less than 4MB. File size in KBs: ";
  @override
  String EDITAVATAR_PAGE_saveSuccess = "Saved Successfully";

  @override
  String EDITHEADLINE_PAGE_title = "Edit Headline";
  @override
  String EDITHEADLINE_PAGE_headline = "Headline";
  @override
  String EDITHEADLINE_PAGE_headlineHint =
      "Ex: Project Manager with 10 years of experience in IT industry ...";
  @override
  String EDITHEADLINE_PAGE_save = "Save Headline";

  @override
  String EDITSUMMARY_PAGE_title = "Edit Summary";
  @override
  String EDITSUMMARY_PAGE_summary = "Summary";
  @override
  String EDITSUMMARY_PAGE_summaryHint =
      "Ex: Project Manager with 10 years of experience in IT industry ...";
  @override
  String EDITSUMMARY_PAGE_save = "Save Summary";

  @override
  String EDITPERSONALINFO_PAGE_title = "Edit Personal Info";
  @override
  String EDITPERSONALINFO_PAGE_firstName = "First Name";
  @override
  String EDITPERSONALINFO_PAGE_firstNameHint = "Ex: John";
  @override
  String EDITPERSONALINFO_PAGE_lastName = "Last Name";
  @override
  String EDITPERSONALINFO_PAGE_lastNameHint = "Ex: Doe";
  @override
  String EDITPERSONALINFO_PAGE_save = "Save Personal Info";
  @override
  String EDITPERSONALINFO_PAGE_country = "Country";
  @override
  String EDITPERSONALINFO_PAGE_countryHint = "Ex: Türkiye";
  @override
  String EDITPERSONALINFO_PAGE_city = "City";
  @override
  String EDITPERSONALINFO_PAGE_cityHint = "Ex: İstanbul";
  @override
  String EDITPERSONALINFO_PAGE_address = "Address";
  @override
  String EDITPERSONALINFO_PAGE_addressHint = "Ex: 123 Main St, Apt 4B";
  @override
  String EDITPERSONALINFO_PAGE_phone = "Phone";
  @override
  String EDITPERSONALINFO_PAGE_phoneHint = "Ex: 1234567890";
  @override
  String EDITPERSONALINFO_PAGE_linkedin = "Linkedin Account";
  @override
  String EDITPERSONALINFO_PAGE_x = "X Account";
  @override
  String EDITPERSONALINFO_PAGE_facebook = "Facebook Account";
  @override
  String EDITPERSONALINFO_PAGE_instagram = "Instagram Account";
  @override
  String EDITPERSONALINFO_PAGE_linkedinHint = "Ex: linkedin.com";
  @override
  String EDITPERSONALINFO_PAGE_xHint = "Ex: x.com";
  @override
  String EDITPERSONALINFO_PAGE_facebookHint = "Ex: facebook.com";
  @override
  String EDITPERSONALINFO_PAGE_instagramHint = "Ex: instagram.com";
  @override
  String EDITPERSONALINFO_PAGE_githubHint = "Ex: github.com";
  @override
  String EDITPERSONALINFO_PAGE_github = "Github Account";
  @override
  String EDITPERSONALINFO_PAGE_websiteHint = "Ex: website.com";
  @override
  String EDITPERSONALINFO_PAGE_website = "Website";

  @override
  String EDITWORKEXPERIENCE_PAGE_save = "Save Work Experience";
  @override
  String EDITWORKEXPERIENCE_PAGE_saveSuccess =
      "Work experience saved successfully";
  @override
  String EDITWORKEXPERIENCE_PAGE_saveError = "Work experience saving failed";
  @override
  String EDITWORKEXPERIENCE_PAGE_title = "Edit Work Experience";
  @override
  String EDITWORKEXPERIENCE_PAGE_organisation = "Organisation";
  @override
  String EDITWORKEXPERIENCE_PAGE_titleLabel = "Title";
  @override
  String EDITWORKEXPERIENCE_PAGE_workType = "Work Type";
  @override
  String EDITWORKEXPERIENCE_PAGE_description = "Description";
  @override
  String EDITWORKEXPERIENCE_PAGE_location = "Location";
  @override
  String EDITWORKEXPERIENCE_PAGE_startedOn = "Started On";
  @override
  String EDITWORKEXPERIENCE_PAGE_endedOn = "Ended On";
  @override
  String EDITWORKEXPERIENCE_PAGE_isCurrent = "Is Current";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteSuccess =
      "Work experience deleted successfully";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteError =
      "Work experience deletion failed";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteConfirmationTitle =
      "Delete Work Experience";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteConfirmation =
      "Are you sure you want to delete this work experience?";
  @override
  String EDITWORKEXPERIENCE_PAGE_delete = "Delete";
  @override
  String EDITWORKEXPERIENCE_PAGE_deleteCancel = "Cancel";

  @override
  String EDITEDUCATION_PAGE_title = "Edit Education";
  @override
  String EDITEDUCATION_PAGE_save = "Save Education";
  @override
  String EDITEDUCATION_PAGE_saveSuccess = "Education edited successfully";
  @override
  String EDITEDUCATION_PAGE_saveError = "Education editing failed";
  @override
  String EDITEDUCATION_PAGE_deleteSuccess = "Education deleted successfully";
  @override
  String EDITEDUCATION_PAGE_deleteError = "Education deletion failed";
  @override
  String EDITEDUCATION_PAGE_deleteConfirmationTitle = "Delete Education";
  @override
  String EDITEDUCATION_PAGE_deleteConfirmation =
      "Are you sure you want to delete this education?";
  @override
  String EDITEDUCATION_PAGE_delete = "Delete";
  @override
  String EDITEDUCATION_PAGE_deleteCancel = "Cancel";

  @override
  String EDITCERTIFICATE_PAGE_title = "Edit Certificate";
  @override
  String EDITCERTIFICATE_PAGE_name = "Name";
  @override
  String EDITCERTIFICATE_PAGE_nameHelper = "Ex: PMP, AWS, CCNA";
  @override
  String EDITCERTIFICATE_PAGE_issuer = "Issuer";
  @override
  String EDITCERTIFICATE_PAGE_issuerHelper = "Ex: Cisco, PMI, AWS";
  @override
  String EDITCERTIFICATE_PAGE_certificateId = "Certificate ID";
  @override
  String EDITCERTIFICATE_PAGE_certificateIdHelper = "Ex: 1234567890";
  @override
  String EDITCERTIFICATE_PAGE_certificateUrl = "Certificate URL";
  @override
  String EDITCERTIFICATE_PAGE_certificateUrlHelper =
      "Ex: https://www.cisco.com";
  @override
  String EDITCERTIFICATE_PAGE_descriptionHelper =
      "Ex: This certificate is about ...";
  @override
  String EDITCERTIFICATE_PAGE_description = "Description";
  @override
  String EDITCERTIFICATE_PAGE_save = "Save Certificate";
  @override
  String EDITCERTIFICATE_PAGE_saveSuccess = "Certificate edited successfully";
  @override
  String EDITCERTIFICATE_PAGE_saveError = "Certificate editing failed";
  @override
  String EDITCERTIFICATE_PAGE_deleteSuccess = "Certificate removed succesfully";
  @override
  String EDITCERTIFICATE_PAGE_deleteError = "Certificate removal failed";
  @override
  String EDITCERTIFICATE_PAGE_deleteConfirmationTitle = "Delete Certificate";
  @override
  String EDITCERTIFICATE_PAGE_deleteConfirmation =
      "Are you sure you want to delete this certificate?";
  @override
  String EDITCERTIFICATE_PAGE_delete = "Delete";
  @override
  String EDITCERTIFICATE_PAGE_deleteCancel = "Cancel";

  @override
  String EDITSKILL_PAGE_title = "Edit Skills";
  @override
  String EDITSKILL_PAGE_selectYourProficiencyLevel =
      "Select your proficiency level";
  @override
  String EDITSKILL_PAGE_save = "Save";
  @override
  String EDITSKILL_PAGE_level1Title = "Beginner";
  @override
  String EDITSKILL_PAGE_level2Title = "Intermediate";
  @override
  String EDITSKILL_PAGE_level3Title = "Proficient";
  @override
  String EDITSKILL_PAGE_level4Title = "Advanced";
  @override
  String EDITSKILL_PAGE_level5Title = "Expert";
  @override
  String EDITSKILL_PAGE_level1Description =
      "You require guidance and support to complete tasks and are still building your fundamental understanding. Expect to engage in structured learning, follow tutorials, and practice foundational concepts.";
  @override
  String EDITSKILL_PAGE_level2Description =
      "You are comfortable using common tools and methods but may still need guidance for complex problems. Continued practice and real-world applications will help solidify your proficiency.";
  @override
  String EDITSKILL_PAGE_level3Description =
      "You understand best practices, can troubleshoot issues, and work efficiently. While you continue to learn and refine your expertise, you can effectively contribute to technical projects.";
  @override
  String EDITSKILL_PAGE_level4Description =
      "You can optimize workflows, mentor others, and contribute innovative solutions. Your expertise allows you to adapt to new situations and take on leadership roles in technical discussions.";
  @override
  String EDITSKILL_PAGE_level5Description =
      "You drive innovation, solve highly complex problems, and contribute to the development of new methodologies. Others look to you for mentorship, guidance, and expertise.";
  @override
  String EDITSKILL_PAGE_deleteConfirmationTitle = "Delete Skill";
  @override
  String EDITSKILL_PAGE_deleteConfirmation =
      "Are you sure you want to delete this skill?";
  @override
  String EDITSKILL_PAGE_delete = "Delete";
  @override
  String EDITSKILL_PAGE_deleteCancel = "Cancel";
  @override
  String EDITSKILL_PAGE_deleteSuccess = "Skill removed succesfully";
  @override
  String EDITSKILL_PAGE_saveSuccess = "Skill edited successfully";

  @override
  String MATCHINGS_PAGE_title = "Your matches";
  @override
  String MATCHINGS_PAGE_matchingSummaryA = "   You have ";
  @override
  String MATCHINGS_PAGE_matchingSummaryB = " matches already.";
  @override
  String MATCHINGS_PAGE_matchingSummaryHint =
      "    You can view your matching details with tapping on them.";
  @override
  String MATCHINGS_PAGE_filterBy = "Filter by";

  @override
  String MATCH_PAGE_title = "Match";
  @override
  String MATCH_PAGE_accept = "Accept";
  @override
  String MATCH_PAGE_reject = "Reject & Refer";
  @override
  String MATCH_PAGE_feature_1_title = "Work Type";
  @override
  String MATCH_PAGE_feature_2_title = "Expected Salary";
  @override
  String MATCH_PAGE_feature_3_title = "Scope";
  @override
  String MATCH_PAGE_feature_4_title = "Type of Position";
  @override
  String MATCH_PAGE_radar_title = "Match Radar";
  @override
  String MATCH_PAGE_skillCloud_title = "Skills that must be mastered";
  @override
  String MATCH_PAGE_accordion_title_1 = "Responsibilities";
  @override
  String MATCH_PAGE_accordion_title_2 = "Requirements";
  @override
  String MATCH_PAGE_accordion_title_3 = "About Us";

  @override
  String SETTINGS_PAGE_title = "Settings";
  @override
  String SETTINGS_PAGE_language = "Language";
  @override
  String SETTINGS_PAGE_changingLanguage = "Changing language...";
  @override
  String SETTINGS_PAGE_languageChanged = "Language changed successfully";
  @override
  String SETTINGS_PAGE_languageChangeFailed =
      "Language change failed. Please try again.";

  @override
  String PREFERENCES_PAGE_companySizeQuestion =
      "Would you like to work at companies of these sizes?";

  @override
  Map<String, String> PREFERENCES_PAGE_companySizeOptions = {
    "": "",
    "seed": "Seed (1-10 emp.)",
    "small": "Small (11-50 emp.)",
    "medium": "Mid (51-250 emp.)",
    "large": "Large (251-500 emp.)",
    "verylarge": "Very Large (501-1000 emp.)",
    "massive": "Massive (1000+ emp.)"
  };

  @override
  String PREFERENCES_PAGE_companyTypeQuestion =
      "What type of company should you work for?";

  @override
  Map<String, String> PREFERENCES_PAGE_companyTypeOptions = {
    "": "",
    "startup": "Startup",
    "corporate": "Corporate",
    "nonprofit": "Non-profit",
  };

  @override
  String PREFERENCES_PAGE_sectorsQuestion =
      "Would you like to work in these sectors?";

  @override
  String PREFERENCES_PAGE_typesOfPositionsQuestion =
      "What type of job are you interested in?";

  @override
  Map<String, String> PREFERENCES_PAGE_typesOfPositionsOptions = {
    "": "",
    "fulltime": "Full-time",
    "parttime": "Part-time",
    "contractor": "Contractor",
    "temporary": "Temporary",
    "freelancer": "Freelancer",
    "volunteer": "Volunteer",
    "internship": "Internship"
  };

  @override
  String PREFERENCES_PAGE_howUrgentYourHiringQuestion =
      "Where are you in your job search?";

  @override
  Map<String, String> PREFERENCES_PAGE_howUrgentIsYourHiringOptions = {
    "": "",
    "veryurgent": "Actively looking",
    "norush": "Open to new opportunities",
    "always": "Not looking",
  };

  @override
  String PREFERENCES_PAGE_seniorityLevelQuestion =
      "What is your seniority level in your last position?";

  @override
  Map<String, String> PREFERENCES_PAGE_seniorityLevelOptions = {
    "": "",
    "internship": "Internship",
    "juniorlevel": "Junior Level",
    "midlevel": "Mid Level",
    "seniorlevel": "Senior Level",
    "principallevel": "Principal Level",
    "techleader": "Tech Leader",
    "teamleader": "Team Leader",
    "manager": "Manager",
    "director": "Director",
    "head": "Head",
    "clevel": "C Level",
    "cofounder": "Co-Founder",
  };

  @override
  String PREFERENCES_PAGE_salaryExpectationQuestion =
      "How much is your current salary and salary expectation? (montly gross)";

  @override
  String PREFERENCES_PAGE_currentSalaryHint = "Current salary";

  @override
  String PREFERENCES_PAGE_salaryExpectationHint = "Salary Expectation";

  @override
  String PREFERENCES_PAGE_legalCountryQuestion =
      "Please select the countries where you are legally eligible to work";

  @override
  String PREFERENCES_PAGE_wantedCountryQuestion =
      "Please select the countries where you want to work.";

  @override
  String PREFERENCES_PAGE_workingMethodQuestion =
      "Which working methods would you prefer?";

  @override
  Map<String, String> PREFERENCES_PAGE_workingMethodOptions = {
    "": "",
    "onsite": "On-site",
    "remote": "Remote",
    "hybrid": "Hybrid",
  };

  @override
  String TAKE_SURVE_PAGE_title = "Expectations Survey";

  @override
  String TAKE_SURVE_PAGE_question = "Question ";

  @override
  String TAKE_SURVE_PAGE_previous = "Prev";

  @override
  String TAKE_SURVE_PAGE_next = "Next";

  @override
  String TAKE_SURVEY_PAGE_remainingPoints = "Remaining Points: ";

  @override
  String DASHBOARD_PAGE_title = "Dashboard";
  @override
  String DASHBOARD_PAGE_loadingRssFeed = "Loading RSS feed...";
  @override
  String DASHBOARD_PAGE_updateProfile = "Update Profile";
  @override
  String DASHBOARD_PAGE_lastUpdatedOn = "Last updated on ";
  @override
  String DASHBOARD_PAGE_fillSurvey = "Fill Survey";
  @override
  String DASHBOARD_PAGE_fillSurveyHeader = "Organizational Expectation";
  @override
  String DASHBOARD_PAGE_fillSurveyDescription =
      "Help us to understand your expectations from your ideal work environment.";
  @override
  String DASHBOARD_PAGE_showTests = "Show Tests";
  @override
  String DASHBOARD_PAGE_showTestsHeader = "Technical Assessments";
  @override
  String DASHBOARD_PAGE_showTestsDescription =
      "Fill survey to help us to qualify your skills.";

  @override
  String PROGRESSVIEWER_activityLevel = "Activity Level";

  @override
  String PROGRESSVIEWER_profileScore = "Profile Score";

  @override
  var PROGRESSVIEWER_levelNames = ["None", "Low", "Medium", "High", "Perfect"];

  @override
  String BOTTOM_NAVIGATION_BAR_profile = "Profile";
  @override
  String BOTTOM_NAVIGATION_BAR_dashboard = "Dashboard";
  @override
  String BOTTOM_NAVIGATION_BAR_matchings = "Matches";

  @override
  String START_SURVEY_PAGE_title = "Start Survey";
  @override
  String START_SURVEY_PAGE_startSurvey = "Let's Start Survey";
  @override
  String START_SURVEY_PAGE_description =
      "Fill the survey to help us understand your expectations from your ideal work environment.";

  @override
  String COMPLETE_SURVEY_PAGE_title = "Complete Survey";
  @override
  String COMPLETE_SURVEY_PAGE_completeSurvey =
      "Complete Survey";
  @override
  String COMPLETE_SURVEY_PAGE_description = "Thank you for completing the survey. Your responses will help us to understand your expectations from your ideal work environment.";
}
