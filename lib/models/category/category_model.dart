
// category_model.dart
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final IconData icon;

  /// Number of products in this category
  final int totalProducts;

  /// Whether this category is visible
  final bool isActive;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.icon,
    this.totalProducts = 0,
    this.isActive = true,
  });
}