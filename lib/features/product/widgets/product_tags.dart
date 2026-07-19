// product_tags.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class ProductTags extends StatelessWidget {
  const ProductTags({
    super.key,
    required this.product,
    this.maxTags,
  });

  final ProductModel product;

  final int? maxTags;

  @override
  Widget build(BuildContext context) {
    if (product.tags.isEmpty) {
      return const SizedBox.shrink();
    }

    final tags = maxTags == null
        ? product.tags
        : product.tags.take(maxTags!).toList();

    return Wrap(
      spacing: AppSizes.spaceS,
      runSpacing: AppSizes.spaceS,
      children: tags.map(_buildTag).toList(),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceM,
        vertical: AppSizes.spaceXS,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: 0.1,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: 0.3,
          ),
        ),
      ),
      child: Text(
        tag,
        style: AppTextStyles.labelSmall.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}