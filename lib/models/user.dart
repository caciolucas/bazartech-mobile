import 'dart:convert';

import 'package:bazartech/models/address.dart';

class User {
  final int? id;
  final Address? address;
  final List<String> permissionsDisplay;
  final String password;
  final DateTime? lastLogin;
  final bool isSuperuser;
  final String name;
  final String username;
  final String phoneNumber;
  final String email;
  final String birthdate;
  final String gender;
  final String profilePicture;
  final bool isStaff;
  final bool isActive;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;
  User({
    this.id,
    this.address,
    required this.permissionsDisplay,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.name,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.birthdate,
    required this.gender,
    required this.profilePicture,
    required this.isStaff,
    required this.isActive,
    required this.groups,
    required this.userPermissions,
  });

  User copyWith({
    int? id,
    Address? address,
    List<String>? permissionsDisplay,
    String? password,
    DateTime? lastLogin,
    bool? isSuperuser,
    String? name,
    String? username,
    String? phoneNumber,
    String? email,
    String? birthdate,
    String? gender,
    String? profilePicture,
    bool? isStaff,
    bool? isActive,
    List<dynamic>? groups,
    List<dynamic>? userPermissions,
  }) {
    return User(
      id: id ?? this.id,
      address: address ?? this.address,
      permissionsDisplay: permissionsDisplay ?? this.permissionsDisplay,
      password: password ?? this.password,
      lastLogin: lastLogin ?? this.lastLogin,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      name: name ?? this.name,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      profilePicture: profilePicture ?? this.profilePicture,
      isStaff: isStaff ?? this.isStaff,
      isActive: isActive ?? this.isActive,
      groups: groups ?? this.groups,
      userPermissions: userPermissions ?? this.userPermissions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address?.toMap(),
      'permissions_display': permissionsDisplay,
      'password': password,
      'last_login': lastLogin,
      'is_superuser': isSuperuser,
      'name': name,
      'username': username,
      'phone_number': phoneNumber,
      'email': email,
      'birthdate': birthdate,
      'gender': gender,
      'profile_picture': profilePicture,
      'is_staff': isStaff,
      'is_active': isActive,
      'groups': groups,
      'user_permissions': userPermissions,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      address: map['address'] != null ? Address.fromMap(map['address']) : null,
      permissionsDisplay: List<String>.from(map['permissions_display']),
      password: map['password'] ?? '',
      lastLogin: map['last_login'] != null
          ? DateTime.tryParse(map['last_login'])
          : null,
      isSuperuser: map['is_superuser'] ?? false,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      birthdate: map['birthdate'] ?? '',
      gender: map['gender'] ?? '',
      profilePicture: map['profile_picture'] ?? '',
      isStaff: map['is_staff'] ?? false,
      isActive: map['is_active'] ?? false,
      groups: List<dynamic>.from(map['groups']),
      userPermissions: List<dynamic>.from(map['user_permissions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, address: $address, permissions_display: $permissionsDisplay, password: $password, last_login: $lastLogin, is_superuser: $isSuperuser, name: $name, username: $username, phone_number: $phoneNumber, email: $email, birthdate: $birthdate, gender: $gender, profile_picture: $profilePicture, is_staff: $isStaff, is_active: $isActive, groups: $groups, user_permissions: $userPermissions)';
  }

  @override
  int get hashCode {
    return id.hashCode ^
        address.hashCode ^
        permissionsDisplay.hashCode ^
        password.hashCode ^
        lastLogin.hashCode ^
        isSuperuser.hashCode ^
        name.hashCode ^
        username.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        birthdate.hashCode ^
        gender.hashCode ^
        profilePicture.hashCode ^
        isStaff.hashCode ^
        isActive.hashCode ^
        groups.hashCode ^
        userPermissions.hashCode;
  }
}
