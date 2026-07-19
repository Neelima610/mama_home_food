// product_details_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../models/product/product_model.dart';

import '../widgets/ingredients_card.dart';
import '../widgets/nutrition_card.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/product_description.dart';
import '../widgets/product_info.dart';
import '../widgets/product_tags.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: ProductAppBar(
        title: AppStrings.productDetails,
        showFavorite: true,
        showShare: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            ProductInfo(
              product: product,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            if (product.tags.isNotEmpty) ...[
              ProductTags(
                product: product,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),
            ],

            ProductDescription(
              product: product,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            IngredientsCard(
              product: product,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            NutritionCard(
              product: product,
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),
          ],
        ),
      ),
    );
  }
}