import 'package:ytnkio/models/profile/preferences.dart';
import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/services/base/service_base.dart';
import 'package:ytnkio/models/profile/profile.dart';

class ProfileService extends ServiceBase {
  Future<ServiceResponse<Profile>> getProfile(String profileId) async {
    try {
      var response =
          await postAPIRequest("talent/profile/getprofile", {"profileId": profileId});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: Profile.fromJson(response.responseObject!));
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<Profile>> getProfileFromEmail(String email) async {
    try {
      var response =
          await postAPIRequest("talent/profile/getprofilefromemail", {"email": email});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: Profile.fromJson(response.responseObject!));
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> updateProfileSummary(
      String profileId, String summary) async {
    try {
      var response = await postAPIRequest("talent/profile/updateprofilesummary", {
        "profileId": profileId,
        "summary": summary,
      });

      if (response.isSuccess) {
        return ServiceResponse.success(responseObject: response.responseObject);
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> updateProfileHeadline(
      String profileId, String headline) async {
    try {
      var response = await postAPIRequest("talent/profile/updateprofileheadline", {
        "profileId": profileId,
        "headline": headline,
      });

      if (response.isSuccess) {
        return ServiceResponse.success(responseObject: response.responseObject);
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> saveFullProfile(Profile profile) async {
    try {
      var response = await postAPIRequest("talent/profile/savefullprofile", profile.toMap());

      if (response.isSuccess) {
        return ServiceResponse.success(responseObject: response.responseObject);
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> savePreferences(
      String profileId, Preferences preferences) async {
    try {
      var response = await postAPIRequest("talent/profile/savepreferences", {
        "profileId": profileId,
        "preferences": preferences.toMap(),
      });

      if (response.isSuccess) {
        return ServiceResponse.success(responseObject: response.responseObject);
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> changeLanguage(
      String profileId, String languageCode) async {
    try {
      var response = await postAPIRequest("talent/profile/changeLanguage", {
        "profileId": profileId,
        "languageCode": languageCode,
      });

      if (response.isSuccess) {
        return ServiceResponse.success(responseObject: response.responseObject);
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }
}
