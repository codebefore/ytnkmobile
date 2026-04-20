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
  String whatWeOffer;
  String companyId;
  String companyName;
  String companyLogo;
  String departmentId;
  String departmentName;
  String location;
  String seniorityLevel;
  DateTime? createdAt;
  String workingMethod;
  String salaryExpectationMin;
  String salaryExpectationMax;
  String salaryExpectationUnit;
  bool showSalaryToTalent;
  String employmentScope;
  String typeOfPosition;
  List<ScoreItem> skillFitness;
  List<ScoreItem> scores;
  double? overallScore;

  Match({
    required this.id,
    required this.status,
    required this.positionId,
    required this.jobTitle,
    required this.requirements,
    required this.responsibilities,
    required this.aboutUs,
    required this.whatWeOffer,
    required this.companyId,
    required this.companyName,
    required this.companyLogo,
    required this.departmentId,
    required this.departmentName,
    required this.location,
    required this.seniorityLevel,
    required this.createdAt,
    required this.workingMethod,
    required this.salaryExpectationMin,
    required this.salaryExpectationMax,
    required this.salaryExpectationUnit,
    required this.showSalaryToTalent,
    required this.employmentScope,
    required this.typeOfPosition,
    required this.skillFitness,
    required this.scores,
    required this.overallScore,
  });

  factory Match.fromMap(Map<String, dynamic> map) {
    final parsedCreatedAt = _parseDateTime(map['createdAt']) ??
        _parseDateTime(map['creationDate']) ??
        _parseDateTime(map['lastCalculated']);

    return Match(
      id: map['id'] ?? '',
      status: _normalizeStatus(map['status']),
      positionId: map['positionId'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      requirements: map['requirements'] ?? '',
      responsibilities: map['responsibilities'] ?? '',
      aboutUs: map['aboutUs'] ?? '',
      whatWeOffer: map['whatWeOffer'] ?? '',
      companyId: map['companyId'] ?? '',
      companyName: map['companyName'] ?? '',
      companyLogo: map['companyLogo'] ?? '',
      departmentId: map['departmentId'] ?? '',
      departmentName: map['departmentName'] ?? '',
      location: map['location'] ?? '',
      seniorityLevel: map['seniorityLevel'] ?? '',
      createdAt: parsedCreatedAt,
      workingMethod: map['workingMethod'] ?? '',
      salaryExpectationMin: map['salaryExpectationMin'] ?? '',
      salaryExpectationMax: map['salaryExpectationMax'] ?? '',
      salaryExpectationUnit: map['salaryExpectationUnit'] ?? '',
      showSalaryToTalent: map['showSalaryToTalent'] is bool
          ? map['showSalaryToTalent']
          : true,
      employmentScope: map['employmentScope'] ?? '',
      typeOfPosition: map['typeOfPosition'] ?? '',
      skillFitness: List<ScoreItem>.from((map['skillFitness'] as List<dynamic>?)
              ?.map((x) => ScoreItem.fromMap(x))
              .toList() ??
          const []),
      scores: List<ScoreItem>.from((map['scores'] as List<dynamic>?)
              ?.map((x) => ScoreItem.fromMap(x))
              .toList() ??
          const []),
      overallScore: _parseDouble(map['overallScore']),
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
      'whatWeOffer': whatWeOffer,
      'companyId': companyId,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'departmentId': departmentId,
      'departmentName': departmentName,
      'location': location,
      'seniorityLevel': seniorityLevel,
      'createdAt': createdAt?.toIso8601String(),
      'workingMethod': workingMethod,
      'salaryExpectationMin': salaryExpectationMin,
      'salaryExpectationMax': salaryExpectationMax,
      'salaryExpectationUnit': salaryExpectationUnit,
      'showSalaryToTalent': showSalaryToTalent,
      'employmentScope': employmentScope,
      'typeOfPosition': typeOfPosition,
      'skillFitness': skillFitness.map((x) => x.toMap()).toList(),
      'scores': scores.map((x) => x.toMap()).toList(),
      'overallScore': overallScore,
    };
  }

  factory Match.fromJson(String source) => Match.fromMap(json.decode(source));

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

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    if (value is num) {
      return DateTime.fromMillisecondsSinceEpoch(value.round(), isUtc: true);
    }
    return null;
  }

  static double? _parseDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  static String _normalizeStatus(dynamic value) {
    final status = (value ?? '').toString().toLowerCase();
    if (status == 'waiting') {
      return 'pre-match';
    }
    if (status == 'pending') {
      return 'created';
    }
    return status;
  }

  bool get hasVisibleSalary =>
      showSalaryToTalent &&
      salaryExpectationMin.trim().isNotEmpty &&
      salaryExpectationMax.trim().isNotEmpty;
}
