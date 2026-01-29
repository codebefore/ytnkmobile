import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/blocs/survey/survey_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/profile/profile.dart';
import 'package:ytnkio/pages/survey/take_survey_page.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';

class StartSurveyPage extends StatefulWidget {
  static const id = "/pages/survey/start_survey_page";

  const StartSurveyPage({super.key});

  @override
  State<StartSurveyPage> createState() => _StartSurveyPageState();
  
}

class _StartSurveyPageState extends State<StartSurveyPage> {
  late final Profile _profile;

  @override
  void initState() {
    super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    var globalBloc = context.read<GlobalBloc>();
    var surveyBloc = context.read<SurveyBloc>();

    _profile = globalBloc.state.profile;

    surveyBloc.add(CanTakeSurveyEvent(_profile.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: GlobalTexts.current.START_SURVEY_PAGE_title,
      ),
      body:  Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(GlobalConstants.startSurveyImagePath),
                const SizedBox(height: 16),
                Text(
                  GlobalTexts.current.START_SURVEY_PAGE_description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                BlocConsumer<SurveyBloc, SurveyState>(
                    listener: (surveyContext, surveyState) {

                    },
                    builder: (surveyContext, surveyState) {
                      return DefaultElevatedButton(
                        icon: GlobalIcons.START_SURVEY_PAGE_startSurveyIcon,
                        label: surveyState.canStartSurvey
                            ? GlobalTexts.current.START_SURVEY_PAGE_startSurvey
                            : "Remaining time for new survey: ${surveyState.remainingMinutesForNewSurvey} minutes",
                        onPressed: surveyState.canStartSurvey ? () {
                          context.read<SurveyBloc>().add(
                              ClearSurveyStateEvent());

                          context.push(TakeSurveyPage.id,
                              extra: _profile);
                        } : null,
                        isProcessing: surveyState.isProcessing,
                        backgroundColor: surveyState.canStartSurvey ? Colors.teal : Colors.grey,
                      );
                    }),
              ],
            ),
          ),
    );
  }
}
