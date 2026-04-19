import 'package:radar_chart/radar_chart.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/score_item.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/widgets/match/match_card.dart';

class MatchRadar extends StatelessWidget {
  const MatchRadar({
    required this.match,
    super.key,
  });

  final Match match;

  @override
  Widget build(BuildContext context) {
    const radarLength = 5;
    final axes =
        _normalizeScores(match.scores, radarLength).map(_toRadarAxis).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(GlobalTexts.current.MATCH_PAGE_radar_title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          RadarChart(
            length: 5,
            radius: 96,
            initialAngle: 0,
            backgroundColor: Colors.white,
            borderStroke: 1,
            borderColor: Colors.grey.shade300,
            radialStroke: 1,
            radialColor: Colors.grey.shade200,
            vertices: [
              RadarVertex(
                radius: 10,
                text: axes[0].shortLabel,
                color: Colors.grey,
                textOffset: Offset(90, -10),
              ),
              RadarVertex(
                radius: 10,
                text: axes[1].shortLabel,
                color: Colors.grey,
                textOffset: Offset(0, 10),
              ),
              RadarVertex(
                radius: 10,
                text: axes[2].shortLabel,
                color: Colors.grey,
                textOffset: Offset(-130, 10),
              ),
              RadarVertex(
                radius: 10,
                text: axes[3].shortLabel,
                color: Colors.grey,
                textOffset: Offset(-90, -10),
              ),
              RadarVertex(
                radius: 10,
                text: axes[4].shortLabel,
                color: Colors.grey,
                textOffset: Offset(0, 0),
              ),
            ],
            radars: [
              RadarTile(
                values: [
                  axes[0].score.clamp(0, 100) / 100.0,
                  axes[1].score.clamp(0, 100) / 100.0,
                  axes[2].score.clamp(0, 100) / 100.0,
                  axes[3].score.clamp(0, 100) / 100.0,
                  axes[4].score.clamp(0, 100) / 100.0,
                ],
                borderColor: Colors.indigoAccent,
                backgroundColor: Color.fromRGBO(83, 109, 254, 0.3),
                borderStroke: 2,
                vertices: [
                  RadarVertex(
                    radius: 10,
                    text: axes[0].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: axes[1].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: axes[2].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: axes[3].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: axes[4].score.toString(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = (constraints.maxWidth - 8) / 2;

              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: axes
                    .map(
                      (axis) => SizedBox(
                        width: itemWidth,
                        child: _RadarLegendItem(axis: axis),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
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

  static _RadarAxis _toRadarAxis(ScoreItem score) {
    return _RadarAxis(
      shortLabel: _localizedShortLabel(score.name),
      fullLabel: _localizedLabel(score.name),
      score: score.score,
    );
  }

  static String _localizedShortLabel(String rawName) {
    final texts = GlobalTexts.current;
    switch (rawName.trim().toLowerCase()) {
      case "physical_conditions":
        return texts.MATCH_PAGE_radarShort_physicalConditions;
      case "employment_profile":
        return texts.MATCH_PAGE_radarShort_employmentProfile;
      case "technical_skills":
        return texts.MATCH_PAGE_radarShort_technicalSkills;
      case "rewards_expectations":
        return texts.MATCH_PAGE_radarShort_rewardsExpectations;
      case "organizational_fit":
        return texts.MATCH_PAGE_radarShort_organizationalFit;
      default:
        return _fallbackLabel(rawName);
    }
  }

  static String _localizedLabel(String rawName) {
    final texts = GlobalTexts.current;
    switch (rawName.trim().toLowerCase()) {
      case "physical_conditions":
        return texts.MATCH_PAGE_radar_physicalConditions;
      case "employment_profile":
        return texts.MATCH_PAGE_radar_employmentProfile;
      case "technical_skills":
        return texts.MATCH_PAGE_radar_technicalSkills;
      case "rewards_expectations":
        return texts.MATCH_PAGE_radar_rewardsExpectations;
      case "organizational_fit":
        return texts.MATCH_PAGE_radar_organizationalFit;
      default:
        return _fallbackLabel(rawName);
    }
  }

  static String _fallbackLabel(String rawName) {
    final words = rawName
        .split("_")
        .map((word) => word.trim())
        .where((word) => word.isNotEmpty)
        .map(_capitalize)
        .toList();

    return words.isEmpty ? rawName : words.join(" ");
  }

  static String _capitalize(String value) {
    if (value.isEmpty) {
      return value;
    }

    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }
}

class _RadarAxis {
  final String shortLabel;
  final String fullLabel;
  final int score;

  const _RadarAxis({
    required this.shortLabel,
    required this.fullLabel,
    required this.score,
  });
}

class _RadarLegendItem extends StatelessWidget {
  final _RadarAxis axis;

  const _RadarLegendItem({required this.axis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigoAccent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              axis.score.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              axis.fullLabel.replaceAll('\n', ' '),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
