
// price_summary.dart
import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.grandTotal,
    this.title = AppStrings.priceDetails,
  });

  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double grandTotal;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        side: const BorderSide(
          color: AppColors.border,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.heading3,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            _PriceRow(
              title: AppStrings.subtotal,
              value: subtotal,
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _PriceRow(
              title: AppStrings.deliveryCharge,
              value: deliveryCharge,
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _PriceRow(
              title: AppStrings.discount,
              value: discount,
              isDiscount: true,
            ),

            const Divider(
              height: AppSizes.spaceXXL,
            ),

            _PriceRow(
              title: AppStrings.grandTotal,
              value: grandTotal,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.title,
    required this.value,
    this.isDiscount = false,
    this.isTotal = false,
  });

  final String title;
  final double value;
  final bool isDiscount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final style = isTotal
        ? AppTextStyles.heading3
        : AppTextStyles.bodyMedium;

    final color = isDiscount
        ? Colors.green
        : null;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: style,
          ),
        ),
        Text(
          isDiscount
              ? "-₹${value.toStringAsFixed(0)}"
              : "₹${value.toStringAsFixed(0)}",
          style: style.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}