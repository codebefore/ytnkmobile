import 'package:flutter/material.dart';

class ChoiceMatrixHeader extends StatelessWidget {
  const ChoiceMatrixHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Container()), // Empty column
        const Expanded(flex: 1, child: Text('OK', textAlign: TextAlign.center)),
        const Expanded(
            flex: 1, child: Text('May Be', textAlign: TextAlign.center)),
        const Expanded(
            flex: 1, child: Text('Not OK', textAlign: TextAlign.center)),
      ],
    );
  }
}
