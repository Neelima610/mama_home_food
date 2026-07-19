

// order_validator.dart

import '../../../models/order/order_model.dart';
import '../../../models/order/order_status.dart';

import '../../../models/payment/payment_status.dart';

class OrderValidator {
  const OrderValidator._();

  //--------------------------------------------------
  // Valid Order
  //--------------------------------------------------

  static bool isValidOrder(
    OrderModel? order,
  ) {
    return order != null;
  }

  //--------------------------------------------------
  // Can Cancel
  //--------------------------------------------------

  static bool canCancel(
    OrderModel order,
  ) {
    return order.orderStatus ==
            OrderStatus.pending ||
        order.orderStatus ==
            OrderStatus.confirmed;
  }

  //--------------------------------------------------
  // Can Track
  //--------------------------------------------------

  static bool canTrack(
    OrderModel order,
  ) {
    return order.orderStatus !=
            OrderStatus.cancelled &&
        order.orderStatus !=
            OrderStatus.delivered;
  }

  //--------------------------------------------------
  // Can Reorder
  //--------------------------------------------------

  static bool canReorder(
    OrderModel order,
  ) {
    return order.orderStatus ==
        OrderStatus.delivered;
  }

  //--------------------------------------------------
  // Can Download Invoice
  //--------------------------------------------------

  static bool canDownloadInvoice(
  OrderModel order,
) {
  return order.paymentStatus ==
      PaymentStatus.success;
}

  //--------------------------------------------------
  // Is Delivered
  //--------------------------------------------------

  static bool isDelivered(
    OrderModel order,
  ) {
    return order.orderStatus ==
        OrderStatus.delivered;
  }

  //--------------------------------------------------
  // Is Cancelled
  //--------------------------------------------------

  static bool isCancelled(
    OrderModel order,
  ) {
    return order.orderStatus ==
        OrderStatus.cancelled;
  }

  //--------------------------------------------------
  // Is Active
  //--------------------------------------------------

  static bool isActive(
    OrderModel order,
  ) {
    return !isDelivered(order) &&
        !isCancelled(order);
  }
}