import 'package:flutter/material.dart';

class ChoiceMatrixOption extends StatelessWidget {
  final String optionKey;
  final String optionText;
  final String selectedOption;
  final Function(String, String) onSelectionChanged;

  const ChoiceMatrixOption(
      {super.key,
      required this.optionKey,
      required this.optionText,
      required this.selectedOption,
      required this.onSelectionChanged});

  void _handleRadioValueChange(BuildContext context, String? value) {
    onSelectionChanged(optionKey, value!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(optionText),
        ),
        Expanded(
          flex: 1,
          child: Radio<String>(
            value: "ok",
            groupValue: selectedOption,
            onChanged: (value) => _handleRadioValueChange(context, value),
          ),
        ),
        Expanded(
          flex: 1,
          child: Radio<String>(
            value: "maybe",
            groupValue: selectedOption,
            onChanged: (value) => _handleRadioValueChange(context, value),
          ),
        ),
        Expanded(
          flex: 1,
          child: Radio<String>(
            value: "notok",
            groupValue: selectedOption,
            onChanged: (value) => _handleRadioValueChange(context, value),
          ),
        ),
      ],
    );
  }
}
