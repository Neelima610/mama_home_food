// payment_summary_card.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class PaymentSummaryCard extends StatelessWidget {
  const PaymentSummaryCard({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.total,
  });

  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const ValueKey(
        AppKeys.paymentSummary,
      ),
      elevation: AppNumbers.cardElevation,
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),
        child: Column(
          children: [
            _SummaryRow(
              title: AppStrings.subtotal,
              value:
                  "${AppConstants.currencySymbol}${subtotal.toStringAsFixed(0)}",
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _SummaryRow(
              title:
                  AppStrings.deliveryCharge,
              value:
                  "${AppConstants.currencySymbol}${deliveryCharge.toStringAsFixed(0)}",
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _SummaryRow(
              title: AppStrings.discount,
              value:
                  "-${AppConstants.currencySymbol}${discount.toStringAsFixed(0)}",
              valueColor:
                  AppColors.success,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.spaceL,
              ),
              child: Divider(),
            ),

            _SummaryRow(
              title: AppStrings.grandTotal,
              value:
                  "${AppConstants.currencySymbol}${total.toStringAsFixed(0)}",
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
    this.valueColor,
  });

  final String title;
  final String value;
  final bool isTotal;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final style = isTotal
        ? AppTextStyles.titleLarge
        : AppTextStyles.bodyLarge;

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),
        Text(
          value,
          style: style.copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }
}