// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ytnkio/models/survey/choice.dart';
import 'package:ytnkio/models/survey/question_types_enum.dart';

class Question {
  String key;
  int order;
  String text;
  QuestionTypes type;
  List<Choice> choices;
  double? availablePercentage;

  Question(this.key, this.order, this.text, this.type, this.choices,
      this.availablePercentage);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'order': order,
      'text': text,
      'type': type.jsonCode,
      'choices': choices.map((x) => x.toMap()).toList(),
      'availablePercentage': availablePercentage,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      map['key'] as String,
      map['order'] as int,
      map['text'] as String,
      QuestionTypes.fromJsonCode(map['type'] as String),
      List<Choice>.from((map['choices'] as List<dynamic>).map<Choice>(
        (x) => Choice.fromMap(x as Map<String, dynamic>),
      )),
      double.tryParse(map['availablePercentage'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

}
