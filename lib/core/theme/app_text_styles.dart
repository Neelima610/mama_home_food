
// app_text_styles.dart
import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../constants/app_sizes.dart';

class AppTextStyles {
  AppTextStyles._();

  //==================================================
  // Display
  //==================================================

  static const displayLarge = TextStyle(
    fontSize: AppSizes.fontDisplay,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const displayMedium = TextStyle(
    fontSize: AppSizes.fontXXXL,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const displaySmall = TextStyle(
    fontSize: AppSizes.fontXXLDisplay,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //==================================================
  // Headings
  //==================================================

  static const heading1 = TextStyle(
    fontSize: AppSizes.fontXXL,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const heading2 = TextStyle(
    fontSize: AppSizes.fontXL,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const heading3 = TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const heading4 = TextStyle(
    fontSize: AppSizes.fontM,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  //==================================================
  // Titles
  //==================================================

  static const titleLarge = TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const titleMedium = TextStyle(
    fontSize: AppSizes.fontM,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const titleSmall = TextStyle(
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  //==================================================
  // Body
  //==================================================

  static const bodyLarge = TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static const bodyMedium = TextStyle(
    fontSize: AppSizes.fontM,
    fontWeight: FontWeight.normal,
    color: AppColors.textMedium,
  );

  static const bodySmall = TextStyle(
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.normal,
    color: AppColors.textMedium,
  );

  //==================================================
  // Labels
  //==================================================

  static const labelLarge = TextStyle(
    fontSize: AppSizes.fontM,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const labelMedium = TextStyle(
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.w500,
    color: AppColors.textMedium,
  );

  static const labelSmall = TextStyle(
    fontSize: AppSizes.fontXS,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
  );

  //==================================================
  // Buttons
  //==================================================

  static const button = TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  //==================================================
  // Price
  //==================================================

  static const price = TextStyle(
    fontSize: AppSizes.fontXXL,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const oldPrice = TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    decoration: TextDecoration.lineThrough,
  );

  //==================================================
  // Caption
  //==================================================

  static const caption = TextStyle(
    fontSize: AppSizes.fontXS,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
  );

  //==================================================
  // Rating
  //==================================================

  static const rating = TextStyle(
    fontFamily: 'Poppins',
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  //==================================================
  // App Bar
  //==================================================

  static const appBarTitle = TextStyle(
    fontSize: AppSizes.fontXL,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  //==================================================
  // Section
  //==================================================

  static const sectionTitle = TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //==================================================
  // Chip
  //==================================================

  static const chip = TextStyle(
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );
}