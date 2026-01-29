import 'package:flutter/material.dart';

class MatchSkillChip extends StatelessWidget {
  final String skillName;
  final int score;

  const MatchSkillChip({super.key, required this.skillName, required this.score});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: score > 85 ? Colors.green : score > 65 ? Colors.yellow.shade200 : Colors.grey.shade300,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide.none,
      ),
      label: Text(
        skillName,
        style: TextStyle(color: Colors.grey.shade800),
      ),
    );
  }
}
