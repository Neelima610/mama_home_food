// similar_products_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/cards/product_card.dart';

import '../widgets/product_app_bar.dart';

class SimilarProductsScreen
    extends StatelessWidget {
  const SimilarProductsScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final products =
        ProductRepository.getProductsByCategory(
      product.categoryId,
    )
            .where(
              (item) => item.id != product.id,
            )
            .toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: ProductAppBar(
        title: AppStrings.similarProducts,
        showFavorite: false,
        showShare: false,
      ),

      body: products.isEmpty
          ? _buildEmptyState()
          : GridView.builder(
              padding: const EdgeInsets.all(
                AppSizes.spaceM,
              ),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing:
                    AppSizes.spaceM,
                mainAxisSpacing:
                    AppSizes.spaceM,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (
                context,
                index,
              ) {
                return ProductCard(
                  product: products[index],
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.fastfood_outlined,
              size: 64,
              color: AppColors.grey,
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            Text(
              AppStrings.noSimilarProducts,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading3,
            ),
          ],
        ),
      ),
    );
  }
}