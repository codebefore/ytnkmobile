import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/survey/survey.dart';

class SurveyActionBar extends StatelessWidget {
  final Survey survey;
  final Function nextButtonPressed;
  final Function prevButtonPressed;

  const SurveyActionBar(
      {super.key,
      required this.survey,
      required this.nextButtonPressed,
      required this.prevButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.indigo),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)))),
            onPressed: () {
              if (context.mounted) {
                prevButtonPressed.call();
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                GlobalTexts.current.TAKE_SURVE_PAGE_previous,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.indigo),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)))),
            onPressed: () {
              if (context.mounted) {
                nextButtonPressed.call();
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                GlobalTexts.current.TAKE_SURVE_PAGE_next,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
