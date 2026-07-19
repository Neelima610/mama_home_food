
// product_model.dart
import 'package:flutter/foundation.dart';

/// Production-ready Product Model
///
/// Compatible with:
/// - Firebase
/// - REST APIs
/// - Local Database
/// - Dummy Data
/// - Provider
/// - Future Add-ons & Customizations
@immutable
class ProductModel {
  //--------------------------------------------------
  // Identity
  //--------------------------------------------------

  final String id;

  final String categoryId;

  //--------------------------------------------------
  // Basic Information
  //--------------------------------------------------

  final String name;

  final String subtitle;

  final String description;

  //--------------------------------------------------
  // Images
  //--------------------------------------------------

  /// Main thumbnail
  final String image;

  /// Gallery images
  final List<String> images;

  //--------------------------------------------------
  // Pricing
  //--------------------------------------------------

  final double price;

  final double? oldPrice;

  /// Percentage discount
  final int discountPercentage;

  //--------------------------------------------------
  // Ratings
  //--------------------------------------------------

  final double rating;

  final int totalReviews;

  //--------------------------------------------------
  // Product Type
  //--------------------------------------------------

  final bool isVeg;

  final bool isAvailable;

  final bool isFeatured;

  final bool isBestSeller;

  final bool isRecommended;

  final bool isFavorite;

  //--------------------------------------------------
  // Stock
  //--------------------------------------------------

  final int stock;

  //--------------------------------------------------
  // Delivery
  //--------------------------------------------------

  /// Example:
  /// 25 mins
  final String preparationTime;

  //--------------------------------------------------
  // Quantity
  //--------------------------------------------------

  final String unit;

  final double weight;

  //--------------------------------------------------
  // Food Details
  //--------------------------------------------------

  final int calories;

  final String spiceLevel;

  final List<String> ingredients;

  final List<String> tags;

  //--------------------------------------------------
  // Nutrition
  //--------------------------------------------------

  final double protein;

  final double carbs;

  final double fat;

  final double fiber;

