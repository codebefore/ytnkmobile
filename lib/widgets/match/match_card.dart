import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/models/match/score_item.dart';
import 'package:ytnkio/pages/match/match_page.dart';
import 'package:ytnkio/widgets/match/match_feature.dart';
import 'package:ytnkio/widgets/match/match_tag.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    const radarLength = 5;
    final normalizedScores = _normalizeScores(match.scores, radarLength);
    final radarValues = normalizedScores
        .map((score) => score.score.clamp(0, 100).toDouble() / 100.0)
        .toList();
    final overallScore =
        match.overallScore?.round() ?? _calculateOverallScore(match.scores);

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
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.indigo.shade50,
                  child: Text(
                    _companyInitials(match.companyName),
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
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
                            length: radarLength,
                            radius: 40,
                            initialAngle: 60,
                            backgroundColor: Colors.white,
                            borderStroke: 1,
                            borderColor: Colors.grey.shade300,
                            radialStroke: 1,
                            radialColor: Colors.grey.shade200,
                            radars: [
                              RadarTile(
                                values: radarValues,
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
                              overallScore.toString(),
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
                    text: _relativeCreatedAt(match.createdAt),
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

  static List<ScoreItem> _normalizeScores(List<ScoreItem> scores, int length) {
    final normalized = scores.take(length).toList();
    while (normalized.length < length) {
      normalized.add(ScoreItem("", 0));
    }
    return normalized;
  }

  static int _calculateOverallScore(List<ScoreItem> scores) {
    if (scores.isEmpty) {
      return 0;
    }
    final total = scores.fold<int>(0, (sum, item) => sum + item.score);
    return (total / scores.length).round();
  }

  static String _relativeCreatedAt(DateTime? createdAt) {
    if (createdAt == null) {
      return "-";
    }
    return createdAt.toMoment().fromNow();
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

class MatchStateTag extends StatelessWidget {
  final Match match;

  const MatchStateTag({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final normalizedStatus = match.status.toLowerCase();
    final isPreMatch = normalizedStatus == "pre-match" ||
        normalizedStatus == "waiting" ||
        normalizedStatus == "pending";

    final backgroundColor = normalizedStatus == "accepted"
        ? Colors.green[100]
        : normalizedStatus == "rejected"
            ? Colors.red[100]
            : isPreMatch
                ? Colors.orange[100]
                : Colors.grey[100];

    final foregroundColor = normalizedStatus == "accepted"
        ? Colors.green[400]
        : normalizedStatus == "rejected"
            ? Colors.red[400]
            : isPreMatch
                ? Colors.orange[700]
                : Colors.grey[400];

    final label = normalizedStatus == "accepted"
        ? GlobalTexts.current.MATCH_PAGE_statusAccepted
        : normalizedStatus == "rejected"
            ? GlobalTexts.current.MATCH_PAGE_statusRejected
            : normalizedStatus == "referred"
                ? GlobalTexts.current.MATCH_PAGE_statusReferred
                : isPreMatch
                    ? GlobalTexts.current.MATCH_PAGE_statusInterviewRequest
                    : GlobalTexts.current.MATCH_PAGE_statusMatched;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor,
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
