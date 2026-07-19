

// order_empty_view.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class OrderEmptyView extends StatelessWidget {
  const OrderEmptyView({
    super.key,
    this.onStartShopping,
  });

  final VoidCallback? onStartShopping;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: AppSizes.emptyIconSize,
              color: AppColors.grey,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            Text(
              AppStrings.noOrders,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge,
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            Text(
              AppStrings.noOrdersDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.grey,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            SizedBox(
              width: AppSizes.buttonWidth,
              child: FilledButton(
                key: const ValueKey(
                  AppKeys.startShoppingButton,
                ),
                onPressed: onStartShopping,
                child: Text(
                  AppStrings.startShopping,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}