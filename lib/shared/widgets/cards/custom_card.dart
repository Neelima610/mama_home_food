import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.width,
    this.height,
    this.radius,
    this.border,
    this.boxShadow,
    this.onTap,
  });

  final Widget child;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Color? color;

  final double? width;
  final double? height;

  final double? radius;

  final BoxBorder? border;

  final List<BoxShadow>? boxShadow;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      radius ?? AppSizes.radiusL,
    );

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            padding: padding ??
                const EdgeInsets.all(
                  AppSizes.screenPadding,
                ),
            decoration: BoxDecoration(
              color: color ?? AppColors.card,
              borderRadius: borderRadius,
              border: border,
              boxShadow: boxShadow ??
                  const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}