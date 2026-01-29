import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/survey/survey_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/profile/profile.dart';
import 'package:ytnkio/pages/survey/complete_survey_page.dart';
import 'package:ytnkio/widgets/survey/question_viewer.dart';
import 'package:ytnkio/widgets/survey/survey_action_bar.dart';

class TakeSurveyPage extends StatefulWidget {
  static const id = "/pages/survey/take_survey_page";

  final Profile profile;

  const TakeSurveyPage({super.key, required this.profile});

  @override
  State<TakeSurveyPage> createState() => _TakeSurveyPageState();
}

class _TakeSurveyPageState extends State<TakeSurveyPage> {

  @override
  void initState() {
    super.initState();

    var surveyBloc = context.read<SurveyBloc>();

    if (surveyBloc.state.survey != null) {
      return;
    }

    surveyBloc.add(GetSurveyTemplateEvent(widget.profile.languageCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 
          GlobalTexts.current.TAKE_SURVE_PAGE_title
      ),
      body: BlocConsumer<SurveyBloc, SurveyState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return current.survey != null;
        },
        builder: (context, state) {
          return state.survey == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: QuestionViewer(
                              question: state
                                  .survey!.questions[state.questionIndex])),
                      SurveyActionBar(
                          survey: state.survey!,
                          nextButtonPressed: () {
                            if (state.questionIndex ==
                                state.survey!.questions.length - 1) {
                              context.push(CompleteSurveyPage.id);
                            } else {
                              context
                                  .read<SurveyBloc>()
                                  .add(const NextQuestionEvent());
                            }
                          },
                          prevButtonPressed: () {
                            context
                                .read<SurveyBloc>()
                                .add(const PrevQuestionEvent());
                          })
                    ],
                  ),
                );
        },
      ),
    );
  }
}
