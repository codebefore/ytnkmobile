import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_icons.dart';

class Stars extends StatelessWidget {
  final int starCount;

  const Stars({super.key, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starCount == 0
          ? List.generate(
              5,
              (index) => const Icon(
                size: 14,
                GlobalIcons.GENERAL_starOutlinedIcon,
                color: Colors.grey,
              ),
            )
          : List.generate(
              starCount,
              (index) => const Icon(
                size: 14,
                GlobalIcons.GENERAL_starIcon,
                color: Colors.indigo,
              ),
            ),
    );
  }
}
