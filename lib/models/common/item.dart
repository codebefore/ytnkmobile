// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  String key;
  String text;

  Item(
    this.key,
    this.text,
  );

  static List<Item> fromList(List<dynamic> list) {
    return list.map((e) => Item.fromMap(e as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'text': text,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['key'] as String,
      map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
