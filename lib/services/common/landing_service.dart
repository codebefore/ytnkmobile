import 'package:shared_preferences/shared_preferences.dart';
import 'package:ytnkio/services/base/service_response.dart';

class LandingService {
  Future<ServiceResponse<void>> completeLanding() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setBool("isLandingComplete", true);

      return ServiceResponse.success();
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<void>> unCompleteLanding() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLandingComplete", false);

      return ServiceResponse.success();
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<bool>> retrieveLandingStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var isLandingComplete = prefs.getBool("isLandingComplete") ?? false;

      return ServiceResponse.success(responseObject: isLandingComplete);
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }
}
