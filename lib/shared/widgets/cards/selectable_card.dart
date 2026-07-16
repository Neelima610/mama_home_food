import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SelectableCard extends StatelessWidget {
  const SelectableCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(AppSizes.radiusLarge),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(
                  alpha: 0.08,
                )
              : AppColors.card,
          borderRadius:
              BorderRadius.circular(
            AppSizes.radiusLarge,
          ),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primary
                  : Colors.grey,
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
                    title,
                    style:
                        AppTextStyles.bodyLarge,
                  ),

                  if (subtitle != null) ...[
                    const SizedBox(height: 4),

                    Text(
                      subtitle!,
                      style: AppTextStyles
                          .bodySmall,
                    ),
                  ],
                ],
              ),
            ),

            trailing ??
                Icon(
                  isSelected
                      ? Icons.check_circle
                      : Icons
                          .radio_button_unchecked,
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey,
                ),
          ],
        ),
      ),
    );
  }
}