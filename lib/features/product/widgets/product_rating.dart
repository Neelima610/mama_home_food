import 'package:flutter/material.dart';

import '../../../models/product/product_model.dart';
import '../../../shared/widgets/badges/rating_badge.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return RatingBadge(
      rating: product.rating,
    );
  }
}