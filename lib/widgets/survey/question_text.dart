import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';

class QuestionText extends StatelessWidget {
  final String text;
  final int order;

  const QuestionText({super.key, required this.text, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 5),
            blurRadius: 4,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 24,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.indigoAccent),
              child: Center(
                child: Text(
                  "${GlobalTexts.current.TAKE_SURVE_PAGE_question}${order.toString()}",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
