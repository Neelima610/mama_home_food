
// user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.profileImage,
    this.dateOfBirth,
    this.gender,
    this.referralCode,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  /// Unique Firebase Auth UID
  final String id;

  /// Personal Information
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  /// Optional Profile Information
  final String? profileImage;
  final DateTime? dateOfBirth;
  final String? gender;

  /// Referral
  final String? referralCode;

  /// Account Status
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isActive;

  /// Audit Fields
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Computed Properties
  String get fullName => '$firstName $lastName'.trim();

  String get initials {
    final first =
        firstName.isNotEmpty ? firstName[0] : '';

    final last =
        lastName.isNotEmpty ? lastName[0] : '';

    return (first + last).toUpperCase();
  }

  bool get hasProfileImage =>
      profileImage?.isNotEmpty ?? false;

  factory UserModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profileImage: map['profileImage'],
      dateOfBirth: map['dateOfBirth'] is Timestamp
          ? (map['dateOfBirth'] as Timestamp).toDate()
          : null,
      gender: map['gender'],
      referralCode: map['referralCode'],
      isEmailVerified:
          map['isEmailVerified'] ?? false,
      isPhoneVerified:
          map['isPhoneVerified'] ?? false,
      isActive: map['isActive'] ?? true,
      createdAt: map['createdAt'] is Timestamp
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] is Timestamp
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'referralCode': referralCode,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImage,
    DateTime? dateOfBirth,
    String? gender,
    String? referralCode,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      referralCode: referralCode ?? this.referralCode,
      isEmailVerified:
          isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified:
          isPhoneVerified ?? this.isPhoneVerified,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}