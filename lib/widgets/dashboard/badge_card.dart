import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  final int number;
  final IconData iconData;
  final Color iconForeColor;
  final Color iconBackColor;
  final String definition;

  const BadgeCard({
    super.key,
    required this.number,
    required this.definition,
    required this.iconData,
    required this.iconForeColor,
    required this.iconBackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 65,
              decoration: BoxDecoration(
                color: iconBackColor,
              ),
              child: Center(
                child: Icon(
                  iconData,
                  color: iconForeColor,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      number.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(definition,
                        style: const TextStyle(
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
