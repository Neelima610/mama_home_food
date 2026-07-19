import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class PaymentStatusChip extends StatelessWidget {
  const PaymentStatusChip({
    super.key,
    required this.status,
  });

  final String status;

  Color get statusColor {
    switch (status.toLowerCase()) {
      case AppStrings.paid:
        return AppColors.success;

      case AppStrings.pending:
        return AppColors.warning;

      case AppStrings.failed:
        return AppColors.error;

      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: statusColor.withValues(
        alpha: 0.12,
      ),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceXS,
      ),
      visualDensity: VisualDensity.compact,
      label: Text(
        status,
        style: AppTextStyles.bodySmall.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}