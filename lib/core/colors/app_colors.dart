//app_colors.dart

import 'package:flutter/material.dart';

/// Centralized color palette for the Mama Home Food application.
///
/// All colors used throughout the app should come from this class.
/// This makes it easy to maintain a consistent design and update
/// branding in the future.
class AppColors {
  AppColors._();

  // =========================
  // Neutral Colors
  // =========================

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Color grey = Color(0xFF9E9E9E);

  static const Color transparent = Colors.transparent;

  // =========================
  // Primary Brand Colors
  // =========================

  /// Rich Maroon
  static const Color primary = Color(0xFF7B2D26);

  /// Warm Brown
  static const Color secondary = Color(0xFF8B5E3C);

  /// Fresh Green
  static const Color accent = Color(0xFF4CAF50);

  /// Soft Cream Background
  static const Color background = Color(0xFFFFF8E7);

  // =========================
  // Surface Colors
  // =========================

  static const Color surface = white;

  static const Color card = Color(0xFFFFFCF5);

  // =========================
  // Text Colors
  // =========================

  static const Color textPrimary = Color(0xFF2E2E2E);

  static const Color textSecondary = Color(0xFF6B6B6B);

  static const Color textLight = white;

  // =========================
  // Status Colors
  // =========================

  static const Color success = Color(0xFF2E7D32);

  static const Color warning = Color(0xFFFF9800);

  static const Color error = Color(0xFFD32F2F);

  static const Color info = Color(0xFF1976D2);

  // =========================
  // Borders & Divider
  // =========================

  static const Color border = Color(0xFFE0E0E0);

  static const Color divider = Color(0xFFEEEEEE);

  // =========================
  // Miscellaneous
  // =========================

  static const Color shadow = Color(0x33000000);

}