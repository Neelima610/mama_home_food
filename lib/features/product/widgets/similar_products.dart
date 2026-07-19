// similar_products.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/cards/product_card.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({
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

    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.similarProducts,
          style: AppTextStyles.heading2,
        ),

        const SizedBox(
          height: AppSizes.spaceL,
        ),

        SizedBox(
          height: 290,
          child: ListView.separated(
            scrollDirection:
                Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, _) =>
                const SizedBox(
              width: AppSizes.spaceM,
            ),
            itemBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 180,
                child: ProductCard(
                  product: products[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}