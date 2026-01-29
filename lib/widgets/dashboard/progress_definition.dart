import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';

class ProgressDefinition extends StatelessWidget {
  final double percent;
  final int level;

  const ProgressDefinition(
      {super.key, required this.percent, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: Chip(
                label: Text(""),
                backgroundColor: Color.fromARGB(255, 151, 211, 195),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${(percent * 100).toStringAsFixed(0)} %",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(GlobalTexts.current.PROGRESSVIEWER_profileScore)
                ],
              ),
            ),
            VerticalDivider(
              width: 20,
              thickness: 1,
              color: Colors.grey.shade300,
              indent: 2,
              endIndent: 2,
            ),
            const SizedBox(
              width: 40,
              height: 40,
              child: Chip(
                label: Text(""),
                backgroundColor: Color.fromARGB(255, 141, 153, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    GlobalTexts.current.PROGRESSVIEWER_levelNames[level],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(GlobalTexts.current.PROGRESSVIEWER_activityLevel)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
