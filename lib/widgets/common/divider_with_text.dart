import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Flexible(flex: 3, child: Divider()),
          Flexible(flex: 3, child: Text(text)),
          const Flexible(flex: 3, child: Divider()),
        ],
      ),
    );
  }
}
