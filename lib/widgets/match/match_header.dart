import 'package:flutter/material.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/widgets/common/company_logo_avatar.dart';

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
          child: CompanyLogoAvatar(
            companyName: match.companyName,
            companyLogo: match.companyLogo,
            radius: 42,
            fontSize: 22,
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
