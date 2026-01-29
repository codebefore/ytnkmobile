import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ytnkio/globals/global_constants.dart';
import 'package:ytnkio/globals/global_texts.dart';

class UserAgreementSection extends StatelessWidget {
  const UserAgreementSection({super.key});
  static const _textStyle = TextStyle(
    fontSize: 10,
    color: Colors.blueGrey,
    wordSpacing: 4,
  );
  static const _linkStyle = TextStyle(
    fontSize: 10,
    color: Colors.blue,
    wordSpacing: 4,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  _launchURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(children: [
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_userAgreementBeginning,
                style: _textStyle,
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_privacyPolicy,
                style: _linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(GlobalConstants.privacyPolicyUrl);
                  },
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_privacyPolicyText,
                style: _textStyle,
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_termsOfService,
                style: _linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(GlobalConstants.termsOfServiceUrl);
                  },
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_termsOfServiceText,
                style: _textStyle,
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_gdprCompliance,
                style: _linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(GlobalConstants.gdprComplianceUrl);
                  },
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_gdprComplianceText,
                style: _textStyle,
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_cookies,
                style: _linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL(GlobalConstants.cookiesUrl);
                  },
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_cookiesText,
                style: _textStyle,
              ),
              TextSpan(
                text: GlobalTexts.current.SIGNUP_PAGE_userAgreementEnding,
                style: _textStyle,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
