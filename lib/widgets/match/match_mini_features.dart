import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/widgets/match/match_mini_feature.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchMiniFeatures extends StatelessWidget {
  const MatchMiniFeatures({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 1,
                child: MatchMiniFeature(
                  icon: GlobalIcons.GENERAL_pinIcon,
                  title: match.location,
                ),
              ),
              Flexible(
                flex: 1,
                child: MatchMiniFeature(
                  icon: GlobalIcons.GENERAL_badgeIcon,
                  title: match.seniorityLevel,
                ),
              ),
              Flexible(
                flex: 1,
                child: MatchMiniFeature(
                  icon: GlobalIcons.GENERAL_dateIcon,
                  title: match.createdAt.toMoment().fromNow(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
