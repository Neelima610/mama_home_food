import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--------------------------------------------------
        // Title
        //--------------------------------------------------

        Text(
        AppStrings.description,
          style: AppTextStyles.heading3,
        ),

        const SizedBox(
          height: AppSizes.spaceM,
        ),

        //--------------------------------------------------
        // Description
        //--------------------------------------------------

        Text(
          product.description,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}