import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../models/product/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: Container(
        width: double.infinity,
        height: 280,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(
            AppSizes.radiusLarge,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppSizes.radiusLarge,
          ),
          child: product.image.isNotEmpty
              ? Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                )
              : Container(
                  color: AppColors.background,
                  child: const Center(
                    child: Icon(
                      Icons.restaurant,
                      size: 80,
                      color: AppColors.primary,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}