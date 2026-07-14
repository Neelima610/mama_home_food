import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.appLogo,
      width: width ?? AppSizes.logoMedium,
      height: height ?? width ?? AppSizes.logoMedium,
      fit: fit,
      filterQuality: FilterQuality.high,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.restaurant,
          size: width ?? AppSizes.logoMedium,
          color: Theme.of(context).colorScheme.primary,
        );
      },
    );
  }
}