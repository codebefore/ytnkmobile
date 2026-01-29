import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/models/survey/choice.dart';

class ChoiceViewer extends StatelessWidget {
  final Choice choice;
  final bool isMulti;
  final Function(int) onSelected;

  const ChoiceViewer(
      {super.key,
      required this.choice,
      required this.isMulti,
      required this.onSelected});

  void _onTap() {
    onSelected.call(choice.order);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: isMulti
                      ? Icon(
                          choice.checked ?? false
                              ? GlobalIcons.GENERAL_checkboxCheckedIcon
                              : GlobalIcons.GENERAL_checkboxIcon,
                          color: Colors.black)
                      : Icon(
                          choice.checked ?? false
                              ? GlobalIcons.GENERAL_checkboxCircleCheckedIcon
                              : GlobalIcons.GENERAL_checkboxCircleIcon,
                          color: Colors.black),
                ),
                Flexible(flex: 1, child: Text("${choice.order.toString()}.")),
                Flexible(flex: 7, fit: FlexFit.tight, child: Text(choice.text))
              ]),
        ));
  }
}
