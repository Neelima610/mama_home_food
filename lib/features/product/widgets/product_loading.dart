// product_loading.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';


class ProductLoading extends StatelessWidget {
  const ProductLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}