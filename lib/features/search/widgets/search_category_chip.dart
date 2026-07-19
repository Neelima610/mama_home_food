import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

import '../../../models/category/category_model.dart';

class SearchCategoryChip extends StatelessWidget {
  const SearchCategoryChip({
    super.key,
    required this.category,
    required this.onTap,
    this.isSelected = false,
  });

  final CategoryModel category;

  final VoidCallback onTap;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),

        padding:
            const EdgeInsets.symmetric(
          horizontal: AppSizes.spaceM,
          vertical: AppSizes.spaceS,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.surface,

          borderRadius:
              BorderRadius.circular(
            AppSizes.radiusM,
          ),

          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.border,
          ),
        ),

        child: Row(
          mainAxisSize:
              MainAxisSize.min,

          children: [
            if (category.icon != Icons
                .circle_outlined) ...[
              Icon(
                category.icon,

                size: 18,

                color: isSelected
                    ? AppColors.white
                    : AppColors.primary,
              ),

              const SizedBox(
                width: AppSizes.spaceXS,
              ),
            ],

            Text(
              category.name,

              style:
                  AppTextStyles.bodySmall.copyWith(
                color: isSelected
                    ? AppColors.white
                    : AppColors.textPrimary,

                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}