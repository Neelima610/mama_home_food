// payment_success_dialog.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';

class PaymentSuccessDialog {
  PaymentSuccessDialog._();

  static Future<void> show(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.radiusL,
            ),
          ),
          contentPadding: const EdgeInsets.all(
            AppSizes.spaceXL,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppNumbers.dialogIconSize,
                height: AppNumbers.dialogIconSize,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(
                    alpha: 0.12,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.success,
                  size: 42,
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              Text(
                AppStrings.paymentCompletedSuccessfully,
                style: AppTextStyles.heading3,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              Text(
                AppStrings.orderPlaced,
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.orders,
                      (route) => false,
                    );
                  },
                  child: Text(
                    AppStrings.viewOrders,
                  ),
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.navigation,
                      (route) => false,
                    );
                  },
                  child: Text(
                    AppStrings.continueShopping,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}