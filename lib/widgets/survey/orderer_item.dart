import 'package:flutter/material.dart';
import 'package:ytnkio/models/survey/choice.dart';

class OrdererItem extends StatelessWidget {
  final Choice choice;
  final Color color;
  final Function(int) onClick;

  const OrdererItem({
    super.key,
    required this.choice,
    required this.color,
    required this.onClick,
  });

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
        child: ElevatedButton(
          onPressed: () => onClick(choice.order),
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
          child: Text(
            choice.selectionOrder == null
                ? choice.text
                : "${choice.selectionOrder ?? 1} - ${choice.text}",
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
