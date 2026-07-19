import 'package:flutter/foundation.dart';

@immutable
class SearchFilterModel {
  //--------------------------------------------------
  // Product Type
  //--------------------------------------------------

  final bool? isVeg;

  //--------------------------------------------------
  // Availability
  //--------------------------------------------------

  final bool onlyAvailable;

  //--------------------------------------------------
  // Product Flags
  //--------------------------------------------------

  final bool isBestSeller;

  final bool isRecommended;

  final bool isFeatured;

  //--------------------------------------------------
  // Discount
  //--------------------------------------------------

  final bool hasDiscount;

  //--------------------------------------------------
  // Price
  //--------------------------------------------------

  final double? minimumPrice;

  final double? maximumPrice;

  //--------------------------------------------------
  // Rating
  //--------------------------------------------------

  final double? minimumRating;

  //--------------------------------------------------
  // Constructor
  //--------------------------------------------------

  const SearchFilterModel({
    this.isVeg,
    this.onlyAvailable = true,
    this.isBestSeller = false,
    this.isRecommended = false,
    this.isFeatured = false,
    this.hasDiscount = false,
    this.minimumPrice,
    this.maximumPrice,
    this.minimumRating,
  });

  //--------------------------------------------------
  // Default Filter
  //--------------------------------------------------

  factory SearchFilterModel.initial() {
    return const SearchFilterModel();
  }

  //--------------------------------------------------
  // Has Active Filters
  //--------------------------------------------------

  bool get hasActiveFilters {
    return isVeg != null ||
        !onlyAvailable ||
        isBestSeller ||
        isRecommended ||
        isFeatured ||
        hasDiscount ||
        minimumPrice != null ||
        maximumPrice != null ||
        minimumRating != null;
  }

  //--------------------------------------------------
  // Copy With
  //--------------------------------------------------

  SearchFilterModel copyWith({
    bool? isVeg,
    bool? onlyAvailable,
    bool? isBestSeller,
    bool? isRecommended,
    bool? isFeatured,
    bool? hasDiscount,
    double? minimumPrice,
    double? maximumPrice,
    double? minimumRating,
  }) {
    return SearchFilterModel(
      isVeg: isVeg ?? this.isVeg,
      onlyAvailable:
          onlyAvailable ?? this.onlyAvailable,
      isBestSeller:
          isBestSeller ?? this.isBestSeller,
      isRecommended:
          isRecommended ?? this.isRecommended,
      isFeatured:
          isFeatured ?? this.isFeatured,
      hasDiscount:
          hasDiscount ?? this.hasDiscount,
      minimumPrice:
          minimumPrice ?? this.minimumPrice,
      maximumPrice:
          maximumPrice ?? this.maximumPrice,
      minimumRating:
          minimumRating ?? this.minimumRating,
    );
  }

  //--------------------------------------------------
  // Clear
  //--------------------------------------------------

  SearchFilterModel clear() {
    return const SearchFilterModel();
  }

  //--------------------------------------------------
  // Debug
  //--------------------------------------------------

  @override
  String toString() {
    return '''
SearchFilterModel(
  isVeg: $isVeg,
  onlyAvailable: $onlyAvailable,
  isBestSeller: $isBestSeller,
  isRecommended: $isRecommended,
  isFeatured: $isFeatured,
  hasDiscount: $hasDiscount,
  minimumPrice: $minimumPrice,
  maximumPrice: $maximumPrice,
  minimumRating: $minimumRating,
)
''';
  }
}