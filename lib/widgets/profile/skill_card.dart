import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/models/profile/skill.dart';
import 'package:ytnkio/pages/profile/edit_skill_page.dart';
import 'package:ytnkio/widgets/common/stars.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return InputChip(
        onPressed: () {
          context.push(EditSkillPage.id, extra: skill);
        },
        label: Row(
          children: [
            Text(skill.text),
            const SizedBox(width: 4),
            Stars(starCount: skill.point ~/ 20),
          ],
        ));
  }
}
