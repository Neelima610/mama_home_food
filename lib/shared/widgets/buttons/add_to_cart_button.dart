// add_to_cart_button.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onPressed,
    this.title = AppStrings.addToCart,
    this.icon =
        Icons.shopping_cart_checkout_rounded,
    this.isLoading = false,
    this.enabled = true,
  });

  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: (!enabled || isLoading)
            ? null
            : onPressed,
        icon: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                ),
              )
            : Icon(
                icon,
                size: 20,
              ),
        label: Text(
          title,
          style: AppTextStyles.button,
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor:
              AppColors.grey.withValues(
            alpha: 0.4,
          ),
          disabledForegroundColor:
              AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.radiusL,
            ),
          ),
        ),
      ),
    );
  }
}