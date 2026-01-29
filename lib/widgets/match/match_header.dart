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
          child: Image.network(
            //todo: change with company logo from match data
            "https://msdynamicsworld.com/sites/default/files/meta_platforms_inc._logo.svg_.png",
            width: 120,
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
}
