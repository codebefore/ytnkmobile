import 'dart:convert';

class SocialAccountInfo {
  String accountType;
  String userName;
  String url;

  SocialAccountInfo({
    required this.accountType,
    required this.userName,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountType': accountType,
      'userName': userName,
      'url': url,
    };
  }

  factory SocialAccountInfo.fromMap(Map<String, dynamic> map) {
    return SocialAccountInfo(
      accountType: map['accountType'] as String,
      userName: map['userName'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialAccountInfo.fromJson(String source) =>
      SocialAccountInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
