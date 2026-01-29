// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OptionSelection extends Equatable {
  final String optionKey;
  final String selection;

  @override
  List<Object?> get props => [
        optionKey,
        selection,
      ];

  const OptionSelection({required this.optionKey, required this.selection});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'key': optionKey, 'value': selection};
  }

  factory OptionSelection.initial() {
    return const OptionSelection(optionKey: "", selection: "");
  }

  factory OptionSelection.fromMap(Map<String, dynamic> map) {
    return OptionSelection(
      optionKey: map['key'] as String,
      selection: map['value'] as String,
    );
  }

  static List<OptionSelection> fromList(List<dynamic> list) {
    return list
        .map((e) => OptionSelection.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory OptionSelection.fromJson(String source) =>
      OptionSelection.fromMap(json.decode(source) as Map<String, dynamic>);

  OptionSelection copyWith({
    String? optionKey,
    String? selection,
  }) {
    return OptionSelection(
      optionKey: optionKey ?? this.optionKey,
      selection: selection ?? this.selection,
    );
  }
}
