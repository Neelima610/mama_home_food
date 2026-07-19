import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';
import '../../../models/category/category_model.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    super.key,
    required this.category,
    required this.totalProducts,
  });

  final CategoryModel category;
  final int totalProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(
        AppSizes.spaceL,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            category.name,
            style: AppTextStyles.heading1,
          ),

          const SizedBox(height: 8),

          Text(
            "$totalProducts Items Available",
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}