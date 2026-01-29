import 'package:ytnkio/models/profile/preferences.dart';
import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/models/profile/profile.dart';
import 'package:ytnkio/services/profile/profile_service.dart';

class ProfileRepository {
  ProfileService service = ProfileService();

  Future<ServiceResponse<Profile>> getProfile(String profileId) async {
    return service.getProfile(profileId);
  }

  Future<ServiceResponse<Profile>> getProfileFromEmail(String email) async {
    return service.getProfileFromEmail(email);
  }

  Future<ServiceResponse<void>> updateProfileSummary(
      String profileId, String summary) async {
    return service.updateProfileSummary(profileId, summary);
  }

  Future<ServiceResponse<void>> updateProfileHeadline(
      String profileId, String headline) async {
    return service.updateProfileHeadline(profileId, headline);
  }

  Future<ServiceResponse<void>> saveFullProfile(Profile profile) async {
    return service.saveFullProfile(profile);
  }

  Future<ServiceResponse<void>> savePreferences(
      String profileId, Preferences preferences) async {
    return service.savePreferences(profileId, preferences);
  }

  Future<ServiceResponse<void>> changeLanguage(
      String profileId, String languageCode) async {
    return service.changeLanguage(profileId, languageCode);
  }
}
