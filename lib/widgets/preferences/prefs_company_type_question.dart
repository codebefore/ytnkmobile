import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/preferences/choice_matrix.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsCompanyTypeQuestion extends StatelessWidget {
  const PrefsCompanyTypeQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrefsQuestionText(
            text: GlobalTexts.current.PREFERENCES_PAGE_companyTypeQuestion),
        ChoiceMatrix(
            options: [
              (
                "startup",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companyTypeOptions["startup"]!
              ),
              (
                "corporate",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companyTypeOptions["corporate"]!
              ),
              (
                "nonprofit",
                GlobalTexts
                    .current.PREFERENCES_PAGE_companyTypeOptions["nonprofit"]!
              ),
            ],
            initialSelections: state.profile.preferences.companyType,
            onSelectionChanged: (key, value) {
              context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                    preferences:
                        state.profile.preferences.copyWith(companyType: value),
                  ));
            }),
      ],
    );
  }
}
