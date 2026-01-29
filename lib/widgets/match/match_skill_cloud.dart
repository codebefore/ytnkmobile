import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/match/match_skill_chip.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchSkillCloud extends StatelessWidget {
  const MatchSkillCloud({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              GlobalTexts.current.MATCH_PAGE_skillCloud_title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              children: [
                ...match.skillFitness.map((skill) => MatchSkillChip(
                  skillName: skill.name,
                  score: skill.score,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
