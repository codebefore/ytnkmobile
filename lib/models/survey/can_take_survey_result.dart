import 'dart:convert';

class CanTakeSurveyResult {
  final bool canTakeSurvey;
  final int remainingMinutesForNewSurvey;

  CanTakeSurveyResult({
    required this.canTakeSurvey,
    required this.remainingMinutesForNewSurvey,
  });

  Map<String, dynamic> toMap() {
    return {
      'canTakeSurvey': canTakeSurvey,
      'remainingTimeForNewSurvey': remainingMinutesForNewSurvey,
    };
  }

  factory CanTakeSurveyResult.fromMap(Map<String, dynamic> map) {
    return CanTakeSurveyResult(
      canTakeSurvey: map['canTakeSurvey'] as bool,
      remainingMinutesForNewSurvey: map['remainingTimeForNewSurvey'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CanTakeSurveyResult.fromJson(String source) =>
      CanTakeSurveyResult.fromMap(json.decode(source) as Map<String, dynamic>);
}