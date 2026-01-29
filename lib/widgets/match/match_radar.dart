import 'package:radar_chart/radar_chart.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
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
                text: match.scores[0].name,
                color: Colors.grey,
                textOffset: Offset(90, -10),
              ),
              RadarVertex(
                radius: 10,
                text: match.scores[1].name,
                color: Colors.grey,
                textOffset: Offset(0, 10),
              ),
              RadarVertex(
                radius: 10,
                text: match.scores[2].name,
                color: Colors.grey,
                textOffset: Offset(-130, 10),
              ),
              RadarVertex(
                radius: 10,
                text: match.scores[3].name,
                color: Colors.grey,
                textOffset: Offset(-90, -10),
              ),
              RadarVertex(
                  radius: 10,
                  text: match.scores[4].name,
                  color: Colors.grey,
                  textOffset: Offset(0, 0)),
            ],
            radars: [
              RadarTile(
                values: [
                  double.tryParse(match.scores[0].score.toString())! / 100,
                  double.tryParse(match.scores[1].score.toString())! / 100,
                  double.tryParse(match.scores[2].score.toString())! / 100,
                  double.tryParse(match.scores[3].score.toString())! / 100,
                  double.tryParse(match.scores[4].score.toString())! / 100,
                ],
                borderColor: Colors.indigoAccent,
                backgroundColor: Color.fromRGBO(83, 109, 254, 0.3),
                borderStroke: 2,
                vertices: [
                  RadarVertex(
                    radius: 10,
                    text: match.scores[0].score.toString(),
                    textOffset: Offset(
                        double.tryParse(match.scores[0].score.toString()) ?? 0,
                        0),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: match.scores[1].score.toString(),
                    textOffset: Offset(
                        double.tryParse(match.scores[1].score.toString()) ?? 0,
                        0),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: match.scores[2].score.toString(),
                    textOffset: Offset(
                        double.tryParse(match.scores[2].score.toString()) ?? 0,
                        0),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: match.scores[3].score.toString(),
                    textOffset: Offset(
                        double.tryParse(match.scores[3].score.toString()) ?? 0,
                        0),
                  ),
                  RadarVertex(
                    radius: 10,
                    text: match.scores[4].score.toString(),
                    textOffset: Offset(
                        double.tryParse(match.scores[4].score.toString()) ?? 0,
                        0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
