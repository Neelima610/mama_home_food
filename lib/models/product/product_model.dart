class ProductModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double? oldPrice;
  final double rating;
  final bool isVeg;
  final bool isAvailable;
  final bool isFavorite;
  final String categoryId;
  final bool isFeatured;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.isVeg,
    required this.isAvailable,
    required this.isFavorite,
    required this.categoryId,
    this.isFeatured = false,
  });

  /// CopyWith
  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    double? price,
    double? oldPrice,
    double? rating,
    bool? isVeg,
    bool? isAvailable,
    bool? isFavorite,
    String? categoryId,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      rating: rating ?? this.rating,
      isVeg: isVeg ?? this.isVeg,
      isAvailable: isAvailable ?? this.isAvailable,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  /// Map → Object
  factory ProductModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      oldPrice: map['oldPrice'] != null
          ? (map['oldPrice']).toDouble()
          : null,
      rating: (map['rating'] ?? 0).toDouble(),
      isVeg: map['isVeg'] ?? true,
      isAvailable: map['isAvailable'] ?? true,
      isFavorite: map['isFavorite'] ?? false,
      categoryId: map['categoryId'] ?? '',
    );
  }

  /// Object → Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'oldPrice': oldPrice,
      'rating': rating,
      'isVeg': isVeg,
      'isAvailable': isAvailable,
      'isFavorite': isFavorite,
      'categoryId': categoryId,
    };
  }

  /// JSON → Object
  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel.fromMap(json);
  }

  /// Object → JSON
  Map<String, dynamic> toJson() {
    return toMap();
  }
}