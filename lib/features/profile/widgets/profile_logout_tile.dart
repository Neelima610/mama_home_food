
// profile_logout_tile.dart
import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class ProfileLogoutTile extends StatelessWidget {
  const ProfileLogoutTile({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        side: const BorderSide(
          color: AppColors.border,
        ),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.logout_rounded,
          color: Colors.red,
        ),
        title: Text(
          AppStrings.logout,
          style: AppTextStyles.titleMedium.copyWith(
            color: Colors.red,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: AppSizes.iconS,
          color: AppColors.textHint,
        ),
        onTap: onTap,
      ),
    );
  }
}

