import 'package:flutter/material.dart';

import '../../../data/repositories/orders_repository.dart';
import '../../../models/order/order_model.dart';

class OrdersProvider extends ChangeNotifier {
  List<OrderModel> _orders = [];

  bool _isLoading = false;

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  List<OrderModel> get orders => _orders;

  bool get isLoading => _isLoading;

  bool get isEmpty => _orders.isEmpty;

  int get orderCount => _orders.length;

  //--------------------------------------------------
  // Load Orders
  //--------------------------------------------------

  void loadOrders() {
    _orders = OrdersRepository.getOrders();
    notifyListeners();
  }

  //--------------------------------------------------
  // Loading
  //--------------------------------------------------

  void setLoading(bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // Place Order
  //--------------------------------------------------

  Future<void> placeOrder(
    OrderModel order,
  ) async {
    setLoading(true);

    OrdersRepository.placeOrder(order);

    loadOrders();

    setLoading(false);
  }

  //--------------------------------------------------
  // Cancel Order
  //--------------------------------------------------

  Future<void> cancelOrder(
    String orderId,
  ) async {
    setLoading(true);

    OrdersRepository.cancelOrder(orderId);

    loadOrders();

    setLoading(false);
  }

  //--------------------------------------------------
  // Get Order
  //--------------------------------------------------

  OrderModel? getOrderById(
    String orderId,
  ) {
    return OrdersRepository.getOrderById(
      orderId,
    );
  }

  //--------------------------------------------------
  // Clear Orders
  //--------------------------------------------------

  void clearOrders() {
    OrdersRepository.clearOrders();
    loadOrders();
  }
}