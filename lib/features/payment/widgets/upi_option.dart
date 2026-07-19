import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';

class UpiOption extends StatelessWidget {
  const UpiOption({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppNumbers.cardElevation,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),
        child: TextField(
          key: const ValueKey(
            AppKeys.upiField,
          ),
          controller: controller,
          decoration: InputDecoration(
            labelText:
                AppStrings.upiId,
            hintText:
                AppStrings.upiHint,
            prefixIcon: const Icon(
              Icons.account_balance,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}