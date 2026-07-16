
// app_text_styles.dart
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  //==================================================
  // Display
  //==================================================

  static const displayLarge = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const displayMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const displaySmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  //==================================================
  // Headings
  //==================================================

  static const heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  //==================================================
  // Titles
  //==================================================

  static const titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  //==================================================
  // Body
  //==================================================

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textMedium,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textMedium,
  );

  //==================================================
  // Labels
  //==================================================

  static const labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textMedium,
  );

  static const labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
  );

  //==================================================
  // Buttons
  //==================================================

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  //==================================================
  // Price
  //==================================================

  static const price = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const oldPrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    decoration: TextDecoration.lineThrough,
  );

  //==================================================
  // Caption
  //==================================================

  static const caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
  );

  static const TextStyle rating = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle appBarTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: AppColors.textDark,
);

static const TextStyle sectionTitle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

static const TextStyle chip = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
}
