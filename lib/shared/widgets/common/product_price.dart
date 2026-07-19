// product_price.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.product,
    this.showDiscount = true,
    this.showSavings = false,
  });

  final ProductModel product;

  final bool showDiscount;
  final bool showSavings;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.end,
      children: [
        _buildCurrentPrice(),

        if (product.hasDiscount) ...[
          const SizedBox(
            width: AppSizes.spaceS,
          ),

          _buildOldPrice(),
        ],

        if (showDiscount &&
            product.hasDiscount) ...[
          const SizedBox(
            width: AppSizes.spaceS,
          ),

          _buildDiscount(),
        ],

        if (showSavings &&
            product.hasDiscount) ...[
          const Spacer(),

          _buildSavings(),
        ],
      ],
    );
  }

  Widget _buildCurrentPrice() {
    return Text(
      '${AppConstants.currencySymbol}'
      '${product.price.toStringAsFixed(0)}',
      style: AppTextStyles.price,
    );
  }

  Widget _buildOldPrice() {
    return Text(
      '${AppConstants.currencySymbol}'
      '${product.oldPrice!.toStringAsFixed(0)}',
      style: AppTextStyles.oldPrice,
    );
  }

  Widget _buildDiscount() {
    return Text(
      '${product.discountPercentage}% OFF',
      style: AppTextStyles.labelSmall.copyWith(
        color: AppColors.offer,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSavings() {
    return Text(
      'Save '
      '${AppConstants.currencySymbol}'
      '${product.savings.toStringAsFixed(0)}',
      style: AppTextStyles.labelSmall.copyWith(
        color: AppColors.success,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}