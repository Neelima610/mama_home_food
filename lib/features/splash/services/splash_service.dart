import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';

class SplashService {
  void start(BuildContext context) {
    Timer(
      AppDurations.splash,
      () {
        if (!context.mounted) return;

        Navigator.pushReplacementNamed(
          context,
          RouteNames.navigation,
        );
      },
    );
  }
}