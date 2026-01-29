// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/models/common/location.dart';
import 'package:ytnkio/models/common/phone.dart';
import 'package:ytnkio/models/profile/preferences.dart';
import 'package:ytnkio/services/common/id_generator.dart';
import 'package:ytnkio/services/common/helpers.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_pdf_resume.dart';
import 'package:ytnkio/models/profile/certificate.dart';
import 'package:ytnkio/models/profile/education.dart';
import 'package:ytnkio/models/common/organisation.dart';
import 'package:ytnkio/models/profile/skill.dart';
import 'package:ytnkio/models/common/social_account_info.dart';
import 'package:ytnkio/models/profile/work_experience.dart';

class Profile extends Equatable {
  final String id;
  final String avatarId;
  final String firstName;
  final String lastName;
  final String headline;
  final String summary;
  final List<Phone> phones;
  final Location location;
  final List<String> emails;
  final List<SocialAccountInfo> socialAccounts;
  final List<WorkExperience> workExperiences;
  final List<Education> educations;
  final List<Certificate> certificates;
  final List<Skill> skills;
  final List<String> websites;
  final Preferences preferences;
  final double completeness;
  final int activityLevel;
  final String languageCode;

  const Profile({
    required this.id,
    required this.avatarId,
    required this.firstName,
    required this.lastName,
    required this.headline,
    required this.summary,
    required this.phones,
    required this.location,
    required this.emails,
    required this.socialAccounts,
    required this.workExperiences,
    required this.educations,
    required this.certificates,
    required this.skills,
    required this.websites,
    required this.completeness,
    required this.preferences,
    required this.activityLevel,
    required this.languageCode,
  });

  Profile copyWith({
    String? id,
    String? avatarId,
    AuthUserInfo? user,
    String? firstName,
    String? lastName,
    String? headline,
    String? summary,
    List<Phone>? phones,
    Location? location,
    List<String>? emails,
    List<SocialAccountInfo>? socialAccounts,
    List<WorkExperience>? workExperiences,
    List<Education>? educations,
    List<Certificate>? certificates,
    List<Skill>? skills,
    List<String>? websites,
    double? completeness,
    Preferences? preferences,
    int? activityLevel,
    String? languageCode,
  }) {
    return Profile(
      id: id ?? this.id,
      avatarId: avatarId ?? this.avatarId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      headline: headline ?? this.headline,
      summary: summary ?? this.summary,
      phones: phones ?? this.phones,
      location: location ?? this.location,
      emails: emails ?? this.emails,
      socialAccounts: socialAccounts ?? this.socialAccounts,
      workExperiences: workExperiences ?? this.workExperiences,
      educations: educations ?? this.educations,
      certificates: certificates ?? this.certificates,
      skills: skills ?? this.skills,
      websites: websites ?? this.websites,
      completeness: completeness ?? this.completeness,
      preferences: preferences ?? this.preferences,
      activityLevel: activityLevel ?? this.activityLevel,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      avatarId,
      firstName,
      lastName,
      headline,
      summary,
      phones,
      location,
      emails,
      socialAccounts,
      workExperiences,
      educations,
      certificates,
      skills,
      websites,
      completeness,
      preferences,
      activityLevel,
      languageCode,
    ];
  }

  factory Profile.initial() {
    return Profile(
      id: "",
      avatarId: "",
      firstName: "",
      lastName: "",
      headline: "",
      summary: "",
      phones: List.empty(),
      location: Location.initial(),
      emails: List.empty(),
      socialAccounts: List.empty(),
      workExperiences: List.empty(),
      educations: List.empty(),
      certificates: List.empty(),
      skills: List.empty(),
      websites: List.empty(),
      completeness: 0,
      preferences: Preferences.initial(),
      activityLevel: 0,
      languageCode: "en",
    );
  }

  factory Profile.fromUser(AuthUserInfo user) {
    return Profile(
      id: IDGenerator.generateObjectId(),
      avatarId: "",
      firstName: user.name,
      lastName: user.surname,
      headline: "",
      summary: "",
      phones: List.empty(),
      location: Location.initial(),
      emails: [user.email],
      socialAccounts: List.empty(),
      workExperiences: List.empty(),
      educations: List.empty(),
      certificates: List.empty(),
      skills: List.empty(),
      websites: List.empty(),
      completeness: 0,
      preferences: Preferences.initial(),
      activityLevel: 0,
      languageCode: "en",
    );
  }

