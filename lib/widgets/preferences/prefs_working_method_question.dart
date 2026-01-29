import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/preferences/choice_matrix.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsWorkingMethodQuestion extends StatelessWidget {
  const PrefsWorkingMethodQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrefsQuestionText(
            text: GlobalTexts.current.PREFERENCES_PAGE_workingMethodQuestion),
        ChoiceMatrix(
            options: [
              (
                "onsite",
                GlobalTexts
                    .current.PREFERENCES_PAGE_workingMethodOptions["onsite"]!
              ),
              (
                "remote",
                GlobalTexts
                    .current.PREFERENCES_PAGE_workingMethodOptions["remote"]!
              ),
              (
                "hybrid",
                GlobalTexts
                    .current.PREFERENCES_PAGE_workingMethodOptions["hybrid"]!
              ),
            ],
            initialSelections: state.profile.preferences.workingMethod,
            onSelectionChanged: (key, value) {
              context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                    preferences: state.profile.preferences
                        .copyWith(workingMethod: value),
                  ));
            }),
      ],
    );
  }
}
