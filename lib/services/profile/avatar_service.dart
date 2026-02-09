import 'dart:io';
import 'dart:typed_data';

import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/services/base/service_base.dart';

class AvatarService extends ServiceBase {
  Future<ServiceResponse<void>> updateProfileAvatar(
      String profileId, String avatarId, File file) async {
    try {
      var response = await postAPIRequestWithFormFile(
          "talent/profile/updateProfileAvatar",
          {
            "profileId": profileId,
            "avatarId": avatarId,
          },
          "avatar",
          file);

      if (response.isSuccess) {
        return ServiceResponse.success();
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<Uint8List>> getProfileAvatar(String profileId) async {
    try {
      var response = await postAPIRequestForImage(
        "talent/profile/getProfileAvatar",
        {
          "profileId": profileId,
        },
      );

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
