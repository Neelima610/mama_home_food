// product_empty.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class ProductEmpty extends StatelessWidget {
  const ProductEmpty({
    super.key,
    this.title = AppStrings.productNotFound,
    this.message = AppStrings.productNotAvailable,
    this.onRetry,
  });

  final String title;
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading2,
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),

            if (onRetry != null) ...[
              const SizedBox(
                height: AppSizes.spaceL,
              ),

              ElevatedButton(
                onPressed: onRetry,
                child: Text(
                  AppStrings.retry,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: 0.1,
        ),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.fastfood_outlined,
        size: 40,
        color: AppColors.primary,
      ),
    );
  }
}