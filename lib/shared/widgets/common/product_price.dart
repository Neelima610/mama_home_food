import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        product.oldPrice != null &&
        product.oldPrice! > product.price;

    final int discountPercentage = hasDiscount
        ? (((product.oldPrice! - product.price) /
                    product.oldPrice!) *
                100)
            .round()
        : 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Current Price
        Text(
          "₹${product.price.toStringAsFixed(0)}",
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(width: AppSizes.spaceM),

        // Old Price
        if (hasDiscount)
          Text(
            "₹${product.oldPrice!.toStringAsFixed(0)}",
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),

        const Spacer(),

        // Discount Badge
        if (hasDiscount)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(
                AppSizes.radiusLarge,
              ),
            ),
            child: Text(
              "$discountPercentage% OFF",
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}