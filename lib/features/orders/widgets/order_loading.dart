

// order_loading.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class OrderLoading extends StatelessWidget {
  const OrderLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: AppSizes.loaderSize,
        height: AppSizes.loaderSize,
        child: CircularProgressIndicator(
          strokeWidth: AppSizes.loaderStrokeWidth,
        ),
      ),
    );
  }
}