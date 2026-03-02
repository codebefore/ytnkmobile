import 'package:radar_chart/radar_chart.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/score_item.dart';
import 'package:ytnkio/widgets/match/match_card.dart';
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
    final normalizedScores = _normalizeScores(match.scores, radarLength);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(GlobalTexts.current.MATCH_PAGE_radar_title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          RadarChart(
            length: 5,
            radius: 90,
            initialAngle: 0,
            backgroundColor: Colors.white,
            borderStroke: 1,
            borderColor: Colors.grey.shade300,
            radialStroke: 1,
            radialColor: Colors.grey.shade200,
            vertices: [
              RadarVertex(
                radius: 10,
                text: normalizedScores[0].name,
                color: Colors.grey,
                textOffset: Offset(90, -10),
              ),
              RadarVertex(
                radius: 10,
                text: normalizedScores[1].name,
                color: Colors.grey,
                textOffset: Offset(0, 10),
              ),
              RadarVertex(
                radius: 10,
                text: normalizedScores[2].name,
                color: Colors.grey,
                textOffset: Offset(-130, 10),
              ),
              RadarVertex(
                radius: 10,
                text: normalizedScores[3].name,
                color: Colors.grey,
                textOffset: Offset(-90, -10),
              ),
              RadarVertex(
                  radius: 10,
                  text: normalizedScores[4].name,
                  color: Colors.grey,
                  textOffset: Offset(0, 0)),
            ],
            radars: [
              RadarTile(
                values: [
                  normalizedScores[0].score.clamp(0, 100) / 100.0,
                  normalizedScores[1].score.clamp(0, 100) / 100.0,
                  normalizedScores[2].score.clamp(0, 100) / 100.0,
                  normalizedScores[3].score.clamp(0, 100) / 100.0,
                  normalizedScores[4].score.clamp(0, 100) / 100.0,
                ],
                borderColor: Colors.indigoAccent,
                backgroundColor: Color.fromRGBO(83, 109, 254, 0.3),
                borderStroke: 2,
                vertices: [
                  RadarVertex(
                    radius: 10,
                    text: normalizedScores[0].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: normalizedScores[1].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: normalizedScores[2].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: normalizedScores[3].score.toString(),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: normalizedScores[4].score.toString(),
                  ),
                ],
              ),
            ],
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
}
