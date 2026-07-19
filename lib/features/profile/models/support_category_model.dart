class SupportCategoryModel {
  const SupportCategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });


  final String id;

  final String title;

  final String description;

  final String icon;



  factory SupportCategoryModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return SupportCategoryModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'icon': icon,
    };
  }



  SupportCategoryModel copyWith({
    String? id,
    String? title,
    String? description,
    String? icon,
  }) {
    return SupportCategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description:
          description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}