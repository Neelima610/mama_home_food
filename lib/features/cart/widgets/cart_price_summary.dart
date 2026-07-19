
// cart_price_summary.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class CartPriceSummary extends StatelessWidget {
  const CartPriceSummary({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.total,
    required this.onCheckout,
  });

  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double total;

  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppSizes.screenPadding,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PriceRow(
              title: "Subtotal",
              value: subtotal,
            ),

            const SizedBox(height: 10),

            _PriceRow(
              title: "Delivery",
              value: deliveryCharge,
              isFree: deliveryCharge == 0,
            ),

            const SizedBox(height: 10),

            _PriceRow(
              title: "Discount",
              value: discount,
              isDiscount: true,
            ),

            const Divider(height: 30),

            _PriceRow(
              title: "Total",
              value: total,
              isTotal: true,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

           PrimaryButton(
  text: AppStrings.proceedToCheckout,
  onPressed: onCheckout,
)
      
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
    this.isFree = false,
    this.isDiscount = false,
    this.isTotal = false,
  });

  final String title;
  final double value;
  final bool isFree;
  final bool isDiscount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: isTotal
              ? AppTextStyles.heading3
              : AppTextStyles.bodyMedium,
        ),

        const Spacer(),

        Text(
          isFree
              ? "FREE"
              : isDiscount
                  ? "- ₹${value.toStringAsFixed(0)}"
                  : "₹${value.toStringAsFixed(0)}",
          style: (isTotal
                  ? AppTextStyles.heading3
                  : AppTextStyles.bodyMedium)
              .copyWith(
            color: isDiscount
                ? AppColors.success
                : null,
          ),
        ),
      ],
    );
  }
}