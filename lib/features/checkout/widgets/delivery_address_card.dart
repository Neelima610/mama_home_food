

// delivery_address_card.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/secondary_button.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.onEdit,
  });

  final String name;
  final String phone;
  final String address;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                ),

                const SizedBox(
                  width: AppSizes.spaceS,
                ),

                Text(
                  AppStrings.deliveryAddress,
                  style: AppTextStyles.heading3,
                ),
              ],
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Customer Name
            //--------------------------------------------------

            Text(
              name,
              style: AppTextStyles.heading3,
            ),

            const SizedBox(
              height: AppSizes.spaceXS,
            ),

            //--------------------------------------------------
            // Phone
            //--------------------------------------------------

            Text(
              phone,
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            //--------------------------------------------------
            // Address
            //--------------------------------------------------

            Text(
              address,
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Edit Button
            //--------------------------------------------------

            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Flexible(
      child: SecondaryButton(
        text: AppStrings.editAddress,
        icon: Icons.edit_location_alt_outlined,
        onPressed: onEdit,
      ),
    ),
  ],
),
          ],
        ),
      ),
    );
  }
}