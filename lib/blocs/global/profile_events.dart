part of 'global_bloc.dart';

class GetProfileEvent extends GlobalEvent {
  final String profileId;

  GetProfileEvent({required this.profileId});
}

class GetProfileFromEmailEvent extends GlobalEvent {
  final String email;

  GetProfileFromEmailEvent({required this.email});
}

class FillProfileFromResumeEvent extends GlobalEvent {
  final LinkedinPdfResume resume;

  FillProfileFromResumeEvent({required this.resume});
}

class UpdateAvatarEvent extends GlobalEvent {
  final String profileId;
  final File avatar;

  UpdateAvatarEvent(this.profileId, this.avatar);
}

class UpdateHeadlineEvent extends GlobalEvent {
  final String profileId;
  final String headline;

  UpdateHeadlineEvent(this.profileId, this.headline);
}

class UpdateSummaryEvent extends GlobalEvent {
  final String profileId;
  final String summary;

  UpdateSummaryEvent(this.profileId, this.summary);
}

class UpdatePersonalInfoEvent extends GlobalEvent {
  final String firstName;
  final String lastName;
  final String country;
  final String city;
  final String address;
  final Phone phone;
  final String website;
  final SocialAccountInfo? linkedin;
  final SocialAccountInfo? github;
  final SocialAccountInfo? x;
  final SocialAccountInfo? facebook;
  final SocialAccountInfo? instagram;

  UpdatePersonalInfoEvent({
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.city,
    required this.address,
    required this.phone,
    required this.website,
    required this.linkedin,
    required this.github,
    required this.x,
    required this.facebook,
    required this.instagram,
  });
}

class UpdateWorkExperienceEvent extends GlobalEvent {
  final String profileId;
  final WorkExperience workExperience;

  UpdateWorkExperienceEvent(this.profileId, this.workExperience);
}

class DeleteWorkExperienceEvent extends GlobalEvent {
  final String workExperienceId;

  DeleteWorkExperienceEvent(this.workExperienceId);
}

class UpdateEducationEvent extends GlobalEvent {
  final String profileId;
  final Education education;

  UpdateEducationEvent(this.profileId, this.education);
}

class DeleteEducationEvent extends GlobalEvent {
  final String educationId;

  DeleteEducationEvent(this.educationId);
}

class UpdateCertificateEvent extends GlobalEvent {
  final String profileId;
  final Certificate certificate;

  UpdateCertificateEvent(this.profileId, this.certificate);
}

class DeleteCertificateEvent extends GlobalEvent {
  final String certificateId;

  DeleteCertificateEvent(this.certificateId);
}

class AddSkillsEvent extends GlobalEvent {
  final List<Item> skills;

  AddSkillsEvent({required this.skills});
}

class UpdateSkillEvent extends GlobalEvent {
  final String profileId;
  final Skill skill;

  UpdateSkillEvent(this.profileId, this.skill);
}

class DeleteSkillEvent extends GlobalEvent {
  final String skillId;

  DeleteSkillEvent(this.skillId);
}

class SaveFullProfileEvent extends GlobalEvent {
  final Profile profile;

  SaveFullProfileEvent(this.profile);
}

class UpdatePreferencesEvent extends GlobalEvent {
  final Preferences preferences;

  UpdatePreferencesEvent({required this.preferences});
}

class SavePreferencesEvent extends GlobalEvent {
  final String profileId;
  final Preferences preferences;

  SavePreferencesEvent({required this.profileId, required this.preferences});
}

class ChangeLanguageEvent extends GlobalEvent {
  final String profileId;
  final String languageCode;

  ChangeLanguageEvent({required this.profileId, required this.languageCode});
}
