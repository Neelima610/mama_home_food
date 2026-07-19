// product_review_tile.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class ProductReviewTile extends StatelessWidget {
  const ProductReviewTile({
    super.key,
    required this.userName,
    required this.rating,
    required this.review,
    this.date,
  });

  final String userName;
  final double rating;
  final String review;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.spaceM,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _buildHeader(),

          const SizedBox(
            height: AppSizes.spaceS,
          ),

          _buildRating(),

          const SizedBox(
            height: AppSizes.spaceS,
          ),

          _buildReview(),

          if (date != null &&
              date!.isNotEmpty) ...[
            const SizedBox(
              height: AppSizes.spaceS,
            ),
            _buildDate(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildAvatar(),

        const SizedBox(
          width: AppSizes.spaceS,
        ),

        Expanded(
          child: Text(
            userName,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor:
          AppColors.primary.withValues(
        alpha: 0.1,
      ),
      child: Text(
        userName.isNotEmpty
            ? userName[0].toUpperCase()
            : '?',
        style: AppTextStyles.titleMedium.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) {
            final starNumber = index + 1;

            if (rating >= starNumber) {
              return const Icon(
                Icons.star_rounded,
                size: 18,
                color: AppColors.rating,
              );
            }

            if (rating >= starNumber - 0.5) {
              return const Icon(
                Icons.star_half_rounded,
                size: 18,
                color: AppColors.rating,
              );
            }

            return const Icon(
              Icons.star_border_rounded,
              size: 18,
              color: AppColors.rating,
            );
          },
        ),

        const SizedBox(
          width: AppSizes.spaceS,
        ),

        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildReview() {
    return Text(
      review,
      style: AppTextStyles.bodyMedium,
    );
  }

  Widget _buildDate() {
    return Text(
      date!,
      style: AppTextStyles.caption.copyWith(
        color: AppColors.textMedium,
      ),
    );
  }
}