part of 'global_bloc.dart';

extension ProfileMethods on GlobalBloc {
  FutureOr<void> _getProfile(
      GetProfileEvent event, Emitter<GlobalState> emit) async {
    var response = await _profileRepository.getProfile(event.profileId);

    if (response.isSuccess) {
      emit(
        state.copyWith(
          profileStatus: response.responseObject == null
              ? ProfileStatus.noProfile
              : ProfileStatus.hasProfile,
          profile: response.responseObject!,
        ),
      );
    } else {
      emit(state.copyWith(
          profileStatus: ProfileStatus.unknown, profile: Profile.initial()));
    }
  }

  FutureOr<void> _getProfileFromEmail(
      GetProfileFromEmailEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing());

    var response = await _profileRepository.getProfileFromEmail(event.email);

    if (response.isSuccess) {
      emit(
        state.success(
          profileStatus: response.responseObject == null
              ? ProfileStatus.noProfile
              : ProfileStatus.hasProfile,
          profile: response.responseObject == null
              ? Profile.initial()
              : response.responseObject!,
        ),
      );
    } else {
      emit(state.failure(
        isAuthenticated: !response.isUnauthorized,
        profileStatus: ProfileStatus.unknown,
        profile: Profile.initial(),
        infoMessage: "No profile found for this email.",
      ));
    }
  }

  FutureOr<void> _fillProfileFromResume(
      FillProfileFromResumeEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.fillProfileFromResume));

    var skills = await FuzzySearchService()
        .extractKeywords("skills", event.resume.toString());

    event.resume.topSkills = LinkedinTopSkillsPdfSection.fromList(skills);

    emit(
      state.success(
        profileStatus: state.profileStatus,
        isProfileDirty: true,
        profile: state.profile.fillFromLinkedinPdfResume(event.resume),
      ),
    );
  }

  FutureOr<void> _updateAvatar(
      UpdateAvatarEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editProfileAvatar));

    try {
      var avatarId = IDGenerator.generateObjectId();

      var response = await _avatarRepository.updateProfileAvatar(
          event.profileId, avatarId, event.avatar);

      if (response.isSuccess) {
        emit(
          state.success(
            profile: state.profile.copyWith(avatarId: avatarId),
          ),
        );
      } else {
        emit(state.failure(
            infoMessage: response.message,
            isAuthenticated: !response.isUnauthorized));
      }
    } catch (e) {
      emit(state.failure(
        infoMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _updateHeadline(
      UpdateHeadlineEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editProfileHeadline));

    try {
      var response = await _profileRepository.updateProfileHeadline(
          event.profileId, event.headline);

      if (response.isSuccess) {
        emit(
          state.success(
            profile: state.profile.copyWith(
                headline: event.headline,
                completeness: double.parse(response.responseObject as String)),
          ),
        );
      } else {
        emit(state.failure(
            infoMessage: response.message,
            isAuthenticated: !response.isUnauthorized));
      }
    } catch (e) {
      emit(state.failure(
        infoMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _updateSummary(
      UpdateSummaryEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editProfileSummary));

    try {
      var response = await _profileRepository.updateProfileSummary(
          event.profileId, event.summary);

      if (response.isSuccess) {
        emit(
          state.success(
            profile: state.profile.copyWith(
                summary: event.summary,
                completeness: double.parse(response.responseObject as String)),
          ),
        );
      } else {
        emit(state.failure(
            infoMessage: response.message,
            isAuthenticated: !response.isUnauthorized));
      }
    } catch (e) {
      emit(state.failure(
        infoMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _updatePersonalInfo(
      UpdatePersonalInfoEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editProfilePersonalInfo));

    List<SocialAccountInfo> socialAccounts = [];

    if (event.linkedin != null) {
      socialAccounts.add(event.linkedin!);
    }

    if (event.github != null) {
      socialAccounts.add(event.github!);
    }

    if (event.x != null) {
      socialAccounts.add(event.x!);
    }

    if (event.facebook != null) {
      socialAccounts.add(event.facebook!);
    }

    if (event.instagram != null) {
      socialAccounts.add(event.instagram!);
    }

    var updatedProfile = state.profile.copyWith(
        firstName: event.firstName,
        lastName: event.lastName,
        location: Location(
          country: event.country,
          state: event.city,
          city: event.city,
          address: event.address,
        ),
        phones: [event.phone],
        websites: [event.website],
        socialAccounts: socialAccounts);

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _updateWorkExperience(
      UpdateWorkExperienceEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editWorkExperience));

    if (state.profile.workExperiences.isEmpty) {
      emit(state.success(
        profile: state.profile.copyWith(
          workExperiences: [event.workExperience],
        ),
      ));

      return;
    }

    var objInState = state.profile.workExperiences
        .where((x) => x.id == event.workExperience.id)
        .firstOrNull;

    Profile? updatedProfile;

    if (objInState == null) {
      updatedProfile = state.profile.copyWith(
        workExperiences: [
          ...state.profile.workExperiences,
          event.workExperience,
        ],
      );
    } else {
      updatedProfile = state.profile.copyWith(
        workExperiences: state.profile.workExperiences
            .map((e) =>
                e.id == event.workExperience.id ? event.workExperience : e)
            .toList(),
      );
    }

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _deleteWorkExperience(
      DeleteWorkExperienceEvent event, Emitter<GlobalState> emit) {
    emit(state.processing(lastOperation: Operations.deleteWorkExperience));

    var updatedProfile = state.profile.copyWith(
      workExperiences: state.profile.workExperiences
          .where((x) => x.id != event.workExperienceId)
          .toList(),
    );

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _updateEducation(
      UpdateEducationEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editEducation));

    if (state.profile.educations.isEmpty) {
      emit(state.success(
        profile: state.profile.copyWith(
          educations: [event.education],
        ),
      ));

      return;
    }

    var objInState = state.profile.educations
        .where((x) => x.id == event.education.id)
        .firstOrNull;

    Profile? updatedProfile;

    if (objInState == null) {
      updatedProfile = state.profile.copyWith(
        educations: [
          ...state.profile.educations,
          event.education,
        ],
      );
    } else {
      updatedProfile = state.profile.copyWith(
        educations: state.profile.educations
            .map((e) => e.id == event.education.id ? event.education : e)
            .toList(),
      );
    }

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _deleteEducation(
      DeleteEducationEvent event, Emitter<GlobalState> emit) {
    emit(state.processing(lastOperation: Operations.deleteEducation));

    var updatedProfile = state.profile.copyWith(
      educations: state.profile.educations
          .where((x) => x.id != event.educationId)
          .toList(),
    );

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _updateCertificate(
      UpdateCertificateEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editCertificate));

    if (state.profile.certificates.isEmpty) {
      emit(state.success(
        profile: state.profile.copyWith(
          certificates: [event.certificate],
        ),
      ));

      return;
    }

    var objInState = state.profile.certificates
        .where((x) => x.id == event.certificate.id)
        .firstOrNull;

    Profile? updatedProfile;

    if (objInState == null) {
      updatedProfile = state.profile.copyWith(
        certificates: [
          ...state.profile.certificates,
          event.certificate,
        ],
      );
    } else {
      updatedProfile = state.profile.copyWith(
        certificates: state.profile.certificates
            .map((e) => e.id == event.certificate.id ? event.certificate : e)
            .toList(),
      );
    }

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _deleteCertificate(
      DeleteCertificateEvent event, Emitter<GlobalState> emit) {
    emit(state.processing(lastOperation: Operations.deleteCertificate));

    var updatedProfile = state.profile.copyWith(
      certificates: state.profile.certificates
          .where((x) => x.id != event.certificateId)
          .toList(),
    );

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _addSkills(AddSkillsEvent event, Emitter<GlobalState> emit) {
    emit(state.processing(lastOperation: Operations.addSkills));

    var addedSkills = event.skills
        .map((e) => Skill(
              id: IDGenerator.generateObjectId(),
              name: e.key,
              text: e.text,
              point: 0,
            ))
        .toList();

    var updatedProfile = state.profile.copyWith(
      skills: [...state.profile.skills, ...addedSkills],
    );

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _updateSkill(
      UpdateSkillEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.editSkill));

    if (state.profile.skills.isEmpty) {
      emit(state.success(
        profile: state.profile.copyWith(
          skills: [event.skill],
        ),
      ));

      return;
    }

    var objInState =
        state.profile.skills.where((x) => x.id == event.skill.id).firstOrNull;

    Profile? updatedProfile;

    if (objInState == null) {
      updatedProfile = state.profile.copyWith(
        skills: [
          ...state.profile.skills,
          event.skill,
        ],
      );
    } else {
      updatedProfile = state.profile.copyWith(
        skills: state.profile.skills
            .map((e) => e.id == event.skill.id ? event.skill : e)
            .toList(),
      );
    }

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _deleteSkill(
      DeleteSkillEvent event, Emitter<GlobalState> emit) {
    emit(state.processing(lastOperation: Operations.deleteSkill));

    var updatedProfile = state.profile.copyWith(
      skills: state.profile.skills.where((x) => x.id != event.skillId).toList(),
    );

    emit(state.success(profile: updatedProfile, isProfileDirty: true));
  }

  FutureOr<void> _saveFullProfile(
      SaveFullProfileEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.saveProfile));

    try {
      var response = await _profileRepository.saveFullProfile(event.profile);

      if (response.isSuccess) {
        emit(state.success(
          isProfileDirty: false,
          profile: event.profile.copyWith(
              completeness: double.parse(response.responseObject as String)),
        ));
      } else {
        emit(state.failure(
            infoMessage: response.message,
            isAuthenticated: !response.isUnauthorized));
      }
    } catch (e) {
      emit(state.failure(
        infoMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _updatePreferences(
      UpdatePreferencesEvent event, Emitter<GlobalState> emit) {
    emit(
      state.success(
          isPreferencesDirty: true,
          lastOperation: Operations.editPreferences,
          profile: state.profile.copyWith(preferences: event.preferences)),
    );
  }

  FutureOr<void> _savePreferences(
      SavePreferencesEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.savePreferences));

    try {
      var response = await _profileRepository.savePreferences(
          event.profileId, event.preferences);

      if (response.isSuccess) {
        emit(state.success(
          isPreferencesDirty: false,
          profile: state.profile.copyWith(
              preferences: event.preferences,
              completeness: double.parse(response.responseObject as String)),
        ));
      } else {
        emit(state.failure(
            infoMessage: response.message,
            isAuthenticated: !response.isUnauthorized));
      }
    } catch (e) {
      emit(state.failure(
        infoMessage: e.toString(),
      ));
    }
  }

  FutureOr<void> _changeLanguage(
      ChangeLanguageEvent event, Emitter<GlobalState> emit) async {
    emit(state.processing(lastOperation: Operations.changeLanguage));

    try {
      var response = await _profileRepository.changeLanguage(
          event.profileId, event.languageCode);

      if (response.isSuccess) {
        emit(
          state.success(
            profile: state.profile.copyWith(languageCode: event.languageCode),
          ),
        );
      } else {
        emit(state.failure(
            infoMessage: response.message,
            isAuthenticated: !response.isUnauthorized));
      }
    } catch (e) {
      emit(state.failure(
        infoMessage: e.toString(),
      ));
    }
  }
}
