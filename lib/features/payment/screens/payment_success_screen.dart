// payment_success_screen.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';

class PaymentSuccessScreen
    extends StatelessWidget {
  const PaymentSuccessScreen({
    super.key,
    required this.transactionId,
  });

  final String transactionId;

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
                  color: AppColors.success
                      .withValues(
                    alpha: 0.12,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.success,
                  size: 70,
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              Text(
                AppStrings.paymentCompletedSuccessfully,
                style: AppTextStyles.heading2,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              Text(
                AppStrings.orderPlaced,
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  AppSizes.spaceL,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusL,
                  ),
                  border: Border.all(
                    color:
                        AppColors.border,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.transactionId,
                      style: AppTextStyles
                          .bodyMedium,
                    ),

                    const SizedBox(
                      height:
                          AppSizes.spaceS,
                    ),

                    SelectableText(
                      transactionId,
                      style: AppTextStyles
                          .titleMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceXXL,
              ),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
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