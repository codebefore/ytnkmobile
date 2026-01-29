import 'dart:convert';

class AuthUserInfo {
  String userId;
  String email;
  String name;
  String surname;
  String deviceId;
  bool isSocial;
  bool isEmailVerified;

  AuthUserInfo({
    required this.userId,
    required this.email,
    required this.name,
    required this.surname,
    this.deviceId = "",
    this.isSocial = false,
    this.isEmailVerified = false,
  });

  AuthUserInfo.initial()
      : userId = "",
        email = "",
        name = "",
        surname = "",
        deviceId = "",
        isSocial = false,
        isEmailVerified = false;

  AuthUserInfo copyWith({
    String? userId,
    String? email,
    String? name,
    String? surname,
    String? deviceId,
    bool? isSocial,
    bool? isEmailVerified,
  }) {
    return AuthUserInfo(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      deviceId: deviceId ?? this.deviceId,
      isSocial: isSocial ?? this.isSocial,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'name': name,
      'surname': surname,
      'deviceId': deviceId,
      'isSocial': isSocial,
      'isEmailVerified': isEmailVerified,
    };
  }

  factory AuthUserInfo.fromMap(Map<String, dynamic> map) {
    return AuthUserInfo(
      userId: map['userId'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      deviceId: map['deviceId'] as String,
      isSocial: map['isSocial'] as bool,
      isEmailVerified: map['isEmailVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUserInfo.fromJson(String source) =>
      AuthUserInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
