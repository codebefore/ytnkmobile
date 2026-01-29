import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';

class PrefsCompanySizeSingleQuestion extends StatelessWidget {
  const PrefsCompanySizeSingleQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    //final state = context.watch<GlobalBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(GlobalTexts.current.PREFERENCES_PAGE_companySizeQuestion),
        DropdownButton<String>(
          value: "", //state.profile.preferences.companySize,
          underline: Container(
            height: 2,
            color: Colors.grey.shade400,
          ),
          onChanged: (value) {
            // context.read<GlobalBloc>().add(
            //       UpdatePreferencesEvent(
            //           preferences: state.profile.preferences.copyWith(
            //         companySize: value!,
            //       )),
            //     );
          },
          isExpanded: true,
          items: GlobalTexts.current.PREFERENCES_PAGE_companySizeOptions.entries
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e.key,
                  child: Text(e.value),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
