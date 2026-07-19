// order_repository.dart

import '../../../core/constants/constants.dart';
import '../../models/order/order_model.dart';
import '../../models/order/order_status.dart';


class OrderRepository {
  OrderRepository._();

  static final List<OrderModel> _orders = [];

  //--------------------------------------------------
  // Get Orders
  //--------------------------------------------------

  static Future<List<OrderModel>>
      getOrders() async {
    await Future.delayed(
      AppDurations.repositoryDelay,
    );

    return List.unmodifiable(
      _orders,
    );
  }

  //--------------------------------------------------
  // Get Order
  //--------------------------------------------------

  static Future<OrderModel?>
      getOrderById(
    String orderId,
  ) async {
    await Future.delayed(
      AppDurations.repositoryDelay,
    );

    try {
      return _orders.firstWhere(
        (order) =>
            order.id == orderId,
      );
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------
  // Place Order
  //--------------------------------------------------

  static Future<void> placeOrder(
    OrderModel order,
  ) async {
    await Future.delayed(
      AppDurations.repositoryDelay,
    );

    _orders.insert(
      0,
      order,
    );
  }

  //--------------------------------------------------
  // Update Order
  //--------------------------------------------------

  static Future<void> updateOrder(
    OrderModel order,
  ) async {
    await Future.delayed(
      AppDurations.repositoryDelay,
    );

    final index = _orders.indexWhere(
      (element) =>
          element.id == order.id,
    );

    if (index != -1) {
      _orders[index] = order;
    }
  }

  //--------------------------------------------------
  // Cancel Order
  //--------------------------------------------------

  static Future<void> cancelOrder({
    required String orderId,
    required String reason,
  }) async {
    await Future.delayed(
      AppDurations.repositoryDelay,
    );

    final index = _orders.indexWhere(
      (order) =>
          order.id == orderId,
    );

    if (index == -1) {
      return;
    }

    _orders[index] = _orders[index]
        .copyWith(
      orderStatus:
          OrderStatus.cancelled,
      cancellationReason:
          reason,
    );
  }

  //--------------------------------------------------
  // Delete Order
  //--------------------------------------------------

  static Future<void> deleteOrder(
    String orderId,
  ) async {
    await Future.delayed(
      AppDurations.repositoryDelay,
    );

    _orders.removeWhere(
      (order) =>
          order.id == orderId,
    );
  }

  //--------------------------------------------------
  // Clear
  //--------------------------------------------------

  static Future<void> clear() async {
    _orders.clear();
  }
}