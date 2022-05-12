import 'dart:convert';

class Address {
  final int id;
  final String city;
  final String state;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String zipCode;
  final String street;
  final String number;
  final String district;
  Address({
    required this.id,
    required this.city,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.zipCode,
    required this.street,
    required this.number,
    required this.district,
  });

  Address copyWith({
    int? id,
    String? city,
    String? state,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? zipCode,
    String? street,
    String? number,
    String? district,
  }) {
    return Address(
      id: id ?? this.id,
      city: city ?? this.city,
      state: state ?? this.state,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      zipCode: zipCode ?? this.zipCode,
      street: street ?? this.street,
      number: number ?? this.number,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'city': city,
      'state': state,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'zip_code': zipCode,
      'street': street,
      'number': number,
      'district': district,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id']?.toInt() ?? 0,
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      zipCode: map['zip_code'] ?? '',
      street: map['street'] ?? '',
      number: map['number'] ?? '',
      district: map['district'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(id: $id, city: $city, state: $state, created_at: $createdAt, updated_at: $updatedAt, zip_code: $zipCode, street: $street, number: $number, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.id == id &&
        other.city == city &&
        other.state == state &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.zipCode == zipCode &&
        other.street == street &&
        other.number == number &&
        other.district == district;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        city.hashCode ^
        state.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        zipCode.hashCode ^
        street.hashCode ^
        number.hashCode ^
        district.hashCode;
  }
}
