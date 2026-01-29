// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  final String country;
  final String state;
  final String city;
  final String address;

  Location({
    required this.country,
    required this.state,
    required this.city,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'state': state,
      'city': city,
      'address': address,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  static initial() {
    return Location(
      country: '',
      state: '',
      city: '',
      address: '',
    );
  }

  @override
  String toString() {
    return '$address $city / $country';
  }
}
