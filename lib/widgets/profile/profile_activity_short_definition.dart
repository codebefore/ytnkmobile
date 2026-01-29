import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';

class ProfileActivityShortDefinition extends StatelessWidget {
  final String profileName;
  final DateTime lastActivityDate;
  final String activityDefinition;

  const ProfileActivityShortDefinition(
      {super.key,
      required this.profileName,
      required this.lastActivityDate,
      required this.activityDefinition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profileName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "(${GlobalTexts.current.DASHBOARD_PAGE_lastUpdatedOn} ${(lastActivityDate.format(payload: "DD MMMM YYYY"))})",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                GlobalIcons.ACTIVITYLEVELS_immediateJoinerIcon,
                size: 16,
                color: Color.fromARGB(255, 109, 139, 139),
              ),
              Text(
                " $activityDefinition",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 109, 139, 139)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
