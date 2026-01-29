import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsHowUrgentYourHiringQuestion extends StatelessWidget {
  const PrefsHowUrgentYourHiringQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrefsQuestionText(
            text: GlobalTexts
                .current.PREFERENCES_PAGE_howUrgentYourHiringQuestion),
        DropdownButton<String>(
            value: state.profile.preferences.hiringUrgency,
            underline: Container(
              height: 2,
              color: Colors.grey.shade400,
            ),
            onChanged: (String? newValue) {
              context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                    preferences: state.profile.preferences
                        .copyWith(hiringUrgency: newValue),
                  ));
            },
            isExpanded: true,
            items: GlobalTexts
                .current.PREFERENCES_PAGE_howUrgentIsYourHiringOptions
                .map((key, value) {
                  return MapEntry(
                    key,
                    DropdownMenuItem<String>(
                      value: key,
                      child: Text(value),
                    ),
                  );
                })
                .values
                .toList()),
      ],
    );
  }
}
