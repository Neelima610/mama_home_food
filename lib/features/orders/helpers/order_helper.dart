import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/colors/app_colors.dart';
import '../../../models/order/order_model.dart';

class OrderHelper {
  OrderHelper._();

  //--------------------------------------------------
  // Status Text
  //--------------------------------------------------

  static String getStatusText(
    OrderStatus status,
  ) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';

      case OrderStatus.confirmed:
        return 'Confirmed';

      case OrderStatus.preparing:
        return 'Preparing';

      case OrderStatus.outForDelivery:
        return 'Out for Delivery';

      case OrderStatus.delivered:
        return 'Delivered';

      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  //--------------------------------------------------
  // Status Color
  //--------------------------------------------------

  static Color getStatusColor(
    OrderStatus status,
  ) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;

      case OrderStatus.confirmed:
        return Colors.blue;

      case OrderStatus.preparing:
        return Colors.deepOrange;

      case OrderStatus.outForDelivery:
        return AppColors.primary;

      case OrderStatus.delivered:
        return Colors.green;

      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  //--------------------------------------------------
  // Status Icon
  //--------------------------------------------------

  static IconData getStatusIcon(
    OrderStatus status,
  ) {
    switch (status) {
      case OrderStatus.pending:
        return Icons.schedule_rounded;

      case OrderStatus.confirmed:
        return Icons.check_circle_outline_rounded;

      case OrderStatus.preparing:
        return Icons.restaurant_rounded;

      case OrderStatus.outForDelivery:
        return Icons.delivery_dining_rounded;

      case OrderStatus.delivered:
        return Icons.task_alt_rounded;

      case OrderStatus.cancelled:
        return Icons.cancel_rounded;
    }
  }

  //--------------------------------------------------
  // Date
  //--------------------------------------------------

  static String formatDate(
    DateTime date,
  ) {
    return DateFormat(
      'dd MMM yyyy',
    ).format(date);
  }

  //--------------------------------------------------
  // Time
  //--------------------------------------------------

  static String formatTime(
    DateTime date,
  ) {
    return DateFormat(
      'hh:mm a',
    ).format(date);
  }

  //--------------------------------------------------
  // Date & Time
  //--------------------------------------------------

  static String formatDateTime(
    DateTime date,
  ) {
    return DateFormat(
      'dd MMM yyyy • hh:mm a',
    ).format(date);
  }

  //--------------------------------------------------
  // Order ID
  //--------------------------------------------------

  static String formatOrderId(
    String id,
  ) {
    if (id.length <= 8) {
      return id;
    }

    return '#${id.substring(0, 8).toUpperCase()}';
  }
}