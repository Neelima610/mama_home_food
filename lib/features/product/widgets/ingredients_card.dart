// ingredients_card.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    if (product.ingredients.isEmpty) {
      return const SizedBox.shrink();
    }

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
            _buildTitle(),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _buildIngredients(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const Icon(
          Icons.restaurant_menu_rounded,
          color: AppColors.primary,
        ),
        const SizedBox(
          width: AppSizes.spaceS,
        ),
        Text(
          AppStrings.ingredients,
          style: AppTextStyles.heading3,
        ),
      ],
    );
  }

  Widget _buildIngredients() {
    return Wrap(
      spacing: AppSizes.spaceS,
      runSpacing: AppSizes.spaceS,
      children: product.ingredients.map(
        (ingredient) {
          return Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: AppSizes.spaceM,
              vertical: AppSizes.spaceS,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius:
                  BorderRadius.circular(
                AppSizes.radiusM,
              ),
              border: Border.all(
                color: AppColors.divider,
              ),
            ),
            child: Text(
              ingredient,
              style: AppTextStyles.bodySmall,
            ),
          );
        },
      ).toList(),
    );
  }
}