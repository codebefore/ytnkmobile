import 'package:ytnkio/models/survey/can_take_survey_result.dart';
import 'package:ytnkio/services/base/service_base.dart';
import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/models/survey/survey.dart';

class SurveyService extends ServiceBase {
  Future<ServiceResponse<Survey>> getSurveyTemplate(String languageCode) async {
    try {
      var response = await postAPIRequest(
          "talent/survey/getSurveyTemplate", {"languageCode": languageCode});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: Survey.fromJson(response.responseObject!));
      } else {
        return ServiceResponse.fail(response.message);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<CanTakeSurveyResult>> canTakeSurvey(String profileId) async {
    try {
      var response = await postAPIRequest("talent/survey/canTakeSurvey", {"profileId": profileId, "surveyWithResponses": null});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: CanTakeSurveyResult.fromJson(response.responseObject!)
        );
      } else {
        return ServiceResponse.fail(response.message);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<String>> completeSurvey(String profileId, Survey survey) async {
    try {
      var response = await postAPIRequest(
          "talent/survey/completeSurvey", {"profileId": profileId, "surveyWithResponses": survey.toMap()});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: response.responseObject as String);
      } else {
        return ServiceResponse.fail(response.message);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }
}
