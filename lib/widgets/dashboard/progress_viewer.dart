import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';

class ProgressViewer extends StatelessWidget {
  final double percent;
  final int level;

  const ProgressViewer({super.key, required this.percent, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 151, 211, 195),
                backgroundColor: Colors.grey.shade200,
                value: percent,
                strokeWidth: 6,
                strokeCap: StrokeCap.square,
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 141, 153, 255),
                backgroundColor: Colors.grey.shade200,
                value: level * 0.25,
                strokeWidth: 6,
                strokeCap: StrokeCap.square,
              ),
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  "${(percent * 100).toStringAsFixed(0)}%",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  GlobalTexts.current.PROGRESSVIEWER_levelNames[level],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 109, 139, 139),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
