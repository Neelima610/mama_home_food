// payment_failed_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Container(
                width:
                    AppNumbers.dialogIconSize +
                        30,
                height:
                    AppNumbers.dialogIconSize +
                        30,
                decoration: BoxDecoration(
                  color: AppColors.error
                      .withValues(
                    alpha: 0.12,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.cancel_rounded,
                  color: AppColors.error,
                  size: 70,
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              Text(
                AppStrings.paymentFailed,
                style:
                    AppTextStyles.heading2,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              Text(
                message ??
                    AppStrings.paymentFailedMessage,
                style:
                    AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceXXL,
              ),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.retry,
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
        ),
      ),
    );
  }
}