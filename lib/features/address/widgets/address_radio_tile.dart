import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/address/address_model.dart';


class AddressRadioTile extends StatelessWidget {
  const AddressRadioTile({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  final AddressModel address;
  final bool isSelected;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(
        AppSizes.radiusM,
      ),

      child: Container(
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSizes.radiusM,
          ),

          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.border,
          ),
        ),

        child: Row(
          children: [

            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,

              color: isSelected
                  ? AppColors.primary
                  : AppColors.grey,
            ),


            const SizedBox(
              width: AppSizes.spaceM,
            ),


            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    address.name,

                    style:
                        AppTextStyles.titleMedium,
                  ),


                  const SizedBox(
                    height: AppSizes.spaceXS,
                  ),


                  Text(
                    address.fullAddress,

                    style:
                        AppTextStyles.bodyMedium,
                  ),


                  Text(
                    '${AppStrings.countryCode} ${address.phoneNumber}',

                    style:
                        AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}