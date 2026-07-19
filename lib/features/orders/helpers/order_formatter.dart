

// order_formatter.dart

import '../../../core/constants/constants.dart';
import '../../../models/order/order_status.dart';
import 'order_helper.dart';

class OrderFormatter {
  const OrderFormatter._();

  //--------------------------------------------------
  // Order ID
  //--------------------------------------------------

  static String formatOrderId(
    String orderId,
  ) {
    return "${AppConstants.orderPrefix}$orderId";
  }

  //--------------------------------------------------
  // Currency
  //--------------------------------------------------

  static String formatAmount(
    double amount,
  ) {
    return "${AppConstants.currencySymbol}${amount.toStringAsFixed(AppNumbers.two)}";
  }

  //--------------------------------------------------
  // Quantity
  //--------------------------------------------------

  static String formatQuantity(
    int quantity,
  ) {
    return "$quantity ${quantity == AppNumbers.one ? AppStrings.item : AppStrings.items}";
  }

  //--------------------------------------------------
  // Date
  //--------------------------------------------------

  static String formatDate(
    DateTime date,
  ) {
    return "${date.day}/${date.month}/${date.year}";
  }

  //--------------------------------------------------
  // Time
  //--------------------------------------------------

  static String formatTime(
    DateTime date,
  ) {
    final hour =
        date.hour.toString().padLeft(
              AppNumbers.two,
              AppStrings.zero,
            );

    final minute =
        date.minute.toString().padLeft(
              AppNumbers.two,
              AppStrings.zero,
            );

    return "$hour:$minute";
  }

  //--------------------------------------------------
  // Date & Time
  //--------------------------------------------------

  static String formatDateTime(
    DateTime date,
  ) {
    return "${formatDate(date)} ${formatTime(date)}";
  }

  //--------------------------------------------------
  // Status
  //--------------------------------------------------

  static String formatStatus(
    OrderStatus status,
  ) {
    return OrderHelper.getStatusTitle(
      status,
    );
  }

  //--------------------------------------------------
  // ETA
  //--------------------------------------------------

  static String formatETA(
    DateTime date,
  ) {
    return "${AppStrings.estimatedDelivery}: ${formatTime(date)}";
  }
}