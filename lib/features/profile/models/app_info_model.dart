class AppInfoModel {
  const AppInfoModel({
    required this.appName,
    required this.version,
    required this.buildNumber,
    required this.description,
    required this.companyName,
    required this.releaseDate,
    this.website,
    this.email,
    this.phoneNumber,
    this.logo,
  });

  //--------------------------------------------------
  // App Information
  //--------------------------------------------------

  final String appName;

  final String version;

  final String buildNumber;

  final String description;

  final String companyName;

  final String releaseDate;

  //--------------------------------------------------
  // Contact
  //--------------------------------------------------

  final String? website;

  final String? email;

  final String? phoneNumber;

  final String? logo;

  //--------------------------------------------------
  // Factory
  //--------------------------------------------------

  factory AppInfoModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return AppInfoModel(
      appName: map['appName'] ?? '',
      version: map['version'] ?? '',
      buildNumber: map['buildNumber'] ?? '',
      description: map['description'] ?? '',
      companyName: map['companyName'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      website: map['website'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      logo: map['logo'],
    );
  }

  //--------------------------------------------------
  // To Map
  //--------------------------------------------------

  Map<String, dynamic> toMap() {
    return {
      'appName': appName,
      'version': version,
      'buildNumber': buildNumber,
      'description': description,
      'companyName': companyName,
      'releaseDate': releaseDate,
      'website': website,
      'email': email,
      'phoneNumber': phoneNumber,
      'logo': logo,
    };
  }

  //--------------------------------------------------
  // Copy With
  //--------------------------------------------------

  AppInfoModel copyWith({
    String? appName,
    String? version,
    String? buildNumber,
    String? description,
    String? companyName,
    String? releaseDate,
    String? website,
    String? email,
    String? phoneNumber,
    String? logo,
  }) {
    return AppInfoModel(
      appName: appName ?? this.appName,
      version: version ?? this.version,
      buildNumber:
          buildNumber ?? this.buildNumber,
      description:
          description ?? this.description,
      companyName:
          companyName ?? this.companyName,
      releaseDate:
          releaseDate ?? this.releaseDate,
      website: website ?? this.website,
      email: email ?? this.email,
      phoneNumber:
          phoneNumber ?? this.phoneNumber,
      logo: logo ?? this.logo,
    );
  }
}