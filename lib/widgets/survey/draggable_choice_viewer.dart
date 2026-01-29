import 'package:flutter/material.dart';
import 'package:ytnkio/models/survey/choice.dart';

class DraggableChoiceViewer extends StatelessWidget {
  final Choice choice;
  final Color color;
  final bool showOrder;
  final ScrollController scrollController;

  const DraggableChoiceViewer(
      {super.key,
      required this.choice,
      required this.color,
      required this.showOrder,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Draggable<int>(
        data: choice.order,
        feedback: Container(
          width: 180,
          height: 36,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Center(
            child: Text(
              choice.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 36,
          margin: const EdgeInsets.only(left: 30, right: 30, top: 4, bottom: 4),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Text(
            showOrder
                ? "${choice.selectionOrder ?? 1} - ${choice.text}"
                : choice.text,
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ),
      ),
      onPointerMove: (event) {
        if (scrollController.offset + event.delta.dy < 0) {
          scrollController.jumpTo(0.0);
          return;
        }
        scrollController.jumpTo(scrollController.offset + event.delta.dy);
      },
    );
  }
}
