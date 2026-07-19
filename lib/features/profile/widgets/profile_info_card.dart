import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.onTap,
    this.trailing,
  });

  final String title;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.spaceM,
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.08,
                  ),
                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusM,
                  ),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                ),
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
                          AppTextStyles.labelMedium,
                    ),

                    const SizedBox(
                      height: AppSizes.spaceXS,
                    ),

                    Text(
                      value,
                      style:
                          AppTextStyles.bodyLarge,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              trailing ??
                  const Icon(
                    Icons.chevron_right_rounded,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}