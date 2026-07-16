import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.size = 28,
    this.strokeWidth = 2.5,
    this.color = AppColors.textLight,
  });

  final double size;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}