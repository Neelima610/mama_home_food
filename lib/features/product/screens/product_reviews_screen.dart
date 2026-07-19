// product_reviews_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

import '../widgets/product_app_bar.dart';
import '../widgets/product_review_summary.dart';
import '../widgets/product_review_tile.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: ProductAppBar(
        title: AppStrings.reviews,
        showFavorite: false,
        showShare: false,
      ),

      body: ListView(
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),
        children: [
          ProductReviewSummary(
            product: product,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          Text(
            AppStrings.customerReviews,
            style: AppTextStyles.heading2,
          ),

          const SizedBox(
            height: AppSizes.spaceM,
          ),

          _buildReviews(),

          const SizedBox(
            height: AppSizes.spaceXL,
          ),
        ],
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () {
          // Navigate to WriteReviewScreen
          // after route is added.
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        icon: const Icon(
          Icons.rate_review_outlined,
        ),
        label: Text(
          AppStrings.writeReview,
        ),
      ),
    );
  }

  Widget _buildReviews() {
    // Temporary empty state.
    // Replace this with actual review data
    // from repository/provider later.

    if (product.totalReviews == 0) {
      return _buildEmptyReviews();
    }

    return Column(
      children: [
        // Add ProductReviewTile widgets here
        // when ReviewModel is created.
      ],
    );
  }

  Widget _buildEmptyReviews() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(
        AppSizes.spaceXL,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.rate_review_outlined,
            size: 48,
            color: AppColors.grey,
          ),

          const SizedBox(
            height: AppSizes.spaceM,
          ),

          Text(
            AppStrings.noReviewsYet,
            style: AppTextStyles.titleMedium,
          ),

          const SizedBox(
            height: AppSizes.spaceS,
          ),

          Text(
            AppStrings.beTheFirstToReview,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}