import 'package:radar_chart/radar_chart.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/score_item.dart';
import 'package:ytnkio/models/match/match.dart';

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
    final overallScore =
        match.overallScore?.round() ?? _calculateOverallScore(match.scores);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(GlobalTexts.current.MATCH_PAGE_radar_title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Stack(
              alignment: Alignment.center,
              children: [
                RadarChart(
                  length: 5,
                  radius: 90,
                  initialAngle: 0,
                  backgroundColor: Colors.white,
                  borderStroke: 1,
                  borderColor: Colors.grey.shade300,
                  radialStroke: 1,
                  radialColor: Colors.grey.shade200,
                  vertices: _buildAxisVertices(axes),
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
                    ),
                  ],
                ),
                IgnorePointer(
                  child: Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.94),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.indigoAccent.withValues(alpha: 0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      overallScore.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: _scoreColor(overallScore),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
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

  static int _calculateOverallScore(List<ScoreItem> scores) {
    if (scores.isEmpty) {
      return 0;
    }

    final total = scores.fold<int>(0, (sum, item) => sum + item.score);
    return (total / scores.length).round();
  }

  static List<PreferredSizeWidget> _buildAxisVertices(List<_RadarAxis> axes) {
    return [
      _RadarAxisVertex(
        label: axes[0].shortLabel,
        score: axes[0].score,
        scoreColor: _scoreColor(axes[0].score),
        width: 136,
        height: 44,
        labelWidth: 84,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 48),
      ),
      _RadarAxisVertex(
        label: axes[1].shortLabel,
        score: axes[1].score,
        scoreColor: _scoreColor(axes[1].score),
        width: 128,
        height: 64,
        labelWidth: 96,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 24),
      ),
      _RadarAxisVertex(
        label: axes[2].shortLabel,
        score: axes[2].score,
        scoreColor: _scoreColor(axes[2].score),
        width: 136,
        height: 44,
        labelWidth: 84,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 48),
      ),
      _RadarAxisVertex(
        label: axes[3].shortLabel,
        score: axes[3].score,
        scoreColor: _scoreColor(axes[3].score),
        width: 136,
        height: 44,
        labelWidth: 84,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 48),
      ),
      _RadarAxisVertex(
        label: axes[4].shortLabel,
        score: axes[4].score,
        scoreColor: _scoreColor(axes[4].score),
        width: 128,
        height: 64,
        labelWidth: 96,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 24),
      ),
    ];
  }

  static Color _scoreColor(int score) {
    if (score >= 80) {
      return Colors.green.shade600;
    }
    if (score >= 60) {
      return Colors.amber.shade700;
    }
    return Colors.red.shade700;
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

class _RadarAxisVertex extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final int score;
  final Color scoreColor;
  final double width;
  final double height;
  final double? labelWidth;
  final Alignment alignment;
  final EdgeInsets padding;

  const _RadarAxisVertex({
    required this.label,
    required this.score,
    required this.scoreColor,
    required this.width,
    required this.height,
    this.labelWidth,
    required this.alignment,
    this.padding = EdgeInsets.zero,
  });

  @override
  Size get preferredSize => Size(width, height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: labelWidth,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  if (label.trim().isNotEmpty)
                    TextSpan(
                      text: '$label\n',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        height: 1.15,
                      ),
                    ),
                  TextSpan(
                    text: score.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: scoreColor,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RadarLegendItem extends StatelessWidget {
  final _RadarAxis axis;

  const _RadarLegendItem({required this.axis});

  @override
  Widget build(BuildContext context) {
    final scoreColor = MatchRadar._scoreColor(axis.score);
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
              color: scoreColor.withValues(alpha: 0.12),
              border: Border.all(color: scoreColor.withValues(alpha: 0.35)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              axis.score.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: scoreColor,
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
