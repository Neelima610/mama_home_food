class ContactInfoModel {
  const ContactInfoModel({
    required this.email,
    required this.phoneNumber,
    this.website,
    this.facebook,
    this.instagram,
    this.twitter,
    this.youtube,
  });

  final String email;
  final String phoneNumber;
  final String? website;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? youtube;

  factory ContactInfoModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ContactInfoModel(
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      website: map['website'],
      facebook: map['facebook'],
      instagram: map['instagram'],
      twitter: map['twitter'],
      youtube: map['youtube'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'website': website,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'youtube': youtube,
    };
  }

  ContactInfoModel copyWith({
    String? email,
    String? phoneNumber,
    String? website,
    String? facebook,
    String? instagram,
    String? twitter,
    String? youtube,
  }) {
    return ContactInfoModel(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      youtube: youtube ?? this.youtube,
    );
  }
}