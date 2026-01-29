// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ytnkio/models/survey/question.dart';

class Survey {
  String name;
  String description;
  List<Question> questions;

  Survey(this.name, this.description, this.questions);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      map['name'] as String,
      map['description'] as String,
      List<Question>.from(
        (map['questions'] as List<dynamic>).map<Question>(
          (x) => Question.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Survey.fromJson(String source) =>
      Survey.fromMap(json.decode(source) as Map<String, dynamic>);
}
