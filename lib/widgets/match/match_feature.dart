import 'package:flutter/material.dart';

class MatchFeature extends StatelessWidget {
  final IconData icon;
  final String text;

  const MatchFeature({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.teal[200],
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
