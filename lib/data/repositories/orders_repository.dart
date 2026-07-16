import '../../models/order/order_model.dart';

class OrdersRepository {
  OrdersRepository._();

  static final List<OrderModel> _orders = [];

  //--------------------------------------------------
  // Get All Orders
  //--------------------------------------------------

  static List<OrderModel> getOrders() {
    return List.unmodifiable(_orders);
  }

  //--------------------------------------------------
  // Get Order By Id
  //--------------------------------------------------

  static OrderModel? getOrderById(
    String orderId,
  ) {
    try {
      return _orders.firstWhere(
        (order) => order.id == orderId,
      );
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------
  // Place Order
  //--------------------------------------------------

  static void placeOrder(
    OrderModel order,
  ) {
    _orders.insert(0, order);
  }

  //--------------------------------------------------
  // Cancel Order
  //--------------------------------------------------

  static void cancelOrder(
    String orderId,
  ) {
    final index = _orders.indexWhere(
      (order) => order.id == orderId,
    );

    if (index == -1) return;

    _orders[index] = _orders[index].copyWith(
      status: OrderStatus.cancelled,
    );
  }

  //--------------------------------------------------
  // Clear Orders
  //--------------------------------------------------

  static void clearOrders() {
    _orders.clear();
  }
}