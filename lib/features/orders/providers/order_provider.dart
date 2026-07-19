
// order_provider.dart
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../data/repositories/repositories.dart';
import '../../../models/order/order_model.dart';


class OrderProvider extends ChangeNotifier {
  List<OrderModel> _orders = [];

  bool _isLoading = false;

  OrderModel? _selectedOrder;

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  List<OrderModel> get orders => _orders;

  bool get isLoading => _isLoading;

  OrderModel? get selectedOrder =>
      _selectedOrder;
  bool get isEmpty => _orders.isEmpty;

bool get isNotEmpty => _orders.isNotEmpty;

  //--------------------------------------------------
  // Load Orders
  //--------------------------------------------------

  Future<void> loadOrders() async {
    _isLoading = true;
    notifyListeners();

    _orders =
        await OrderRepository.getOrders();

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Get Order
  //--------------------------------------------------

  Future<void> getOrder(
    String orderId,
  ) async {
    _isLoading = true;
    notifyListeners();

    _selectedOrder =
        await OrderRepository.getOrderById(
      orderId,
    );

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Place Order
  //--------------------------------------------------

  Future<void> placeOrder(
    OrderModel order,
  ) async {
    _isLoading = true;
    notifyListeners();

    await OrderRepository.placeOrder(
      order,
    );

    _orders.insert(
      AppNumbers.zero,
      order,
    );

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Update Order
  //--------------------------------------------------

  Future<void> updateOrder(
    OrderModel order,
  ) async {
    _isLoading = true;
    notifyListeners();

    await OrderRepository.updateOrder(
      order,
    );

    final index = _orders.indexWhere(
      (item) =>
          item.id == order.id,
    );

    if (index != -1) {
      _orders[index] = order;
    }

    _selectedOrder = order;

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Cancel Order
  //--------------------------------------------------

  Future<void> cancelOrder({
    required String orderId,
    required String reason,
  }) async {
    _isLoading = true;
    notifyListeners();

    await OrderRepository.cancelOrder(
      orderId: orderId,
      reason: reason,
    );

    await loadOrders();

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Delete Order
  //--------------------------------------------------

  Future<void> deleteOrder(
    String orderId,
  ) async {
    _isLoading = true;
    notifyListeners();

    await OrderRepository.deleteOrder(
      orderId,
    );

    _orders.removeWhere(
      (order) =>
          order.id == orderId,
    );

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Clear
  //--------------------------------------------------

  void clear() {
    _orders.clear();
    _selectedOrder = null;
    notifyListeners();
  }
}