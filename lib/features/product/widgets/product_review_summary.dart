// product_review_summary.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class ProductReviewSummary extends StatelessWidget {
  const ProductReviewSummary({
    super.key,
    required this.product,
    this.onViewAll,
  });

  final ProductModel product;

  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppNumbers.cardElevation,
      color: AppColors.card,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _buildRatingSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          AppStrings.customerReviews,
          style: AppTextStyles.heading3,
        ),

        const Spacer(),

        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: Text(
              AppStrings.viewAll,
            ),
          ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Row(
      children: [
        _buildRatingValue(),

        const SizedBox(
          width: AppSizes.spaceL,
        ),

        Expanded(
          child: _buildRatingStars(),
        ),
      ],
    );
  }

  Widget _buildRatingValue() {
    return Column(
      children: [
        Text(
          product.rating.toStringAsFixed(1),
          style: AppTextStyles.heading1.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(
          height: AppSizes.spaceXS,
        ),

        Text(
          '${product.totalReviews} '
          '${AppStrings.reviews}',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: List.generate(
        5,
        (index) {
          final starNumber = index + 1;

          if (product.rating >= starNumber) {
            return const Icon(
              Icons.star_rounded,
              color: AppColors.rating,
              size: 24,
            );
          }

          if (product.rating >=
              starNumber - 0.5) {
            return const Icon(
              Icons.star_half_rounded,
              color: AppColors.rating,
              size: 24,
            );
          }

          return const Icon(
            Icons.star_border_rounded,
            color: AppColors.rating,
            size: 24,
          );
        },
      ),
    );
  }
}