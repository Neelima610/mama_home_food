import 'package:flutter/material.dart';
import 'package:mama_home_food/core/constants/constants.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationProvider();

  //--------------------------------------------------
  // Notifications
  //--------------------------------------------------

  final List<AppNotification> _notifications = [
    AppNotification(
      title: AppStrings.welcome,
      message:  AppStrings.welcomeNotificationMessage,
      date: DateTime.now(),
      isRead: false,
     
    ),
    AppNotification(
      title: AppStrings.orderDeliveredTitle,
      message: AppStrings.orderDeliveredMessage,
      date: DateTime.now(),
      isRead:false,
    ),
  ];

  List<AppNotification> get notifications =>
      List.unmodifiable(_notifications);

  //--------------------------------------------------
  // Unread Count
  //--------------------------------------------------

  int get unreadCount =>
      _notifications.where((e) => !e.isRead).length;

  //--------------------------------------------------
  // Mark Read
  //--------------------------------------------------

  void markAsRead(int index) {
    _notifications[index].isRead = true;
    notifyListeners();
  }

  //--------------------------------------------------
  // Mark All Read
  //--------------------------------------------------

  void markAllAsRead() {
    for (final item in _notifications) {
      item.isRead = true;
    }

    notifyListeners();
  }

  //--------------------------------------------------
  // Clear
  //--------------------------------------------------

  void clear() {
    _notifications.clear();
    notifyListeners();
  }
}

class AppNotification {
  AppNotification({
    required this.title,
    required this.message,
    required this.date,
    this.isRead = false,
  });

  final String title;
  final String message;
  final DateTime date;
  bool isRead;
}