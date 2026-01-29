import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/preferences/choice_matrix.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsTypesOfPositionsQuestion extends StatelessWidget {
  const PrefsTypesOfPositionsQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrefsQuestionText(
            text:
                GlobalTexts.current.PREFERENCES_PAGE_typesOfPositionsQuestion),
        ChoiceMatrix(
            options: [
              (
                "fulltime",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["fulltime"]!
              ),
              (
                "parttime",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["parttime"]!
              ),
              (
                "contractor",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["contractor"]!
              ),
              (
                "temporary",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["temporary"]!
              ),
              (
                "freelancer",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["freelancer"]!
              ),
              (
                "volunteer",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["volunteer"]!
              ),
              (
                "internship",
                GlobalTexts.current
                    .PREFERENCES_PAGE_typesOfPositionsOptions["internship"]!
              ),
            ],
            initialSelections: state.profile.preferences.typeOfPosition,
            onSelectionChanged: (key, value) {
              context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                    preferences: state.profile.preferences
                        .copyWith(typeOfPosition: value),
                  ));
            }),
      ],
    );
  }
}
