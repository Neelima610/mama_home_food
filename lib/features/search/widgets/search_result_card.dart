import 'package:flutter/material.dart';

import '../../../models/product/product_model.dart';
import '../../../shared/widgets/cards/product_card.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ProductCard(
      product: product,
    );
  }
}