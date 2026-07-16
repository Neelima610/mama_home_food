import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({
    super.key,
    required this.rating,
    this.showText = true,
  });

  final double rating;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(
              AppSizes.radiusMedium,
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.white,
                size: 16,
              ),

              const SizedBox(width: 4),

              Text(
                rating.toStringAsFixed(1),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        if (showText) ...[
          const SizedBox(width: AppSizes.spaceM),

          Text(
            "${rating.toStringAsFixed(1)} Rating",
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}