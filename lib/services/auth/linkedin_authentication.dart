// ignore_for_file: public_member_api_docs, sort_constructors_first
class LinkedInAuthentication {
  final authorizationUrl = 'https://www.linkedin.com/uas/oauth2/authorization';
  final accessTokenUrl = 'https://www.linkedin.com/uas/oauth2/accessToken';

  String key;
  String secret;
  String redirectUri;
  List<Permissions> permissions;
  String? state;
  String? authorizationCode;
  String? token;
  String? error;

  LinkedInAuthentication(
    this.key,
    this.secret,
    this.redirectUri,
    this.permissions,
    this.state,
    this.authorizationCode,
    this.token,
    this.error,
  );

  String getAuthorizationUrl() {
    var str = "$authorizationUrl?";

    str += "response_type=code&";
    str += "client_id=$key&";
    str += "scope=${permissions.join(" ")}&";
    str += "state=${state ?? makeNewState()}&";
    str += "redirect_uri=$redirectUri";

    return str;
  }

  String makeNewState() {
    return "";
  }

  void getAccessToken({timeout = 60}) {
    if (authorizationCode == null) {
      throw Exception("You must first get the authorization code");
    }

    // var data = {
    //   "grant_type": "authorization_code",
    //   "code": authorizationCode,
    //   "redirect_uri": redirectUri,
    //   "client_id": key,
    //   "client_secret": secret,
    // };

    // var request = HttpClient().post(accessTokenUrl, 80, accessTokenUrl);
  }
}

enum Permissions {
  companyAdmin(value: "rw_company_admin"),
  basicProfile(value: "r_basicprofile"),
  fullProfile(value: "r_fullprofile"),
  emailAddress(value: "r_emailaddress"),
  network(value: "r_network"),
  contactInfo(value: "r_contactinfo"),
  networkUpdates(value: "rw_nus"),
  groups(value: "rw_groups"),
  messages(value: "w_messages"),
  ;

  const Permissions({required this.value});

  final String value;
}

enum EndPoints {
  people(value: "https://api.linkedin.com/v1/people"),
  peopleSearch(value: "https://api.linkedin.com/v1/people-search"),
  groups(value: "https://api.linkedin.com/v1/groups"),
  posts(value: "https://api.linkedin.com/v1/posts"),
  companies(value: "https://api.linkedin.com/v1/companies"),
  companySearch(value: "https://api.linkedin.com/v1/company-search"),
  jobs(value: "https://api.linkedin.com/v1/jobs"),
  jobsSearch(value: "https://api.linkedin.com/v1/job-search");

  const EndPoints({required this.value});

  final String value;
}

enum NetworkUpdates {
  application(value: "APPS"),
  company(value: "CMPY"),
  connection(value: "CONN"),
  job(value: "JOBS"),
  group(value: "JGRP"),
  picture(value: "PICT"),
  extendedProfile(value: "PRFX"),
  changedProfile(value: "PRFU"),
  shared(value: "SHAR"),
  viral(value: "VIRL");

  const NetworkUpdates({required this.value});

  final String value;
}
