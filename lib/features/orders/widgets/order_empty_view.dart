import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class OrderEmptyView extends StatelessWidget {
  const OrderEmptyView({
    super.key,
    required this.onStartShopping,
  });

  final VoidCallback onStartShopping;

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
            //--------------------------------------------------
            // Icon
            //--------------------------------------------------

            const Icon(
              Icons.receipt_long_rounded,
              size: 96,
              color: AppColors.primary,
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Text(
              AppStrings.noOrdersYet,
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            //--------------------------------------------------
            // Subtitle
            //--------------------------------------------------

            Text(
              AppStrings.noOrdersSubtitle,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: AppSizes.spaceXXL,
            ),

            //--------------------------------------------------
            // Button
            //--------------------------------------------------

            PrimaryButton(
              text: AppStrings.startShopping,
              icon: Icons.shopping_bag_rounded,
              onPressed: onStartShopping,
            ),
          ],
        ),
      ),
    );
  }
}