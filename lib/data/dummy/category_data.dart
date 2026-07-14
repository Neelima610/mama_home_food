import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../models/category_model.dart';

class CategoryData {
  CategoryData._();

  static final List<CategoryModel> categories = [
    CategoryModel(
      id: "lunch_boxes",
      name: AppStrings.lunchBoxes,
      image: AppAssets.lunchBox,
      icon: Icons.lunch_dining,
      totalProducts: 4,
    ),

    CategoryModel(
      id: "pickles",
      name: AppStrings.pickles,
      image: AppAssets.pickles,
      icon: Icons.food_bank,
      totalProducts: 8,
    ),

    CategoryModel(
      id: "podi",
      name: AppStrings.podi,
      image: AppAssets.podi,
      icon: Icons.ramen_dining,
      totalProducts: 2,
    ),

    CategoryModel(
      id: "snacks",
      name: AppStrings.snacks,
      image: AppAssets.snacks,
      icon: Icons.cookie,
      totalProducts: 4,
    ),

    CategoryModel(
      id: "sweets",
      name: AppStrings.sweets,
      image: AppAssets.sweets,
      icon: Icons.cake,
      totalProducts: 4,
    ),

    CategoryModel(
      id: "subscription",
      name: AppStrings.monthlySubscription,
      image: AppAssets.subscription,
      icon: Icons.calendar_month,
      totalProducts: 1,
    ),

    CategoryModel(
      id: "catering",
      name: AppStrings.cateringServices,
      image: AppAssets.catering,
      icon: Icons.celebration,
      totalProducts: 3,
    ),
  ];
}