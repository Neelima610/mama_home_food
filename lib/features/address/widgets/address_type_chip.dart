import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/address/address_model.dart';


class AddressTypeChip extends StatelessWidget {
  const AddressTypeChip({
    super.key,
    required this.type,
    this.onTap,
    this.isSelected = false,
  });

  final AddressType type;
  final VoidCallback? onTap;
  final bool isSelected;


  String get label {
    switch (type) {
      case AddressType.home:
        return AppStrings.home;

      case AddressType.work:
        return AppStrings.work;

      case AddressType.other:
        return AppStrings.other;
    }
  }


  IconData get icon {
    switch (type) {
      case AddressType.home:
        return Icons.home_outlined;

      case AddressType.work:
        return Icons.work_outline;

      case AddressType.other:
        return Icons.location_on_outlined;
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(
        AppSizes.radiusM,
      ),

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spaceM,
          vertical: AppSizes.spaceXS,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.background,

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
          mainAxisSize: MainAxisSize.min,

          children: [

            Icon(
              icon,

              size: AppSizes.iconS,

              color: isSelected
                  ? AppColors.white
                  : AppColors.primary,
            ),


            const SizedBox(
              width: AppSizes.spaceXS,
            ),


            Text(
              label,

              style:
                  AppTextStyles.bodySmall.copyWith(
                color: isSelected
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}