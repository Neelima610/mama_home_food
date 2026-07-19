import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
    required this.onLogout,
  });

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      title: Text(
        AppStrings.logout,
        style: AppTextStyles.heading4,
      ),
      content: Text(
        AppStrings.logoutConfirmation,
        style: AppTextStyles.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.cancel,
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            onLogout();
          },
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.error,
          ),
          child: Text(
            AppStrings.logout,
          ),
        ),
      ],
    );
  }

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onLogout,
  }) {
    return showDialog(
      context: context,
      builder: (_) => LogoutDialog(
        onLogout: onLogout,
      ),
    );
  }
}