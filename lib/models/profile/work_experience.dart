// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ytnkio/models/common/organisation.dart';
import 'package:ytnkio/services/common/id_generator.dart';

class WorkExperience extends Equatable {
  final String id;
  final Organisation organisation;
  final String title;
  final String workType;
  final String description;
  final String location;
  final String startedOnYear;
  final String startedOnMonth;
  final String endedOnYear;
  final String endedOnMonth;
  final bool isCurrent;

  @override
  List<Object?> get props => [
        id,
        organisation,
        title,
        workType,
        description,
        location,
        startedOnYear,
        startedOnMonth,
        endedOnYear,
        endedOnMonth,
        isCurrent,
      ];

  const WorkExperience({
    required this.id,
    required this.organisation,
    required this.title,
    required this.workType,
    required this.description,
    required this.location,
    required this.startedOnYear,
    required this.startedOnMonth,
    required this.endedOnYear,
    required this.endedOnMonth,
    required this.isCurrent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'organisation': organisation.toMap(),
      'title': title,
      'workType': workType,
      'description': description,
      'location': location,
      'startedOnYear': startedOnYear,
      'startedOnMonth': startedOnMonth,
      'endedOnYear': endedOnYear,
      'endedOnMonth': endedOnMonth,
      'isCurrent': isCurrent,
    };
  }

  factory WorkExperience.initial() {
    return WorkExperience(
      id: IDGenerator.generateObjectId(),
      organisation: Organisation.initial(),
      title: '',
      workType: '',
      description: '',
      location: '',
      startedOnYear: '',
      startedOnMonth: '',
      endedOnYear: '',
      endedOnMonth: '',
      isCurrent: false,
    );
  }

  factory WorkExperience.fromMap(Map<String, dynamic> map) {
    return WorkExperience(
      id: map['id'] as String,
      organisation:
          Organisation.fromMap(map['organisation'] as Map<String, dynamic>),
      title: map['title'] as String,
      workType: map['workType'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      startedOnYear: map['startedOnYear'] as String,
      startedOnMonth: map['startedOnMonth'] as String,
      endedOnYear: map['endedOnYear'] as String,
      endedOnMonth: map['endedOnMonth'] as String,
      isCurrent: map['isCurrent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkExperience.fromJson(String source) =>
      WorkExperience.fromMap(json.decode(source) as Map<String, dynamic>);
}
