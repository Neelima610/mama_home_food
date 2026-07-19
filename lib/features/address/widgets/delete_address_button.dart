import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';


class DeleteAddressButton extends StatelessWidget {
  const DeleteAddressButton({
    super.key,
    required this.onPressed,
  });


  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,

      icon: const Icon(
        Icons.delete_outline,
        color: AppColors.error,
      ),

      label: Text(
        AppStrings.delete,

        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.error,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}