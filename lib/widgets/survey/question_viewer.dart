import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/survey/question.dart';
import 'package:ytnkio/models/survey/question_types_enum.dart';
import 'package:ytnkio/widgets/survey/choice_viewer.dart';
import 'package:ytnkio/widgets/survey/orderer.dart';
// import 'package:ytnkio/modules/survey/widgets/drag_selector.dart';
import 'package:ytnkio/widgets/survey/percentage_selector.dart';
import 'package:ytnkio/widgets/survey/question_text.dart';

class QuestionViewer extends StatefulWidget {
  final Question question;

  const QuestionViewer({super.key, required this.question});

  @override
  State<QuestionViewer> createState() => _QuestionViewerState();
}

class _QuestionViewerState extends State<QuestionViewer> {
  void _onSelected(int order) {
    if (widget.question.type == QuestionTypes.multiChoices) {
      var selectedChoice = widget.question.choices
          .firstWhere((element) => element.order == order);

      setState(() {
        selectedChoice.checked = !(selectedChoice.checked ?? false);
      });
    } else {
      for (var i = 0; i < widget.question.choices.length; i++) {
        if (widget.question.choices[i].order == order) {
          setState(() {
            widget.question.choices[i].checked = true;
          });
        } else {
          setState(() {
            widget.question.choices[i].checked = false;
          });
        }
      }
    }
  }

  void _onPercentageChanged(int order, double value) {
    var total = 0;
    var changingIndex = 0;

    for (var i = 0; i < widget.question.choices.length; i++) {
      if (widget.question.choices[i].order == order) {
        changingIndex = i;

        total += value.toInt();
      } else {
        total += (widget.question.choices[i].percent ?? 0.0).toInt();
      }
    }

    var availableValue = 100 - (total - value);

    setState(() {
      widget.question.choices[changingIndex].percent =
          value < availableValue ? value : availableValue;

      var leftValue = 100.0;

      for (var i = 0; i < widget.question.choices.length; i++) {
        leftValue -= widget.question.choices[i].percent ?? 0;
      }

      widget.question.availablePercentage = leftValue.roundToDouble().abs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
          child: QuestionText(
              text: widget.question.text, order: widget.question.order),
        ),
        Expanded(
            child: widget.question.type == QuestionTypes.multiChoices ||
                    widget.question.type == QuestionTypes.singleChoice
                ? ListView(
                    scrollDirection: Axis.vertical,
                    children: widget.question.choices
                        .map((e) => ChoiceViewer(
                            choice: e,
                            isMulti: widget.question.type ==
                                QuestionTypes.multiChoices,
                            onSelected: _onSelected))
                        .toList(),
                  )
                : widget.question.type == QuestionTypes.dependentPercentage
                    ? ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      widget.question.availablePercentage == 0
                                          ? Colors.green
                                          : Colors.indigo,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset.zero,
                                        blurRadius: 6,
                                        spreadRadius: 2,
                                        blurStyle: BlurStyle.outer)
                                  ]),
                              height: 50,
                              child: Text(
                                  "${GlobalTexts.current.TAKE_SURVEY_PAGE_remainingPoints}${(widget.question.availablePercentage == null ? "100" : widget.question.availablePercentage.toString())}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          ...widget.question.choices.map<Widget>((e) =>
                              PercentageSelector(
                                  choice: e, onChanged: _onPercentageChanged))
                        ].toList())
                    : Orderer(
                        choices: widget.question.choices,
                        onChanged: _onPercentageChanged))
      ],
    );
  }
}
