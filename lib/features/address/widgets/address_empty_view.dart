import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';


class AddressEmptyView extends StatelessWidget {
  const AddressEmptyView({
    super.key,
    required this.onAddAddress,
  });


  final VoidCallback onAddAddress;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [

            Container(
              height: 80,
              width: 80,

              decoration: BoxDecoration(
                color: AppColors.background,

                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.location_on_outlined,

                size: 40,

                color: AppColors.primary,
              ),
            ),


            const SizedBox(
              height: AppSizes.spaceL,
            ),


            Text(
              AppStrings.noAddressFound,

              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),


            const SizedBox(
              height: AppSizes.spaceS,
            ),


            Text(
              AppStrings.addDeliveryAddress,

              style: AppTextStyles.bodyMedium,

              textAlign: TextAlign.center,
            ),


            const SizedBox(
              height: AppSizes.spaceL,
            ),


            ElevatedButton.icon(
              onPressed: onAddAddress,

              icon: const Icon(
                Icons.add,
              ),

              label: const Text(
                AppStrings.addAddress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}