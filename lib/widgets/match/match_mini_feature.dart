import 'package:flutter/material.dart';

class MatchMiniFeature extends StatelessWidget {
  final IconData icon;
  final String title;

  const MatchMiniFeature({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide.none,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade300),
          const SizedBox(width: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
