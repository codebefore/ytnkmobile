// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ytnkio/models/common/social_account_info.dart';

class Organisation {
  String name;
  List<SocialAccountInfo>? socialAccounts;

  Organisation({
    required this.name,
    required this.socialAccounts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'socialAccounts': socialAccounts};
  }

  factory Organisation.initial() {
    return Organisation(name: '', socialAccounts: []);
  }

  factory Organisation.fromMap(Map<String, dynamic> map) {
    return Organisation(
      name: map['name'] as String,
      socialAccounts: map['socialAccounts'] != null
          ? List<SocialAccountInfo>.from(map['socialAccounts'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Organisation.fromJson(String source) =>
      Organisation.fromMap(json.decode(source) as Map<String, dynamic>);
}
