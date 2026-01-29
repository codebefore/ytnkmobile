import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/match/match_feature_box.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchFeatures extends StatelessWidget {
  const MatchFeatures({ required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: MatchFeatureBox(
                  icon: Icons.calendar_month_outlined,
                  title: GlobalTexts.current.MATCH_PAGE_feature_1_title,
                  subtitle: match.workingMethod),
            ),
            Flexible(
              flex: 1,
              child: MatchFeatureBox(
                  icon: Icons.attach_money_outlined,
                  title: GlobalTexts.current.MATCH_PAGE_feature_2_title,
                  subtitle: "${match.salaryExpectationMin} - ${match.salaryExpectationMax} ${match.salaryExpectationUnit}"),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: MatchFeatureBox(
                  icon: Icons.watch_later_outlined,
                  title: GlobalTexts.current.MATCH_PAGE_feature_3_title,
                  subtitle: match.employmentScope),
            ),
            Flexible(
              flex: 1,
              child: MatchFeatureBox(
                  icon: Icons.business,
                  title: GlobalTexts.current.MATCH_PAGE_feature_4_title,
                  subtitle: match.typeOfPosition),
            ),
          ],
        ),
      ],
    );
  }
}
