
// app_durations.dart
import 'package:flutter/material.dart';

@immutable
class AppDurations {
  const AppDurations._();

  

  //--------------------------------------------------
  // Common
  //--------------------------------------------------

  static const Duration instant =
      Duration.zero;

  static const Duration extraShort =
      Duration(milliseconds: 100);

  static const Duration short =
      Duration(milliseconds: 300);

  static const Duration medium =
      Duration(milliseconds: 600);

  static const Duration long =
      Duration(seconds: 1);

  static const Duration extraLong =
      Duration(seconds: 2);

  //--------------------------------------------------
  // Splash
  //--------------------------------------------------

  static const Duration splash =
      Duration(seconds: 5);

  //--------------------------------------------------
  // SnackBar
  //--------------------------------------------------

  static const Duration snackbar =
      Duration(seconds: 3);

  //--------------------------------------------------
  // Dialog
  //--------------------------------------------------

  static const Duration dialog =
      Duration(milliseconds: 300);

  //--------------------------------------------------
  // Animation
  //--------------------------------------------------

  static const Duration animation =
      Duration(milliseconds: 250);

  static const Duration pageTransition =
      Duration(milliseconds: 300);

  //--------------------------------------------------
  // Repository / Network
  //--------------------------------------------------

  static const Duration repositoryDelay =
      Duration(milliseconds: 500);

  static const Duration networkDelay =
      Duration(seconds: 2);

  //--------------------------------------------------
  // Order Tracking
  //--------------------------------------------------

  static const Duration trackingRefresh =
      Duration(seconds: 15);


  static const shortAnimation = Duration(milliseconds: 200);

  static const mediumAnimation = Duration(milliseconds: 400);

  static const longAnimation = Duration(milliseconds: 700);

  static const bannerAutoPlay = Duration(seconds: 4);

  static const Duration animationDuration = Duration(milliseconds: 300);
}
