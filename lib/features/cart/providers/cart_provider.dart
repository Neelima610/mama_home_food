// cart_provider.dart

import 'package:flutter/material.dart';

import '../../../data/repositories/cart_repository.dart';
import '../../../models/cart/cart_model.dart';
import '../../../models/product/product_model.dart';

import '../helpers/cart_calculator.dart';


class CartProvider extends ChangeNotifier {


  List<CartModel> _cartItems = [];



  //--------------------------------------------------
  // Getters
  //--------------------------------------------------


  List<CartModel> get cartItems =>
      _cartItems;



  double get subtotal =>
      CartRepository.getTotalPrice();



  double get deliveryCharge =>
      CartCalculator.deliveryCharge(
        subtotal,
      );



  double get discount =>
      CartCalculator.discount(
        subtotal,
      );



  double get grandTotal =>
      CartCalculator.grandTotal(
        subtotal,
      );



  bool get hasFreeDelivery =>
      CartCalculator.hasFreeDelivery(
        subtotal,
      );



  bool get hasDiscount =>
      CartCalculator.hasDiscount(
        subtotal,
      );



  double get remainingForFreeDelivery =>
      CartCalculator.remainingForFreeDelivery(
        subtotal,
      );



  String get freeDeliveryMessage =>
      CartCalculator.freeDeliveryMessage(
        subtotal,
      );



  String get discountMessage =>
      CartCalculator.discountMessage(
        subtotal,
      );



  int get totalItems =>
      CartRepository.getTotalItems();



  bool get isEmpty =>
      _cartItems.isEmpty;



  //--------------------------------------------------
  // Get Product Quantity
  //--------------------------------------------------

  int getQuantity(
    String productId,
  ) {

    try {

      final item =
          _cartItems.firstWhere(
        (cartItem) =>
            cartItem.product.id == productId,
      );


      return item.quantity;


    } catch (e) {


      return 0;


    }
  }




  //--------------------------------------------------
  // Load Cart
  //--------------------------------------------------

  void loadCart() {

    _cartItems =
        CartRepository.getCartItems();


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