import 'package:flutter/material.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchHeader extends StatelessWidget {
  const MatchHeader({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircleAvatar(
            radius: 42,
            backgroundColor: Colors.indigo.shade50,
            child: Text(
              _companyInitials(match.companyName),
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(
          match.jobTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          match.companyName,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  static String _companyInitials(String companyName) {
    final tokens = companyName
        .trim()
        .split(RegExp(r"\s+"))
        .where((token) => token.isNotEmpty)
        .toList();

    if (tokens.isEmpty) {
      return "CO";
    }

    if (tokens.length == 1) {
      return tokens.first.substring(0, 1).toUpperCase();
    }

    return "${tokens[0][0]}${tokens[1][0]}".toUpperCase();
  }
}
