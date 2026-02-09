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
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
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
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Future<ServiceResponse<String>> completeSurvey(String profileId, Survey survey) async {
    try {
      // Convert Survey to SurveyResponse format for backend
      var surveyResponseMap = _convertSurveyToSurveyResponse(survey);

      var response = await postAPIRequest(
          "talent/survey/completeSurvey", {"profileId": profileId, "surveyWithResponses": surveyResponseMap});

      if (response.isSuccess) {
        return ServiceResponse.success(
            responseObject: response.responseObject as String);
      } else {
        return ServiceResponse.fail(response.message,
            isUnauthorized: response.isUnauthorized);
      }
    } catch (e) {
      return ServiceResponse.fail(e);
    }
  }

  Map<String, dynamic> _convertSurveyToSurveyResponse(Survey survey) {
    // Extract data from questions and format as SurveyResponse
    Map<String, dynamic> response = {
      'completedAt': DateTime.now().toIso8601String(),
    };

    for (var question in survey.questions) {
      switch (question.key) {
        case 'desiredAttributes1':
          response['desiredAttributes1'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'desiredAttributes2':
          response['desiredAttributes2'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'organisationStructures':
          response['organisationStructure'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'organisationDefinitions':
          response['organisationDefinition'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'organisationBonds':
          response['organisationBonds'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'organisationValues':
          response['organisationValues'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'successFactors':
          response['successFactors'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'leadershipPerspectives':
          response['leadershipPerspective'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'teamWorks':
          response['teamWork'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'careerOpportunities':
          response['careerOpportunities'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'benefits':
          response['benefits'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'trainingOpportunities':
          response['trainingOpportunities'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'physicalConditions':
          response['physicalConditions'] = question.choices
              .where((c) => c.percent != null && c.percent! > 0)
              .map((c) => {'key': c.key, 'percentage': c.percent!.toInt()})
              .toList();
          break;
        case 'workhoursArrangements':
          // Single choice - find checked choice
          var checkedWorkhour = question.choices.firstWhere(
            (c) => c.checked == true,
            orElse: () => question.choices.first,
          );
          response['workHoursArrangement'] = checkedWorkhour.key;
          break;
        case 'priorities':
          // Drag selection - get selection order
          var orderedPriorities = question.choices
              .where((c) => c.selectionOrder != null)
              .map((c) => {'key': c.key, 'order': c.selectionOrder})
              .toList()
            ..sort((a, b) => (a['order'] as int).compareTo(b['order'] as int));
          response['priorities'] = orderedPriorities;
          break;
      }
    }

    return response;
  }
}
