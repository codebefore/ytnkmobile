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
}
