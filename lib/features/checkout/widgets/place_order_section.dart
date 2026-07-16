import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class PlaceOrderSection extends StatelessWidget {
  const PlaceOrderSection({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.grandTotal,
    required this.onPlaceOrder,
  });

  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double grandTotal;
  final VoidCallback onPlaceOrder;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Column(
          children: [
            _PriceRow(
              title: AppStrings.subtotal,
              value: subtotal,
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            _PriceRow(
              title: AppStrings.delivery,
              value: deliveryCharge,
              isFree: deliveryCharge == 0,
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
              height: AppSizes.spaceXL,
            ),

            _PriceRow(
              title: AppStrings.grandTotal,
              value: grandTotal,
              isTotal: true,
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            PrimaryButton(
              text: AppStrings.placeOrder,
              icon: Icons.shopping_bag_outlined,
              onPressed: onPlaceOrder,
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
    this.isTotal = false,
    this.isDiscount = false,
    this.isFree = false,
  });

  final String title;
  final double value;
  final bool isTotal;
  final bool isDiscount;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = isTotal
        ? AppTextStyles.heading3
        : AppTextStyles.bodyLarge;

    String amount;

    if (isFree) {
      amount = AppStrings.free;
    } else if (isDiscount) {
      amount = "-₹${value.toStringAsFixed(0)}";
    } else {
      amount = "₹${value.toStringAsFixed(0)}";
    }

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: style,
          ),
        ),
        Text(
          amount,
          style: style.copyWith(
            color: isDiscount
                ? AppColors.success
                : null,
          ),
        ),
      ],
    );
  }
}