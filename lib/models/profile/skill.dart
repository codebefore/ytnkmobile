import 'dart:convert';

import 'package:ytnkio/services/common/id_generator.dart';

class Skill {
  final String id;
  final String name;
  final String text;
  final int point;

  Skill({
    required this.id,
    required this.name,
    required this.text,
    required this.point,
  });

  Skill.initial()
      : id = IDGenerator.generateObjectId(),
        name = '',
        text = '',
        point = 0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'text': text,
      'point': point,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] as String,
      name: map['name'] as String,
      text: (map['text'] ?? map['name']) as String,
      point: (map['point'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) =>
      Skill.fromMap(json.decode(source) as Map<String, dynamic>);
}
