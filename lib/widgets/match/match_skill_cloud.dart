import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/score_item.dart';
import 'package:ytnkio/widgets/match/match_skill_chip.dart';
import 'package:ytnkio/models/match/match.dart';

int _getSkillPriority(ScoreItem skill) {
  final isRelevant = skill.isRelevant ?? true;
  if (!isRelevant) {
    return 3;
  }

  if (skill.score >= 80) {
    return 0;
  }

  if (skill.score >= 60) {
    return 1;
  }

  return 2;
}

List<ScoreItem> _sortSkillFitness(List<ScoreItem> skills) {
  final sortedSkills = [...skills];
  sortedSkills.sort((left, right) {
    final priorityDiff = _getSkillPriority(left) - _getSkillPriority(right);
    if (priorityDiff != 0) {
      return priorityDiff;
    }

    final scoreDiff = right.score.compareTo(left.score);
    if (scoreDiff != 0) {
      return scoreDiff;
    }

    return left.name.toLowerCase().compareTo(right.name.toLowerCase());
  });
  return sortedSkills;
}

class MatchSkillCloud extends StatelessWidget {
  const MatchSkillCloud({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    final sortedSkills = _sortSkillFitness(match.skillFitness);

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
                ...sortedSkills.map((skill) => MatchSkillChip(
                  skillName: skill.name,
                  score: skill.score,
                  isRelevant: skill.isRelevant ?? true,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
