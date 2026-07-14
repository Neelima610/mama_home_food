import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import 'app_loader.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.icon,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;

  final Color? backgroundColor;
  final Color? foregroundColor;

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;

  final IconData? icon;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppSizes.buttonWidth,
      height: height ?? AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? AppColors.textLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppSizes.radiusLarge,
            ),
          ),
        ),
        child: isLoading
            ? const AppLoader(
              size: 22,
              strokeWidth: 2)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon),
                    const SizedBox(width: AppSizes.spaceS),
                  ],
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: foregroundColor ?? AppColors.textLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
