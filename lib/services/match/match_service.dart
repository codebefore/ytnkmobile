import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/services/base/service_base.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchService extends ServiceBase {
  Future<ServiceResponse<List<Match>>> getProfileMatches(
      String profileId, String language) async {
    try {
      var response =
          await postAPIRequest("match/getprofilematches", {"profileId": profileId, "language": language});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: Match.fromJsonList(response.responseObject!));
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> acceptMatch(String matchId) async {
    try {
      final response = await postAPIRequest("match/accept/$matchId", {});
      if (response.isSuccess) {
        return ServiceResponse.success();
      }

      return ServiceResponse.fail(response.message,
          isUnauthorized: response.isUnauthorized);
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> rejectMatch(String matchId,
      {bool alsoRefer = false, String email = ""}) async {
    try {
      final response = await postAPIRequest("match/reject/$matchId", {
        "alsoRefer": alsoRefer,
        "email": email,
      });

      if (response.isSuccess) {
        return ServiceResponse.success();
      }

      return ServiceResponse.fail(response.message,
          isUnauthorized: response.isUnauthorized);
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }
}
