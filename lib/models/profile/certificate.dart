// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ytnkio/services/common/id_generator.dart';

class Certificate {
  final String id;
  final String name;
  final String issuer;
  final String certificateId;
  final String certificateUrl;
  final String description;

  Certificate({
    required this.id,
    required this.name,
    required this.issuer,
    required this.certificateId,
    required this.certificateUrl,
    required this.description,
  });

  Certificate.initial()
      : id = IDGenerator.generateObjectId(),
        name = "",
        issuer = "",
        certificateId = "",
        certificateUrl = "",
        description = "";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'issuer': issuer,
      'certificateId': certificateId,
      'certificateUrl': certificateUrl,
      'description': description,
    };
  }

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
      id: map['id'] as String,
      name: map['name'] as String,
      issuer: map['issuer'] as String,
      certificateId: map['certificateId'] as String,
      certificateUrl: map['certificateUrl'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Certificate.fromJson(String source) =>
      Certificate.fromMap(json.decode(source) as Map<String, dynamic>);
}
