// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Phone {
  final String country;
  final String countrySuffix;
  final String number;

  Phone({
    required this.country,
    required this.countrySuffix,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'countrySuffix': countrySuffix,
      'number': number,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      country: map['country'] as String,
      countrySuffix: map['countrySuffix'] as String,
      number: map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) =>
      Phone.fromMap(json.decode(source) as Map<String, dynamic>);
}
