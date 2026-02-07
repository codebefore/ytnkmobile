// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ytnkio/models/common/item.dart';
import 'package:ytnkio/models/common/option_selection.dart';

class Preferences extends Equatable {
  static const Set<String> _validCurrencies = {"try", "usd", "eur"};

  static String _normalizeCurrency(String value) {
    if (_validCurrencies.contains(value)) {
      return value;
    }
    return "try";
  }

  final List<OptionSelection> companySize;
  final List<OptionSelection> companyType;
  final List<Item> sectors;
  final List<OptionSelection> typeOfPosition;
  final String hiringUrgency;
  final String seniorityLevel;
  final String salaryCurrent;
  final String salaryCurrentCurrency;
  final String salaryExpectation;
  final String salaryExpectationCurrency;
  final List<Item> legalCountries;
  final List<Item> wantedCountries;
  final List<OptionSelection> workingMethod;

  @override
  List<Object?> get props => [
        companySize,
        companyType,
        sectors,
        typeOfPosition,
        hiringUrgency,
        seniorityLevel,
        salaryCurrent,
        salaryCurrentCurrency,
        salaryExpectation,
        salaryExpectationCurrency,
        legalCountries,
        wantedCountries,
        workingMethod,
      ];

  const Preferences({
    required this.companySize,
    required this.companyType,
    required this.sectors,
    required this.typeOfPosition,
    required this.hiringUrgency,
    required this.seniorityLevel,
    required this.salaryCurrent,
    required this.salaryCurrentCurrency,
    required this.salaryExpectation,
    required this.salaryExpectationCurrency,
    required this.legalCountries,
    required this.wantedCountries,
    required this.workingMethod,
  });

  Map<String, dynamic> toMap() {
    final normalizedCurrency = _normalizeCurrency(salaryCurrentCurrency);

    return <String, dynamic>{
      'companySize': companySize.map((x) => x.toMap()).toList(),
      'companyType': companyType.map((x) => x.toMap()).toList(),
      'sectors': sectors.map((x) => x.toMap()).toList(),
      'typeOfPosition': typeOfPosition.map((x) => x.toMap()).toList(),
      'hiringUrgency': hiringUrgency,
      'seniorityLevel': seniorityLevel,
      'salaryExpectation': {
        'value1': salaryCurrent,
        'value2': salaryExpectation,
        'unit': normalizedCurrency,
        'rate': 1,
      },
      'legalCountries': legalCountries.map((x) => x.toMap()).toList(),
      'wantedCountries': wantedCountries.map((x) => x.toMap()).toList(),
      'workingMethod': workingMethod.map((x) => x.toMap()).toList(),
    };
  }

  factory Preferences.initial() {
    return const Preferences(
      companySize: [],
      companyType: [],
      sectors: [],
      typeOfPosition: [],
      hiringUrgency: "",
      seniorityLevel: "",
      salaryCurrent: "",
      salaryCurrentCurrency: "try",
      salaryExpectation: "",
      salaryExpectationCurrency: "try",
      legalCountries: [],
      wantedCountries: [],
      workingMethod: [],
    );
  }

  factory Preferences.fromMap(Map<String, dynamic> map) {
    var salaryInfo = map["salaryExpectation"];
    var salaryCurrent = salaryInfo["value1"].toString();
    var salaryExpectation = salaryInfo["value2"].toString();
    var salaryCurrentCurrency = _normalizeCurrency(salaryInfo["unit"] as String);
    var salaryExpectationCurrency = salaryCurrentCurrency;

    return Preferences(
      companySize:
          OptionSelection.fromList(map['companySize'] as List<dynamic>),
      companyType:
          OptionSelection.fromList(map['companyType'] as List<dynamic>),
      sectors: Item.fromList(map['sectors'] as List<dynamic>),
      typeOfPosition:
          OptionSelection.fromList(map['typeOfPosition'] as List<dynamic>),
      hiringUrgency: map['hiringUrgency'] as String,
      seniorityLevel: map['seniorityLevel'] as String,
      salaryCurrent: salaryCurrent,
      salaryCurrentCurrency: salaryCurrentCurrency as String,
      salaryExpectation: salaryExpectation,
      salaryExpectationCurrency: salaryExpectationCurrency as String,
      legalCountries: Item.fromList(map['legalCountries'] as List<dynamic>),
      wantedCountries: Item.fromList(map['wantedCountries'] as List<dynamic>),
      workingMethod:
          OptionSelection.fromList(map['workingMethod'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Preferences.fromJson(String source) =>
      Preferences.fromMap(json.decode(source) as Map<String, dynamic>);

  Preferences copyWith({
    List<OptionSelection>? companySize,
    List<OptionSelection>? companyType,
    List<Item>? sectors,
    List<OptionSelection>? typeOfPosition,
    String? hiringUrgency,
    String? seniorityLevel,
    String? salaryCurrent,
    String? salaryCurrentCurrency,
    String? salaryExpectation,
    String? salaryExpectationCurrency,
    List<Item>? legalCountries,
    List<Item>? wantedCountries,
    List<OptionSelection>? workingMethod,
  }) {
    return Preferences(
      companySize: companySize ?? this.companySize,
      companyType: companyType ?? this.companyType,
      sectors: sectors ?? this.sectors,
      typeOfPosition: typeOfPosition ?? this.typeOfPosition,
      hiringUrgency: hiringUrgency ?? this.hiringUrgency,
      seniorityLevel: seniorityLevel ?? this.seniorityLevel,
      salaryCurrent: salaryCurrent ?? this.salaryCurrent,
      salaryCurrentCurrency:
          salaryCurrentCurrency ?? this.salaryCurrentCurrency,
      salaryExpectation: salaryExpectation ?? this.salaryExpectation,
      salaryExpectationCurrency:
          salaryExpectationCurrency ?? this.salaryExpectationCurrency,
      legalCountries: legalCountries ?? this.legalCountries,
      wantedCountries: wantedCountries ?? this.wantedCountries,
      workingMethod: workingMethod ?? this.workingMethod,
    );
  }
}
