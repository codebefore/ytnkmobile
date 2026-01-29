import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/services/match/match_service.dart';

class MatchRepository {
  MatchService service = MatchService();

  Future<ServiceResponse<List<Match>>> getProfileMatches(
      String profileId, String language) async {
    return service.getProfileMatches(profileId, language);
  }
}
