part of 'survey_bloc.dart';

class SurveyState extends Equatable {
  //STATUS FIELDS
  //whether state is available or an inconsistent state like waiting for changes
  final bool isProcessing;
  //whether last action was successful or not
  final bool isSuccessful;
  //whether last action failed or not
  final bool isFailure;
  //info message according to last action
  final String infoMessage;

  final bool isSurveyCompleted;

  final List<String> messages;

  final bool canStartSurvey;

  final int remainingMinutesForNewSurvey;

  final int questionIndex;

  final Survey? survey;

  const SurveyState({ required this.isProcessing, required this.isSuccessful, required this.isFailure, required this.infoMessage, required this.isSurveyCompleted, required this.messages, required this.canStartSurvey, required this.remainingMinutesForNewSurvey,  required this.questionIndex, required this.survey});

  @override
  List<Object?> get props => [isProcessing, isSuccessful, isFailure, remainingMinutesForNewSurvey, isSurveyCompleted, canStartSurvey, survey, questionIndex];

  SurveyState processing({
    bool? isSurveyCompleted,
    List<String>? messages,
    bool? canStartSurvey,
    int? remainingMinutesForNewSurvey,
    int? questionIndex,
    Survey? survey,
  }) {
    return copyWith(
      isProcessing: true,
      isSuccessful: false,
      isFailure: false,
      infoMessage: '',
      isSurveyCompleted: isSurveyCompleted ?? this.isSurveyCompleted,
      messages: messages ?? this.messages,
      canStartSurvey: canStartSurvey ?? this.canStartSurvey,
      remainingMinutesForNewSurvey: remainingMinutesForNewSurvey ?? this.remainingMinutesForNewSurvey,
      questionIndex: questionIndex ?? this.questionIndex,
      survey: survey ?? this.survey,
    );
  }

  SurveyState success({
    String? infoMessage,
    bool? isSurveyCompleted,
    List<String>? messages,
    bool? canStartSurvey,
    int? remainingMinutesForNewSurvey,
    int? questionIndex,
    Survey? survey,
  }) {
    return copyWith(
      isProcessing: false,
      isSuccessful: true,
      isFailure: false,
      infoMessage: infoMessage,
      isSurveyCompleted: isSurveyCompleted ?? this.isSurveyCompleted,
      messages: messages ?? this.messages,
      canStartSurvey: canStartSurvey ?? this.canStartSurvey,
      remainingMinutesForNewSurvey: remainingMinutesForNewSurvey ?? this.remainingMinutesForNewSurvey,
      questionIndex: questionIndex ?? this.questionIndex,
      survey: survey ?? this.survey,
    );
  }

  SurveyState failure({
    String? infoMessage,
    bool? isSurveyCompleted,
    List<String>? messages,
    bool? canStartSurvey,
    int? remainingMinutesForNewSurvey,
    int? questionIndex,
    Survey? survey,
  }) {
    return copyWith(
      isProcessing: false,
      isSuccessful: false,
      isFailure: true,
      infoMessage: infoMessage,
      isSurveyCompleted: isSurveyCompleted ?? this.isSurveyCompleted,
      messages: messages ?? this.messages,
      canStartSurvey: canStartSurvey ?? this.canStartSurvey,
      remainingMinutesForNewSurvey: remainingMinutesForNewSurvey ?? this.remainingMinutesForNewSurvey,
      questionIndex: questionIndex ?? this.questionIndex,
      survey: survey ?? this.survey,
    );
  }

  SurveyState copyWith({
    bool? isProcessing,
    bool? isSuccessful,
    bool? isFailure,
    String? infoMessage,
    bool? isSurveyCompleted,
    List<String>? messages,
    bool? canStartSurvey,
    int? remainingMinutesForNewSurvey,
    int? questionIndex,
    Survey? survey,
  }) {
    return SurveyState(
      isProcessing: isProcessing ?? this.isProcessing,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      isFailure: isFailure ?? this.isFailure,
      infoMessage: infoMessage ?? this.infoMessage,
      isSurveyCompleted: isSurveyCompleted ?? this.isSurveyCompleted,
      messages: messages ?? this.messages,
      canStartSurvey: canStartSurvey ?? this.canStartSurvey,
      remainingMinutesForNewSurvey: remainingMinutesForNewSurvey ?? this.remainingMinutesForNewSurvey,
      questionIndex: questionIndex ?? this.questionIndex,
      survey: survey ?? this.survey,
    );
  }
}
