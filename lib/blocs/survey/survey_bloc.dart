import 'package:ytnkio/blocs/bloc_exports.dart';
import 'package:ytnkio/models/survey/can_take_survey_result.dart';
import 'package:ytnkio/models/survey/survey.dart';
import 'package:ytnkio/repos/survey_repository.dart';

part 'survey_event.dart';
part 'survey_state.dart';
part 'survey_methods.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {

  final SurveyRepository _surveyRepository = SurveyRepository();

  SurveyBloc() : super(const SurveyState(isProcessing: false, isSuccessful: false, isFailure: false, infoMessage: "", isSurveyCompleted: false, messages: [], canStartSurvey: false, remainingMinutesForNewSurvey: 180 * 24 * 60, survey: null, questionIndex: 0)) {
    on<CanTakeSurveyEvent>(_canTakeSurvey);
    on<ClearSurveyStateEvent>(_clearSurveyState);
    on<GetSurveyTemplateEvent>(_getSurveyTemplate);
    on<NextQuestionEvent>(_moveNextQuestion);
    on<PrevQuestionEvent>(_movePrevQuestion);
    on<CompleteSurveyEvent>(_completeSurvey);

  }
}
