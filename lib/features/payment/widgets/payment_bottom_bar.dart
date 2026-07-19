// payment_bottom_bar.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/custom_button.dart';

class PaymentBottomBar extends StatelessWidget {
  const PaymentBottomBar({
    super.key,
    required this.total,
    required this.onPressed,
    this.isLoading = false,
  });

  final double total;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.border,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.grandTotal,
                    style:
                        AppTextStyles.bodyMedium,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceXS,
                  ),

                  Text(
                    "${AppConstants.currencySymbol}${total.toStringAsFixed(0)}",
                    style:
                        AppTextStyles.price,
                  ),
                ],
              ),
            ),

            const SizedBox(
              width: AppSizes.spaceL,
            ),

            Expanded(
              flex: 2,
              child: CustomButton(
                key: const ValueKey(
                  AppKeys.paymentButton,
                ),
                text: AppStrings.proceedPayment,
                isLoading: isLoading,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}