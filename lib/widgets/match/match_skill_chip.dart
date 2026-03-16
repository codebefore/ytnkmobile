import 'package:flutter/material.dart';

class MatchSkillChip extends StatelessWidget {
  final String skillName;
  final int score;
  final bool isRelevant;

  const MatchSkillChip(
      {super.key,
      required this.skillName,
      required this.score,
      this.isRelevant = true});

  Color _getAccentColor() {
    if (!isRelevant) {
      return Colors.grey.shade500;
    }

    if (score >= 80) {
      return Colors.green.shade600;
    }

    if (score >= 60) {
      return Colors.amber.shade700;
    }

    return Colors.red.shade700;
  }

  Color _getLabelColor() {
    if (!isRelevant) {
      return Colors.grey.shade700;
    }

    if (score >= 80) {
      return Colors.green.shade700;
    }

    if (score >= 60) {
      return Colors.amber.shade900;
    }

    return Colors.red.shade700;
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _getAccentColor();

    return Chip(
      backgroundColor: Colors.white,
      side: BorderSide(color: accentColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: accentColor),
      ),
      avatar: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: accentColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          "$score",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
      ),
      label: Text(
        skillName,
        style: TextStyle(
          color: _getLabelColor(),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