  Profile fillFromLinkedinPdfResume(LinkedinPdfResume resume) {
    var linkedinUrl = "";
    var linkedinUsername = "";

    linkedinUrl = resume.contacts.linkedinUrl;
    linkedinUsername = linkedinUrl.lastIndexOf("/") < 0
        ? ""
        : linkedinUrl.substring(linkedinUrl.lastIndexOf("/"));

    var nameArr = resume.basicInfo.fullname.split(" ");
    var firstName = "";
    var lastName = "";

    if (nameArr.length > 1) {
      firstName = nameArr[0];
      lastName = nameArr[1];
    } else {
      firstName = nameArr[0];
      lastName = "";
    }

    return copyWith(
      id: id,
      avatarId: avatarId,
      firstName: firstName,
      lastName: lastName,
      headline: resume.basicInfo.headline,
      summary: resume.summary.summary,
      phones: [
        ...[
          Phone(country: "", countrySuffix: "", number: resume.contacts.phone)
        ]
      ],
      location: Location(
          country: "", state: "", city: "", address: resume.basicInfo.location),
      emails: [
        ...[resume.contacts.email]
      ],
      socialAccounts: [
        SocialAccountInfo(
            accountType: "linkedin",
            userName: linkedinUsername,
            url: linkedinUrl),
      ],
      workExperiences: resume.experiences.experiences!
          .map<WorkExperience>(
            (e) => WorkExperience(
              id: IDGenerator.generateObjectId(),
              organisation: Organisation(
                  name: e.organisation, socialAccounts: List.empty()),
              workType: "",
              title: e.position,
              description: e.description,
              location: e.location,
              startedOnYear: e.startYear,
              startedOnMonth: e.startMonth,
              endedOnYear: e.endYear,
              endedOnMonth: e.endMonth,
              isCurrent: e.onGoing,
            ),
          )
          .toList(),
      educations: resume.educations.educations!
          .map<Education>(
            (e) => Education(
                id: IDGenerator.generateObjectId(),
                school: Organisation(
                    name: e.organisation, socialAccounts: List.empty()),
                grade: "",
                degree: e.degree,
                startedOnMonth: GlobalTexts.current.MONTHS[0],
                startedOnYear: e.startYear,
                endedOnMonth: GlobalTexts.current.MONTHS[0],
                endedOnYear: e.endYear,
                isCurrent: e.onGoing,
                description: "",
                fieldsOfStudy: [e.field]),
          )
          .toList(),
      skills: resume.topSkills.skills!
          .map<Skill>(
            (e) => Skill(
              id: IDGenerator.generateObjectId(),
              name: e,
              text: e,
              point: 0,
            ),
          )
          .toList(),
      languageCode: "en",
    );
    //todo: other social account data will be filled
    //todo: other fields will be added and checks/validations will be added
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatarId': avatarId,
      'firstName': firstName,
      'lastName': lastName,
      'headline': headline,
      'summary': summary,
      'phones': phones.map((x) => x.toMap()).toList(),
      'location': location.toMap(),
      'emails': emails,
      'socialAccounts': socialAccounts.map((x) => x.toMap()).toList(),
      'workExperiences': workExperiences.map((x) => x.toMap()).toList(),
      'educations': educations.map((x) => x.toMap()).toList(),
      'certificates': certificates.map((x) => x.toMap()).toList(),
      'skills': skills.map((x) => x.toMap()).toList(),
      'websites': websites,
      'completeness': completeness,
      'preferences': preferences.toMap(),
      'activityLevel': activityLevel,
      'languageCode': languageCode,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      avatarId: map['avatarId'] != null ? map['avatarId'] as String : "",
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      headline: map['headline'] as String,
      summary: map['summary'] as String,
      phones: map['phones'] != null
          ? List<Phone>.from(
              map['phones'].map<Phone>(
                (x) => Phone.fromMap(x as Map<String, dynamic>),
              ),
            )
          : List.empty(),
      location: map['location'] != null
          ? Location.fromMap(map["location"])
          : Location.initial(), //todo: Location.fromMap(map["location"])
      emails: map['emails'] != null
          ? List<String>.from(Helpers.toListString(map['emails']))
          : [],
      socialAccounts: map["socialAccounts"] != null
          ? List<SocialAccountInfo>.from(
              map['socialAccounts'].map<SocialAccountInfo>(
                (x) => SocialAccountInfo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : List.empty(),
      workExperiences: map["workExperiences"] != null
          ? List<WorkExperience>.from(
              map['workExperiences'].map<WorkExperience>(
                (x) => WorkExperience.fromMap(x as Map<String, dynamic>),
              ),
            )
          : List.empty(),
      educations: map["educations"] != null
          ? List<Education>.from(
              map['educations'].map<Education>(
                (x) => Education.fromMap(x as Map<String, dynamic>),
              ),
            )
          : List.empty(),
      certificates: map["certificates"] != null
          ? List<Certificate>.from(
              map['certificates'].map<Certificate>(
                (x) => Certificate.fromMap(x as Map<String, dynamic>),
              ),
            )
          : List.empty(),
      skills: map["skills"] != null
          ? List<Skill>.from(
              map['skills'].map<Skill>(
                (x) => Skill.fromMap(x as Map<String, dynamic>),
              ),
            )
          : List.empty(),
      websites: map['websites'] != null
          ? List<String>.from(Helpers.toListString(map['websites']))
          : [],
      completeness: (map['completeness'] as num).toDouble(),
      preferences: map['preferences'] != null
          ? Preferences.fromMap(map['preferences'])
          : Preferences.initial(),
      activityLevel: map['activityLevel'] as int,
      languageCode: map['languageCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
