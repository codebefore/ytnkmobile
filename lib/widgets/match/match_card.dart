import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/pages/match/match_page.dart';
import 'package:ytnkio/widgets/match/match_feature.dart';
import 'package:ytnkio/widgets/match/match_tag.dart';

class MatchCard extends StatelessWidget {
  final Match match;
  final int cardIndex;

  const MatchCard({
    super.key,
    required this.match,
    required this.cardIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<List<double>> values = [
      [0.2, 0.4, 0.5, 0.1, 0.3, 0.7],
      [0.3, 0.6, 0.2, 0.8, 0.4, 0.4],
      [0.6, 0.6, 0.5, 0.2, 0.1, 0.4],
    ];

    List<String> texts = [
      "43",
      "68",
      "51",
    ];

    return InkWell(
      onTap: () {
        context.push(MatchPage.id, extra: match);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MatchStateTag(match: match),
              const SizedBox(height: 8),
              Row(children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    //todo: replace with company logo
                    "https://static.vecteezy.com/system/resources/previews/024/273/763/original/meta-logo-transparent-free-png.png",
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match.jobTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      match.companyName,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          RadarChart(
                            length: 6,
                            radius: 40,
                            initialAngle: 60,
                            backgroundColor: Colors.white,
                            borderStroke: 1,
                            borderColor: Colors.grey.shade300,
                            radialStroke: 1,
                            radialColor: Colors.grey.shade200,
                            radars: [
                              RadarTile(
                                values: values[cardIndex],
                                borderColor: Colors.blue,
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, .3),
                                borderStroke: 2,
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Color.fromRGBO(255, 255, 255, .2),
                            child: Text(
                              texts[cardIndex],
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MatchTag(text: match.workingMethod),
                  MatchTag(text: match.typeOfPosition),
                  MatchTag(text: match.seniorityLevel),
                ],
              ),
              const SizedBox(height: 16),
              Divider(
                color: Colors.indigo[100], // Add indigo color here
                thickness: 1, // Adjust thickness as needed
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MatchFeature(
                    text: match.location,
                    icon: GlobalIcons.GENERAL_locationOutlinedIcon,
                  ),
                  MatchFeature(
                    text: match.seniorityLevel,
                    icon: GlobalIcons.MATCHINGS_PAGE_proficiencyLevelIcon,
                  ),
                  MatchFeature(
                    text: match.createdAt.toMoment().fromNow(),
                    icon: GlobalIcons.GENERAL_dateIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchStateTag extends StatelessWidget {
  final Match match;

  const MatchStateTag({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: match.status == "accepted"
            ? Colors.green[100]
            : match.status == "rejected"
                ? Colors.red[100]
                : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        match.status == "accepted"
            ? "Accepted"
            : match.status == "rejected"
                ? "Rejected"
                : "Waiting",
        style: TextStyle(
          color: match.status == "accepted"
              ? Colors.green[400]
              : match.status == "rejected"
                  ? Colors.red[400]
                  : Colors.grey[400],
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

class RadarVertex extends StatelessWidget implements PreferredSizeWidget {
  const RadarVertex(
      {super.key,
      required this.radius,
      required this.text,
      this.textOffset = const Offset(0, 0),
      this.color = Colors.red});

  final double radius;
  final String? text;
  final Offset textOffset;
  final Color color;

  @override
  Size get preferredSize =>
      Size(radius * 8 - textOffset.dx, radius - textOffset.dy);

  @override
  Widget build(BuildContext context) {
    if (text!.isNotEmpty) {
      return Stack(
        children: [
          Text(
            text!,
            style: TextStyle(
                fontSize: 12, color: color, fontWeight: FontWeight.bold),
          )
        ],
      );
    } else {
      return const Stack(
        children: [],
      );
    }
  }
}
