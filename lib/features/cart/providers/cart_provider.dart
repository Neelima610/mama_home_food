import 'package:flutter/material.dart';

import '../../../data/repositories/cart_repository.dart';
import '../../../models/cart/cart_model.dart';
import '../../../models/product/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _cartItems = [];

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  List<CartModel> get cartItems => _cartItems;

  double get totalPrice =>
      CartRepository.getTotalPrice();

  double get subtotal => totalPrice;

double get deliveryCharge {
  return subtotal >= 499 ? 0 : 40;
}

double get discount {
  return subtotal >= 799 ? 50 : 0;
}

double get grandTotal {
  return subtotal +
      deliveryCharge -
      discount;
}

  int get totalItems =>
      CartRepository.getTotalItems();
  

  bool get isEmpty => _cartItems.isEmpty;

  //--------------------------------------------------
  // Load Cart
  //--------------------------------------------------

  void loadCart() {
    _cartItems = CartRepository.getCartItems();
    notifyListeners();
  }

  //--------------------------------------------------
  // Add Product
  //--------------------------------------------------

  void addToCart(
    ProductModel product, {
    int quantity = 1,
  }) {
    CartRepository.addToCart(
      product,
      quantity: quantity,
    );

    loadCart();
  }

  //--------------------------------------------------
  // Remove Product
  //--------------------------------------------------

  void removeFromCart(
    String productId,
  ) {
    CartRepository.removeFromCart(
      productId,
    );

    loadCart();
  }

  //--------------------------------------------------
  // Increase Quantity
  //--------------------------------------------------

  void increaseQuantity(
    String productId,
  ) {
    CartRepository.increaseQuantity(
      productId,
    );

    loadCart();
  }

  //--------------------------------------------------
  // Decrease Quantity
  //--------------------------------------------------

  void decreaseQuantity(
    String productId,
  ) {
    CartRepository.decreaseQuantity(
      productId,
    );

    loadCart();
  }

  //--------------------------------------------------
  // Clear Cart
  //--------------------------------------------------

  void clearCart() {
    CartRepository.clearCart();
    loadCart();
  }
}