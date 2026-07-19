import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.product,
    this.showReviewCount = true,
    this.showRatingValue = true,
    this.starSize = 18,
    this.spacing = AppSizes.spaceXS,
  });

  final ProductModel product;

  final bool showReviewCount;
  final bool showRatingValue;

  final double starSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStars(),

        if (showRatingValue) ...[
          SizedBox(
            width: spacing,
          ),
          _buildRatingValue(),
        ],

        if (showReviewCount) ...[
          SizedBox(
            width: spacing,
          ),
          _buildReviewCount(),
        ],
      ],
    );
  }

  Widget _buildStars() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          final starNumber = index + 1;

          if (product.rating >= starNumber) {
            return _buildStar(
              Icons.star_rounded,
            );
          }

          if (product.rating >= starNumber - 0.5) {
            return _buildStar(
              Icons.star_half_rounded,
            );
          }

          return _buildStar(
            Icons.star_border_rounded,
          );
        },
      ),
    );
  }

  Widget _buildStar(IconData icon) {
    return Icon(
      icon,
      size: starSize,
      color: AppColors.rating,
    );
  }

  Widget _buildRatingValue() {
    return Text(
      product.rating.toStringAsFixed(1),
      style: AppTextStyles.labelMedium.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildReviewCount() {
    return Text(
      '(${product.totalReviews})',
      style: AppTextStyles.caption,
    );
  }
}