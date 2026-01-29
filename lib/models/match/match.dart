import 'dart:convert';
import 'package:ytnkio/models/match/score_item.dart';

class Match {
  String id;
  String status;
  String positionId;
  String jobTitle;
  String requirements;
  String responsibilities;
  String aboutUs;
  String companyId;
  String companyName;
  String departmentId;
  String departmentName;
  String location;
  String seniorityLevel;
  DateTime createdAt;
  String workingMethod;
  String salaryExpectationMin;
  String salaryExpectationMax;
  String salaryExpectationUnit;
  String employmentScope;
  String typeOfPosition;
  List<ScoreItem> skillFitness;
  List<ScoreItem> scores;

  Match({
    required this.id,
    required this.status,
    required this.positionId,
    required this.jobTitle,
    required this.requirements,
    required this.responsibilities,
    required this.aboutUs,
    required this.companyId,
    required this.companyName,
    required this.departmentId,
    required this.departmentName,
    required this.location,
    required this.seniorityLevel,
    required this.createdAt,
    required this.workingMethod,
    required this.salaryExpectationMin,
    required this.salaryExpectationMax,
    required this.salaryExpectationUnit,
    required this.employmentScope,
    required this.typeOfPosition,
    required this.skillFitness,
    required this.scores,
  });

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      positionId: map['positionId'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      requirements: map['requirements'] ?? '',
      responsibilities: map['responsibilities'] ?? '',
      aboutUs: map['aboutUs'] ?? '',
      companyId: map['companyId'] ?? '',
      companyName: map['companyName'] ?? '',
      departmentId: map['departmentId'] ?? '',
      departmentName: map['departmentName'] ?? '',
      location: map['location'] ?? '',
      seniorityLevel: map['seniorityLevel'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      workingMethod: map['workingMethod'] ?? '',
      salaryExpectationMin: map['salaryExpectationMin'] ?? '',
      salaryExpectationMax: map['salaryExpectationMax'] ?? '',
      salaryExpectationUnit: map['salaryExpectationUnit'] ?? '',
      employmentScope: map['employmentScope'] ?? '',
      typeOfPosition: map['typeOfPosition'] ?? '',
      skillFitness: List<ScoreItem>.from(
          map['skillFitness']?.map((x) => ScoreItem.fromMap(x)) ?? const []),
      scores:
          List<ScoreItem>.from(map['scores']?.map((x) => ScoreItem.fromMap(x)) ??
              const []),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'positionId': positionId,
      'jobTitle': jobTitle,
      'requirements': requirements,
      'responsibilities': responsibilities,
      'aboutUs': aboutUs,
      'companyId': companyId,
      'companyName': companyName,
      'departmentId': departmentId,
      'departmentName': departmentName,
      'location': location,
      'seniorityLevel': seniorityLevel,
      'createdAt': createdAt.toIso8601String(),
      'workingMethod': workingMethod,
      'salaryExpectationMin': salaryExpectationMin,
      'salaryExpectationMax': salaryExpectationMax,
      'salaryExpectationUnit': salaryExpectationUnit,
      'employmentScope': employmentScope,
      'typeOfPosition': typeOfPosition,
      'skillFitness': skillFitness.map((x) => x.toMap()).toList(),
      'scores': scores.map((x) => x.toMap()).toList(),
    };
  }

  factory Match.fromJson(String source) =>
      Match.fromMap(json.decode(source));

  static List<Match> fromJsonList(String source) {
    List<dynamic> list = json.decode(source);
    List<Match> matches = List.empty(growable: true);

    for (var item in list) {
      matches.add(Match.fromMap(item));
    }

    return matches;
  }

  String toJson() {
    return json.encode(toMap());
  }
}
