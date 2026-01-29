import 'dart:convert';

class VerificationSentInfo {
  final String syncCode;
  final String emailSent;

  VerificationSentInfo({required this.syncCode, required this.emailSent});

  VerificationSentInfo.initial()
      : syncCode = "",
        emailSent = "";

  VerificationSentInfo copyWith({
    String? syncCode,
    String? emailSent,
  }) {
    return VerificationSentInfo(
      syncCode: syncCode ?? this.syncCode,
      emailSent: emailSent ?? this.emailSent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'syncCode': syncCode,
      'emailSent': emailSent,
    };
  }

  factory VerificationSentInfo.fromMap(Map<String, dynamic> map) {
    return VerificationSentInfo(
      syncCode: map['syncCode'] as String,
      emailSent: map['emailSent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerificationSentInfo.fromJson(String source) =>
      VerificationSentInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
