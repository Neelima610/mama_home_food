import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/notification_provider.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notification,
    this.onTap,
  });

  final AppNotification notification;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceM,
      ),
      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          backgroundColor: notification.isRead
              ? AppColors.grey.withValues(alpha: 0.15)
              : AppColors.primary.withValues(alpha: 0.15),
          child: Icon(
            notification.isRead
                ? Icons.notifications_none
                : Icons.notifications_active,
            color: notification.isRead
                ? AppColors.grey
                : AppColors.primary,
          ),
        ),

        title: Text(
          notification.title,
          style: AppTextStyles.titleMedium,
        ),

        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSizes.spaceXS,
            ),

            Text(
              notification.message,
              style: AppTextStyles.bodySmall,
            ),

            const SizedBox(
              height: AppSizes.spaceXS,
            ),

            Text(
              "${notification.date.day}/${notification.date.month}/${notification.date.year}",
              style: AppTextStyles.caption,
            ),
          ],
        ),

        trailing: notification.isRead
            ? null
            : Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
      ),
    );
  }
}