import 'package:flutter/material.dart';

import '../../../models/product/product_model.dart';
import '../../home/widgets/product_card.dart';

class CategoryProductGrid extends StatelessWidget {
  const CategoryProductGrid({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 60,
        ),
        child: Center(
          child: Text(
            "No products found.",
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.56,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onTap: () {
            debugPrint(
              "Selected: ${products[index].name}",
            );
          },
          onAddToCart: () {
            debugPrint(
              "Added: ${products[index].name}",
            );
          },
        );
      },
    );
  }
}