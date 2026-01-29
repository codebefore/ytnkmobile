import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/preferences/choice_matrix.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsCompanySizeQuestion extends StatelessWidget {
  const PrefsCompanySizeQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrefsQuestionText(
            text: GlobalTexts.current.PREFERENCES_PAGE_companySizeQuestion),
        ChoiceMatrix(
            options: [
              (
                "seed",
                GlobalTexts.current.PREFERENCES_PAGE_companySizeOptions["seed"]!
              ),
              (
                "small",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companySizeOptions["small"]!
              ),
              (
                "medium",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companySizeOptions["medium"]!
              ),
              (
                "large",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companySizeOptions["large"]!
              ),
              (
                "verylarge",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companySizeOptions["verylarge"]!
              ),
              (
                "massive",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companySizeOptions["massive"]!
              ),
            ],
            initialSelections: state.profile.preferences.companySize,
            onSelectionChanged: (key, value) {
              context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                    preferences:
                        state.profile.preferences.copyWith(companySize: value),
                  ));
            }),
      ],
    );
  }
}
