import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/badges/status_badge.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--------------------------------------------------
        // Product Name
        //--------------------------------------------------

        Text(
          product.name,
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.textDark,
          ),
        ),

        const SizedBox(
          height: AppSizes.spaceS,
        ),

        //--------------------------------------------------
        // Product Status Badges
        //--------------------------------------------------

        Wrap(
          spacing: AppSizes.spaceM,
          runSpacing: AppSizes.spaceS,
          children: [
            StatusBadge(
              text: product.isVeg
                  ? AppStrings.vegetarian
                  : AppStrings.nonVegetarian,
              backgroundColor: product.isVeg
                  ? Colors.green.shade50
                  : Colors.red.shade50,
              textColor: product.isVeg
                  ? Colors.green.shade700
                  : Colors.red.shade700,
              icon: Icons.circle,
            ),

            StatusBadge(
              text: product.isAvailable
                  ? AppStrings.available
                  : AppStrings.outOfStock,
              backgroundColor: product.isAvailable
                  ? AppColors.accent.withAlpha(30)
                  : Colors.red.withAlpha(30),
              textColor: product.isAvailable
                  ? AppColors.accent
                  : Colors.red,
              icon: product.isAvailable
                  ? Icons.check_circle
                  : Icons.cancel,
            ),

            if (product.isFeatured)
              StatusBadge(
                text: "Featured",
                backgroundColor: Colors.orange.shade100,
                textColor: Colors.orange.shade800,
                icon: Icons.local_fire_department,
              ),
          ],
        ),
      ],
    );
  }
}