  //--------------------------------------------------
  // Constructor
  //--------------------------------------------------

  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.subtitle,
    required this.description,
    required this.image,
    this.images = const [],
    required this.price,
    this.oldPrice,
    this.discountPercentage = 0,
    this.rating = 0,
    this.totalReviews = 0,
    this.isVeg = true,
    this.isAvailable = true,
    this.isFeatured = false,
    this.isBestSeller = false,
    this.isRecommended = false,
    this.isFavorite = false,
    this.stock = 0,
    this.preparationTime = '',
    this.unit = '',
    this.weight = 0,
    this.calories = 0,
    this.spiceLevel = '',
    this.ingredients = const [],
    this.tags = const [],
    this.protein = 0,
    this.carbs = 0,
    this.fat = 0,
    this.fiber = 0,
  });

  //--------------------------------------------------
  // Calculated Values
  //--------------------------------------------------

  bool get hasDiscount =>
      oldPrice != null &&
      oldPrice! > price;

  double get savings =>
      hasDiscount
          ? oldPrice! - price
          : 0;

  String get formattedWeight =>
      "$weight g";

  //--------------------------------------------------
  // Copy With
  //--------------------------------------------------

  ProductModel copyWith({
    String? id,
    String? categoryId,
    String? name,
    String? subtitle,
    String? description,
    String? image,
    List<String>? images,
    double? price,
    double? oldPrice,
    int? discountPercentage,
    double? rating,
    int? totalReviews,
    bool? isVeg,
    bool? isAvailable,
    bool? isFeatured,
    bool? isBestSeller,
    bool? isRecommended,
    bool? isFavorite,
    int? stock,
    String? preparationTime,
    String? unit,
    double? weight,
    int? calories,
    String? spiceLevel,
    List<String>? ingredients,
    List<String>? tags,
    double? protein,
    double? carbs,
    double? fat,
    double? fiber,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      image: image ?? this.image,
      images: images ?? this.images,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPercentage:
          discountPercentage ??
              this.discountPercentage,
      rating: rating ?? this.rating,
      totalReviews:
          totalReviews ??
              this.totalReviews,
      isVeg: isVeg ?? this.isVeg,
      isAvailable:
          isAvailable ??
              this.isAvailable,
      isFeatured:
          isFeatured ??
              this.isFeatured,
      isBestSeller:
          isBestSeller ??
              this.isBestSeller,
      isRecommended:
          isRecommended ??
              this.isRecommended,
      isFavorite:
          isFavorite ??
              this.isFavorite,
      stock: stock ?? this.stock,
      preparationTime:
          preparationTime ??
              this.preparationTime,
      unit: unit ?? this.unit,
      weight: weight ?? this.weight,
      calories:
          calories ??
              this.calories,
      spiceLevel:
          spiceLevel ??
              this.spiceLevel,
      ingredients:
          ingredients ??
              this.ingredients,
      tags: tags ?? this.tags,
      protein:
          protein ??
              this.protein,
      carbs:
          carbs ??
              this.carbs,
      fat:
          fat ??
              this.fat,
      fiber:
          fiber ??
              this.fiber,
    );
  }
  //--------------------------------------------------
  // Map
  //--------------------------------------------------

  factory ProductModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ProductModel(
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      name: map['name'] ?? '',
      subtitle: map['subtitle'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',

      images: List<String>.from(
        map['images'] ?? const [],
      ),

      price: (map['price'] ?? 0).toDouble(),

      oldPrice: map['oldPrice'] != null
          ? (map['oldPrice']).toDouble()
          : null,

      discountPercentage:
          map['discountPercentage'] ?? 0,

      rating: (map['rating'] ?? 0).toDouble(),

      totalReviews:
          map['totalReviews'] ?? 0,

      isVeg: map['isVeg'] ?? true,

      isAvailable:
          map['isAvailable'] ?? true,

      isFeatured:
          map['isFeatured'] ?? false,

      isBestSeller:
          map['isBestSeller'] ?? false,

      isRecommended:
          map['isRecommended'] ?? false,

      isFavorite:
          map['isFavorite'] ?? false,

      stock: map['stock'] ?? 0,

      preparationTime:
          map['preparationTime'] ?? '',

      unit: map['unit'] ?? '',

      weight:
          (map['weight'] ?? 0).toDouble(),

      calories:
          map['calories'] ?? 0,

      spiceLevel:
          map['spiceLevel'] ?? '',

      ingredients: List<String>.from(
        map['ingredients'] ?? const [],
      ),

      tags: List<String>.from(
        map['tags'] ?? const [],
      ),

      protein:
          (map['protein'] ?? 0).toDouble(),

      carbs:
          (map['carbs'] ?? 0).toDouble(),

      fat:
          (map['fat'] ?? 0).toDouble(),

      fiber:
          (map['fiber'] ?? 0).toDouble(),
    );
  }

  //--------------------------------------------------
  // To Map
  //--------------------------------------------------

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'subtitle': subtitle,
      'description': description,
      'image': image,
      'images': images,
      'price': price,
      'oldPrice': oldPrice,
      'discountPercentage':
          discountPercentage,
      'rating': rating,
      'totalReviews': totalReviews,
      'isVeg': isVeg,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'isBestSeller': isBestSeller,
      'isRecommended': isRecommended,
      'isFavorite': isFavorite,
      'stock': stock,
      'preparationTime':
          preparationTime,
      'unit': unit,
      'weight': weight,
      'calories': calories,
      'spiceLevel': spiceLevel,
      'ingredients': ingredients,
      'tags': tags,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'fiber': fiber,
    };
  }

  //--------------------------------------------------
  // JSON
  //--------------------------------------------------

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  //--------------------------------------------------
  // Equality
  //--------------------------------------------------

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ProductModel &&
        other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  //--------------------------------------------------
  // Debug
  //--------------------------------------------------

  @override
  String toString() {
    return '''
ProductModel(
  id: $id,
  name: $name,
  categoryId: $categoryId,
  price: $price,
  rating: $rating,
  reviews: $totalReviews
)
''';
  }
}
