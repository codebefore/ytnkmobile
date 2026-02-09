// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Choice {
  String key;
  int order;
  String text;
  bool? checked;
  double? percent;
  int? selectionOrder;

  Choice(
    this.key,
    this.order,
    this.text,
    this.checked,
    this.percent,
    this.selectionOrder,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'order': order,
      'text': text,
      'checked': checked,
      'percent': percent,
      'selectionOrder': selectionOrder,
    };
  }

  factory Choice.fromMap(Map<String, dynamic> map) {
    return Choice(
      map['key'] as String,
      map['order'] as int,
      map['text'] as String,
      map['checked'] != null ? map['checked'] as bool : null,
      map['percent'] != null ? double.tryParse(map['percent'].toString()) : null,
      map['selectionOrder'] != null ? map['selectionOrder'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Choice.fromJson(String source) =>
      Choice.fromMap(json.decode(source) as Map<String, dynamic>);
}
