// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScoreItem {
  String name;
  int score;

  ScoreItem(
    this.name,
    this.score,
  );

  static List<ScoreItem> fromList(List<dynamic> list) {
    return list.map((e) => ScoreItem.fromMap(e as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'score': score,
    };
  }

  factory ScoreItem.fromMap(Map<String, dynamic> map) {
    return ScoreItem(
      map['name'] as String,
      map['score'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreItem.fromJson(String source) =>
      ScoreItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
