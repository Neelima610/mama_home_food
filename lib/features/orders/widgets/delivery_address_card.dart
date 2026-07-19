
// delivery_address_card.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/address/address_model.dart';
import '../../../shared/widgets/cards/custom_card.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
    required this.address,
  });

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Header
          //--------------------------------------------------

          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primary,
                size: AppSizes.iconM,
              ),

              const SizedBox(
                width: AppSizes.spaceS,
              ),

              Text(
                AppStrings.deliveryAddress,
                style:
                    AppTextStyles.titleMedium,
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          //--------------------------------------------------
          // Name
          //--------------------------------------------------

          Text(
            address.name,
            style:
                AppTextStyles.titleSmall,
          ),

          const SizedBox(
            height: AppSizes.spaceXS,
          ),

          //--------------------------------------------------
          // Phone
          //--------------------------------------------------

          Text(
            address.phoneNumber,
            style:
                AppTextStyles.bodyMedium,
          ),

          const SizedBox(
            height: AppSizes.spaceS,
          ),

          //--------------------------------------------------
          // Address
          //--------------------------------------------------

          Text(
            address.fullAddress,
            style:
                AppTextStyles.bodyMedium,
          ),

          //--------------------------------------------------
          // Landmark
          //--------------------------------------------------

          if ((address.landmark ?? '')
              .isNotEmpty) ...[
            const SizedBox(
              height:
                  AppSizes.spaceS,
            ),
            Text(
              "${AppStrings.landmark}: ${address.landmark}",
              style: AppTextStyles
                  .bodySmall,
            ),
          ],

          const SizedBox(
            height: AppSizes.spaceS,
          ),

          //--------------------------------------------------
          // Address Type
          //--------------------------------------------------

          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal:
                  AppSizes.spaceM,
              vertical:
                  AppSizes.spaceXS,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary
                  .withValues(
                alpha: 0.10,
              ),
              borderRadius:
                  BorderRadius.circular(
                AppSizes.radiusXL,
              ),
            ),
            child: Text(
              switch (address.addressType) {
                AddressType.home =>
                  AppStrings.home,
                AddressType.work =>
                  AppStrings.work,
                AddressType.other =>
                  AppStrings.other,
              },
              style: AppTextStyles
                  .labelSmall
                  .copyWith(
                color:
                    AppColors.primary,
              ),
            ),
          ),

          //--------------------------------------------------
          // Default Badge
          //--------------------------------------------------

          if (address.isDefault) ...[
            const SizedBox(
              height:
                  AppSizes.spaceS,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal:
                    AppSizes.spaceM,
                vertical:
                    AppSizes.spaceXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.accent
                    .withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.radiusXL,
                ),
              ),
              child: Text(
                AppStrings.defaultAddress,
                style: AppTextStyles
                    .labelSmall
                    .copyWith(
                  color:
                      AppColors.accent,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}