import 'package:flutter/material.dart';
import 'package:ytnkio/models/common/option_selection.dart';
import 'package:ytnkio/widgets/preferences/choice_matrix_header.dart';
import 'package:ytnkio/widgets/preferences/choice_matrix_option.dart';

class ChoiceMatrix extends StatelessWidget {
  final List<(String, String)> options;
  final List<OptionSelection> initialSelections;
  final Function(String key, List<OptionSelection> value) onSelectionChanged;

  const ChoiceMatrix({
    super.key,
    required this.options,
    required this.initialSelections,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<OptionSelection> selections = List.from(initialSelections);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const ChoiceMatrixHeader(),
        ...options.map((option) {
          return ChoiceMatrixOption(
            optionKey: option.$1,
            optionText: option.$2,
            selectedOption: selections
                .firstWhere((element) => element.optionKey == option.$1,
                    orElse: () =>
                        OptionSelection(optionKey: option.$1, selection: ""))
                .selection,
            onSelectionChanged: (optionKey, selectedValue) {
              final index = selections
                  .indexWhere((element) => element.optionKey == optionKey);

              if (index == -1) {
                selections = [
                  ...selections,
                  OptionSelection(
                    optionKey: optionKey,
                    selection: selectedValue,
                  )
                ];
              } else {
                selections[index] = OptionSelection(
                  optionKey: optionKey,
                  selection: selectedValue,
                );
              }

              onSelectionChanged(optionKey, selections);
            },
          );
        }),
      ],
    );
  }
}
