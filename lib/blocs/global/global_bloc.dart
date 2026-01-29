import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:wonderpush_flutter/wonderpush_flutter.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/models/common/item.dart';
import 'package:ytnkio/models/common/location.dart';
import 'package:ytnkio/models/common/phone.dart';
import 'package:ytnkio/models/common/social_account_info.dart';
import 'package:ytnkio/models/profile/certificate.dart';
import 'package:ytnkio/models/profile/education.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_pdf_resume.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_top_skills_pdf_section.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/models/profile/preferences.dart';
import 'package:ytnkio/models/profile/skill.dart';
import 'package:ytnkio/models/profile/profile.dart';
import 'package:ytnkio/models/profile/work_experience.dart';
import 'package:ytnkio/blocs/bloc_exports.dart';
import 'package:ytnkio/repos/avatar_repository.dart';
import 'package:ytnkio/repos/matching_repository.dart';
import 'package:ytnkio/repos/profile_repository.dart';
import 'package:ytnkio/services/auth/auth_service.dart';
import 'package:ytnkio/services/common/fuzzy_search_service.dart';
import 'package:ytnkio/services/common/id_generator.dart';
import 'package:ytnkio/services/common/landing_service.dart';

part 'global_state.dart';
part 'landing_events.dart';
part 'landing_methods.dart';
part 'auth_events.dart';
part 'auth_methods.dart';
part 'profile_events.dart';
part 'profile_methods.dart';
part 'match_events.dart';
part 'match_methods.dart';

@immutable
abstract class GlobalEvent {}

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final LandingService _landingService = LandingService();
  final AuthService _authService = AuthService();
  final ProfileRepository _profileRepository = ProfileRepository();
  final AvatarRepository _avatarRepository = AvatarRepository();
  final MatchRepository _matchRepository = MatchRepository();

  GlobalBloc() : super(GlobalState.initial()) {
    //landing related events
    on<RetrieveLandingStatusEvent>(_landingStatusRetrieved);
    on<CompleteLandingEvent>(_landingCompleted);
    on<UncompleteLandingEvent>(_landingNotCompleted);

    //auth (login, signup, logout, forgot password, etc.) related events
    on<RetrieveDeviceIdEvent>(_retrieveDeviceIdEvent);
    on<LoginWithEmailPasswordEvent>(_loggedInWithEmailPassword);
    on<LoginWithGoogleEvent>(_loggedInWithGoogle);
    on<LogoutEvent>(_loggedout);
    on<SignupWithGoogleEvent>(_signupWithGoogle);
    on<SignupEvent>(_signup);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<SendVerificationEmailEvent>(_sendVerificationEmail);
    on<VerifyEmailEvent>(_verifyEmail);

    //profile related events
    on<GetProfileEvent>(_getProfile);
    on<GetProfileFromEmailEvent>(_getProfileFromEmail);

    on<FillProfileFromResumeEvent>(_fillProfileFromResume);

    on<UpdateAvatarEvent>(_updateAvatar);
    on<UpdateHeadlineEvent>(_updateHeadline);
    on<UpdateSummaryEvent>(_updateSummary);
    on<UpdatePersonalInfoEvent>(_updatePersonalInfo);

    on<UpdateWorkExperienceEvent>(_updateWorkExperience);
    on<DeleteWorkExperienceEvent>(_deleteWorkExperience);

    on<UpdateEducationEvent>(_updateEducation);
    on<DeleteEducationEvent>(_deleteEducation);

    on<UpdateCertificateEvent>(_updateCertificate);
    on<DeleteCertificateEvent>(_deleteCertificate);

    on<AddSkillsEvent>(_addSkills);
    on<UpdateSkillEvent>(_updateSkill);
    on<DeleteSkillEvent>(_deleteSkill);

    on<SaveFullProfileEvent>(_saveFullProfile);

    on<UpdatePreferencesEvent>(_updatePreferences);
    on<SavePreferencesEvent>(_savePreferences);

    on<ChangeLanguageEvent>(_changeLanguage);

    //matching related events
    on<RetrieveUsersMatchesEvent>(_getUsersMatches);
  }
}
