import 'package:ytnkio/models/survey/can_take_survey_result.dart';
import 'package:ytnkio/services/base/service_response.dart';
import 'package:ytnkio/models/survey/survey.dart';
import 'package:ytnkio/services/survey/survey_service.dart';

class SurveyRepository {
  SurveyService surveyService = SurveyService();

  Future<ServiceResponse<Survey>> getSurveyTemplate(String languageCode) async {
    return surveyService.getSurveyTemplate(languageCode);
  }

  Future<ServiceResponse<CanTakeSurveyResult>> canTakeSurvey(String profileId) async {
    return surveyService.canTakeSurvey(profileId);
  }

  Future<ServiceResponse<String>> completeSurvey(String profileId, Survey survey) async {
    return surveyService.completeSurvey(profileId, survey);
  }
}
