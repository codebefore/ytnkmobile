import 'dart:io';
import 'dart:typed_data';

import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/services/profile/avatar_service.dart';

class AvatarRepository {
  AvatarService service = AvatarService();

  static String cachedProfileId = "";
  static Uint8List? cachedAvatar;

  Future<ServiceResponse<void>> updateProfileAvatar(
      String profileId, String avatarId, File avatar) async {
    var response =
        await service.updateProfileAvatar(profileId, avatarId, avatar);

    if (response.isSuccess) {
      cachedProfileId = "";
      cachedAvatar = null;
    }

    return response;
  }

  Future<ServiceResponse<Uint8List>> getProfileAvatar(String profileId) async {
    if (profileId.isEmpty) {
      return ServiceResponse.fail("Profile ID is empty");
    }

    if (profileId == cachedProfileId && cachedAvatar != null) {
      return ServiceResponse.success(responseObject: cachedAvatar);
    }

    var response = await service.getProfileAvatar(profileId);

    if (response.isSuccess) {
      cachedProfileId = profileId;
      cachedAvatar = response.responseObject;
    }

    return response;
  }
}
