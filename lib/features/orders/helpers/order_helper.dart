
// order_helper.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../models/order/order_status.dart';

class OrderHelper {
  const OrderHelper._();

  //--------------------------------------------------
  // Order Status Title
  //--------------------------------------------------

  static String getStatusTitle(
    OrderStatus status,
  ) {
    switch (status) {
      case OrderStatus.pending:
        return AppStrings.orderPending;

      case OrderStatus.confirmed:
        return AppStrings.orderConfirmed;

      case OrderStatus.preparing:
        return AppStrings.orderPreparing;

      case OrderStatus.ready:
        return AppStrings.orderReady;

      case OrderStatus.outForDelivery:
        return AppStrings.outForDelivery;

      case OrderStatus.delivered:
        return AppStrings.orderDelivered;

      case OrderStatus.cancelled:
        return AppStrings.orderCancelled;
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
        return AppColors.warning;

      case OrderStatus.confirmed:
        return AppColors.primary;

      case OrderStatus.preparing:
        return AppColors.secondary;

      case OrderStatus.ready:
        return AppColors.info;

      case OrderStatus.outForDelivery:
        return AppColors.accent;

      case OrderStatus.delivered:
        return AppColors.success;

      case OrderStatus.cancelled:
        return AppColors.error;
    }
  }

  //--------------------------------------------------
  // Can Cancel
  //--------------------------------------------------

  static bool canCancel(
    OrderStatus status,
  ) {
    return status == OrderStatus.pending ||
        status == OrderStatus.confirmed;
  }

  //--------------------------------------------------
  // Can Track
  //--------------------------------------------------

  static bool canTrack(
    OrderStatus status,
  ) {
    return status != OrderStatus.cancelled &&
        status != OrderStatus.delivered;
  }

  //--------------------------------------------------
  // Can Reorder
  //--------------------------------------------------

  static bool canReorder(
    OrderStatus status,
  ) {
    return status == OrderStatus.delivered;
  }

  //--------------------------------------------------
  // Progress
  //--------------------------------------------------

  static double getProgress(
    OrderStatus status,
  ) {
    switch (status) {
      case OrderStatus.pending:
        return 0.10;

      case OrderStatus.confirmed:
        return 0.25;

      case OrderStatus.preparing:
        return 0.50;

      case OrderStatus.ready:
        return 0.70;

      case OrderStatus.outForDelivery:
        return 0.90;

      case OrderStatus.delivered:
        return 1.00;

      case OrderStatus.cancelled:
        return 0.00;
    }
  }
}