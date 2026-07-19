// category_product_grid.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/cards/product_card.dart';

class CategoryProductGrid extends StatelessWidget {
  const CategoryProductGrid({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,

      // Allow parent SingleChildScrollView to scroll
      physics:
          const NeverScrollableScrollPhysics(),

      itemCount: products.length,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.spaceM,
        mainAxisSpacing: AppSizes.spaceM,
        childAspectRatio: 0.48,
      ),

      itemBuilder: (
        context,
        index,
      ) {
        return ProductCard(
          product: products[index],
        );
      },
    );
  }
}