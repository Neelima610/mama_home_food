// nutrition_card.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class NutritionCard extends StatelessWidget {
  const NutritionCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

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
            _buildTitle(),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _buildNutritionGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const Icon(
          Icons.local_dining_outlined,
          color: AppColors.primary,
        ),
        const SizedBox(
          width: AppSizes.spaceS,
        ),
        Text(
          AppStrings.nutrition,
          style: AppTextStyles.heading3,
        ),
      ],
    );
  }

  Widget _buildNutritionGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      crossAxisSpacing: AppSizes.spaceM,
      mainAxisSpacing: AppSizes.spaceM,
      children: [
        _buildNutritionItem(
          label: AppStrings.calories,
          value: '${product.calories} kcal',
          icon: Icons.local_fire_department_outlined,
        ),
        _buildNutritionItem(
          label: AppStrings.protein,
          value: '${product.protein} g',
          icon: Icons.fitness_center_outlined,
        ),
        _buildNutritionItem(
          label: AppStrings.carbs,
          value: '${product.carbs} g',
          icon: Icons.grain,
        ),
        _buildNutritionItem(
          label: AppStrings.fat,
          value: '${product.fat} g',
          icon: Icons.opacity_outlined,
        ),
        _buildNutritionItem(
          label: AppStrings.fiber,
          value: '${product.fiber} g',
          icon: Icons.eco_outlined,
        ),
      ],
    );
  }

  Widget _buildNutritionItem({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(
        AppSizes.spaceS,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusM,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(
            width: AppSizes.spaceS,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis,
                  style: AppTextStyles.caption,
                ),
                Text(
                  value,
                  style:
                      AppTextStyles.labelMedium
                          .copyWith(
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}