part of 'survey_bloc.dart';

extension SurveyMethods on SurveyBloc {
  Future<void> _canTakeSurvey(CanTakeSurveyEvent event, emit) async {
    emit(state.processing());

    var response = await _surveyRepository.canTakeSurvey(event.profileId);

    if (response.isSuccess) {
      var result = response.responseObject as CanTakeSurveyResult;

      emit(state.success(
          canStartSurvey: result.canTakeSurvey,
          remainingMinutesForNewSurvey: result.remainingMinutesForNewSurvey));
    } else {
      emit(state.failure(canStartSurvey: false));
    }
  }

  Future<void> _clearSurveyState(ClearSurveyStateEvent event, emit) async {
    emit(state.processing());

    var clearedSurvey = state.survey;

    if (clearedSurvey != null) {
      for (var question in clearedSurvey.questions) {
        if (question.availablePercentage != null) {
          question.availablePercentage = 100.0;
        }

        for (var choice in question.choices) {
          choice.checked = null;
          choice.percent = null;
          choice.selectionOrder = null;
        }
      }
    }

    emit(state.success(
        infoMessage: "",
        questionIndex: 0,
        survey: clearedSurvey));
  }

  Future<void> _getSurveyTemplate(GetSurveyTemplateEvent event, emit) async {
    emit(state.processing());

    var response = await _surveyRepository.getSurveyTemplate(event.languageCode);

    if (response.isSuccess) {
      emit(state.success(
          survey: response.responseObject, questionIndex: 0));
    } else {
      emit(state.failure(survey: null, questionIndex: 0));
    }
  }

  Future<void> _moveNextQuestion(NextQuestionEvent event, emit) async {
    emit(state.processing());

    if (state.questionIndex < state.survey!.questions.length - 1) {
      emit(state.success(
          survey: state.survey, questionIndex: state.questionIndex + 1));
    }
  }

  Future<void> _movePrevQuestion(PrevQuestionEvent event, emit) async {
    emit(state.processing());
    
    if (state.questionIndex > 0) {
      emit(state.success(
          survey: state.survey, questionIndex: state.questionIndex - 1));
    }
  }

  Future<void> _completeSurvey(CompleteSurveyEvent event, emit) async {
    emit(state.processing());

    var response =
        await _surveyRepository.completeSurvey(event.profileId, event.survey);

    if (response.isSuccess) {
      emit(state.success(
          isSurveyCompleted: true,
          infoMessage: response.message));
    } else {
      emit(state.failure(
        isSurveyCompleted: false,
        infoMessage: response.message));
    }
  }
}