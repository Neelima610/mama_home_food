import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/notification_provider.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.notifications,
            ),
            actions: [
              if (provider.notifications.isNotEmpty)
                TextButton(
                  onPressed: provider.markAllAsRead,
                  child: const Text(
                    AppStrings.markAllRead,
                  ),
                ),
            ],
          ),
          body: provider.notifications.isEmpty
              ? Center(
                  child: Text(
                    AppStrings.noNotifications,
                    style: AppTextStyles.bodyMedium,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(
                    AppSizes.screenPadding,
                  ),
                  itemCount:
                      provider.notifications.length,
                  itemBuilder: (context, index) {
                    final notification =
                        provider.notifications[index];

                    return NotificationTile(
                      notification: notification,
                      onTap: () {
                        provider.markAsRead(index);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}