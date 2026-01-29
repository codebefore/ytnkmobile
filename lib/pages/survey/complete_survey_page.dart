import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/survey/survey_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';

class CompleteSurveyPage extends StatelessWidget {
  static const id = "/pages/survey/complete_survey_page";

  const CompleteSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: GlobalTexts.current.COMPLETE_SURVEY_PAGE_title,
      ),
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(GlobalConstants.completeSurveyImagePath),
                  const SizedBox(height: 16),
                  Text(
                    GlobalTexts.current.COMPLETE_SURVEY_PAGE_description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  BlocConsumer<SurveyBloc, SurveyState>(
                      listener: (surveyContext, surveyState) {
                    if (!surveyState.isProcessing) {
                      if (surveyState.isSuccessful) {
                        EasyLoading.showSuccess(
                          "Anket başarıyla tamamlandı.",
                          duration: const Duration(seconds: 2),
                        );

                        Navigator.of(context)
                            .popUntil(ModalRoute.withName(DashboardPage.id));
                      } else if (surveyState.isFailure) {
                        EasyLoading.showError(
                          surveyState.messages.isNotEmpty
                              ? surveyState.messages.join("\n")
                              : surveyState.infoMessage,
                          duration: const Duration(seconds: 2),
                        );
                      }
                    }
                  }, builder: (surveyContext, surveyState) {
                    return DefaultElevatedButton(
                      icon: GlobalIcons.COMPLETE_SURVEY_PAGE_completeSurveyIcon,
                      label: GlobalTexts
                          .current.COMPLETE_SURVEY_PAGE_completeSurvey,
                      onPressed: () {
                        context.read<SurveyBloc>().add(
                              CompleteSurveyEvent(
                                profileId: state.profile.id,
                                survey: surveyState.survey!,
                              ),
                            );
                      },
                      isProcessing: surveyState.isProcessing,
                      backgroundColor: Colors.indigoAccent,
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
