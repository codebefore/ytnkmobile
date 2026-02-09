part of 'global_bloc.dart';

class RetrieveDeviceIdEvent extends GlobalEvent {
  RetrieveDeviceIdEvent();
}

class RestoreSessionEvent extends GlobalEvent {
  RestoreSessionEvent();
}

class LoginWithEmailPasswordEvent extends GlobalEvent {
  final String email;
  final String password;

  LoginWithEmailPasswordEvent(this.email, this.password);

  List<Object> get props => [email, password];
}

class LoginWithGoogleEvent extends GlobalEvent {
  LoginWithGoogleEvent();

  List<Object> get props => [];
}

class LogoutEvent extends GlobalEvent {
  LogoutEvent();
}

class SignupWithGoogleEvent extends GlobalEvent {
  SignupWithGoogleEvent();

  List<Object> get props => [];
}

class SignupEvent extends GlobalEvent {
  final String referenceCode;
  final String fullName;
  final String email;
  final String countryCode;
  final String countryName;
  final String phone;
  final String location;
  final String password;
  final bool isSocial;

  SignupEvent({
    required this.referenceCode,
    required this.fullName,
    required this.email,
    required this.countryCode,
    required this.countryName,
    required this.phone,
    required this.location,
    required this.password,
    required this.isSocial,
  });

  List<Object> get props => [
        referenceCode,
        fullName,
        email,
        countryCode,
        countryName,
        phone,
        location,
        password,
        isSocial,
      ];
}

class ForgotPasswordEvent extends GlobalEvent {
  final String email;

  ForgotPasswordEvent({required this.email});
}

class SendVerificationEmailEvent extends GlobalEvent {
  final AuthUserInfo user;

  SendVerificationEmailEvent(this.user);
}

class VerifyEmailEvent extends GlobalEvent {
  final String syncCode;
  final String verificationCode;
  final String email;
  final String userId;

  VerifyEmailEvent(
      this.syncCode, this.verificationCode, this.email, this.userId);
}
