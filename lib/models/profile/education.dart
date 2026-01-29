// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ytnkio/services/common/helpers.dart';
import 'package:ytnkio/models/common/organisation.dart';
import 'package:ytnkio/services/common/id_generator.dart';

class Education {
  final String id;
  final Organisation school;
  final String degree;
  final String grade;
  final String startedOnMonth;
  final String startedOnYear;
  final String endedOnMonth;
  final String endedOnYear;
  final List<String>? fieldsOfStudy;
  final String description;
  final bool isCurrent;

  Education({
    required this.id,
    required this.school,
    required this.degree,
    required this.grade,
    required this.startedOnMonth,
    required this.startedOnYear,
    required this.endedOnMonth,
    required this.endedOnYear,
    required this.fieldsOfStudy,
    required this.description,
    required this.isCurrent,
  });

  Education.initial()
      : id = IDGenerator.generateObjectId(),
        school = Organisation.initial(),
        degree = '',
        grade = '',
        startedOnMonth = '',
        startedOnYear = '',
        endedOnMonth = '',
        endedOnYear = '',
        fieldsOfStudy = [],
        description = '',
        isCurrent = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'school': school.toMap(),
      'degree': degree,
      'grade': grade,
      'startedOnMonth': startedOnMonth,
      'startedOnYear': startedOnYear,
      'endedOnMonth': endedOnMonth,
      'endedOnYear': endedOnYear,
      'fieldsOfStudy': fieldsOfStudy,
      'description': description,
      'isCurrent': isCurrent,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'] as String,
      school: Organisation.fromMap(map['school'] as Map<String, dynamic>),
      degree: map['degree'] as String,
      grade: map['grade'] as String,
      startedOnMonth: map['startedOnMonth'] as String,
      startedOnYear: map['startedOnYear'] as String,
      endedOnMonth: map['endedOnMonth'] as String,
      endedOnYear: map['endedOnYear'] as String,
      fieldsOfStudy:
          List<String>.from(Helpers.toListString(map['fieldsOfStudy'])),
      description: map['description'] as String,
      isCurrent: map['isCurrent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);
}
