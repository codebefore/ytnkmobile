// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:intl_phone_field/countries.dart';
import 'package:ytnkio/core_module.dart';

class GlobalConstants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String appTitle = "ytnk.io";
  static const String linkedInRedirectUrl =
      "https://www.linkedin.com/developers/apps/211444985";
  static const String linkedInClientId = "77b2jw38wx9osf";
  static const String linkedInClientSecret = "PG5M3CqP96CIRZzn";
  static const String appLogoPath = "lib/assets/images/ytnkio.png";
  static const String splashLogoPath = "lib/assets/images/logo.png";
  static const String googleLogoPath = "lib/assets/images/google_logo.png";
  static const String rssFeedUrl =
      "https://www.personneltoday.com/global-hr/feed/";
  static const String startSurveyImagePath = "lib/assets/images/landing2.png";
  static const String completeSurveyImagePath =
      "lib/assets/images/plan.png";

  static const Color defaultBarColor = Colors.white;
  static const Color defaultTitleColor = Colors.indigo;
  static const Color defaultTextColor = Colors.indigo;
  static const Color defaultLabelColor = Color.fromARGB(255, 89, 109, 220);
  static const Color defaultBorderColor = Colors.indigo;
  static const Color defaultErrorBorderColor = Colors.red;
  static const Color defaultPageColor = Colors.white;
  static const Color defaultButtonColor = Colors.indigo;
  static const Color passiveButtonColor = Color.fromRGBO(159, 168, 218, 1);
  static const Color defaultButtonTextColor = Colors.white;

  static const String privacyPolicyUrl = "https://ytnk.io/";
  static const String termsOfServiceUrl = "https://ytnk.io/";
  static const String gdprComplianceUrl = "https://ytnk.io/";
  static const String cookiesUrl = "https://ytnk.io/";
  static const String emailCommunicationUrl = "https://ytnk.io/";

  static const String defaultLanguageCode = "en";
  static const String countryCode = "GB";
  static List<Country> selectableCountries = countries.where((country) {
    return country.code == "TR" ||
        country.code == "GB" ||
        country.code == "US" ||
        country.code == "DE" ||
        country.code == "FR" ||
        country.code == "IT" ||
        country.code == "ES" ||
        country.code == "AT" ||
        country.code == "AZ" ||
        country.code == "RU";
  }).toList();

  const GlobalConstants();
}
