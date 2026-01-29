part of 'survey_bloc.dart';

sealed class SurveyEvent extends Equatable {
  const SurveyEvent();

  @override
  List<Object> get props => [];
}

class GetSurveyTemplateEvent extends SurveyEvent {
  final String languageCode;

  const GetSurveyTemplateEvent(this.languageCode);
}

class ClearSurveyStateEvent extends SurveyEvent {
  const ClearSurveyStateEvent();
}

class CanTakeSurveyEvent extends SurveyEvent {
  final String profileId;

  const CanTakeSurveyEvent(this.profileId);
}

class NextQuestionEvent extends SurveyEvent {
  const NextQuestionEvent();
}

class PrevQuestionEvent extends SurveyEvent {
  const PrevQuestionEvent();
}

class CompleteSurveyEvent extends SurveyEvent {
  final String profileId;
  final Survey survey;

  const CompleteSurveyEvent({
    required this.profileId,
    required this.survey,
  });

  @override
  List<Object> get props => [profileId, survey];
}