import 'package:flutter/material.dart';
import 'package:ytnkio/models/survey/choice.dart';

class PercentageSelector extends StatelessWidget {
  final Choice choice;
  final Function(int, double) onChanged;

  const PercentageSelector(
      {required this.choice, required this.onChanged, super.key});

  void _onChanged(double value) {
    onChanged.call(choice.order, value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            choice.text,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Slider(
                    onChanged: (value) => _onChanged(value),
                    value: choice.percent ?? 0,
                    min: 0,
                    max: 100,
                    divisions: 20,
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Center(
                  child: Text(
                    (choice.percent ?? 0).toInt().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
