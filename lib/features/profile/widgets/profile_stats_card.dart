import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.color,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cardColor =
        color ?? AppColors.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        AppSizes.radiusM,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceS,
          horizontal: AppSizes.spaceXS,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: cardColor,
                size: AppSizes.iconM,
              ),

            if (icon != null)
              const SizedBox(
                height: AppSizes.spaceXS,
              ),

            Text(
              value,
              style: AppTextStyles.heading3.copyWith(
                color: cardColor,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceXS,
            ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}