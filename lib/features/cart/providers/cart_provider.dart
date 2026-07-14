import 'package:flutter/material.dart';

import '../../../models/product/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cartItems = [];

  List<ProductModel> get cartItems =>
      _cartItems;

  int get itemCount => _cartItems.length;

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalAmount {
    return _cartItems.fold(
      0,
      (sum, item) => sum + item.price,
    );
  }
}