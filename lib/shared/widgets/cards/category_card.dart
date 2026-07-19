
// category_card.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/category/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  final CategoryModel category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        AppSizes.radiusL,
      ),
      child: Column(
  mainAxisSize: MainAxisSize.min,

  children: [

    Container(
      height: 60,
      width: 60,

      decoration: BoxDecoration(
        color: AppColors.card,

        borderRadius:
            BorderRadius.circular(
          AppSizes.radiusL,
        ),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),

        child: category.image.isNotEmpty

            ? Image.asset(
                category.image,
                fit: BoxFit.contain,
              )

            : Icon(
                category.icon,
                size: 30,
                color: AppColors.primary,
              ),
      ),
    ),


    const SizedBox(
      height: AppSizes.spaceXS,
    ),


    Text(
      category.name,

      textAlign:
          TextAlign.center,

      maxLines: 2,

      overflow:
          TextOverflow.ellipsis,

      style:
          AppTextStyles.bodySmall
              .copyWith(
        fontWeight:
            FontWeight.w600,
      ),
    ),
  ],
),
    );
  }
}