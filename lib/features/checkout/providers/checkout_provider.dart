import 'package:flutter/material.dart';

class CheckoutProvider extends ChangeNotifier {
  //--------------------------------------------------
  // Delivery Address
  //--------------------------------------------------

  String _deliveryAddress = '';

  String get deliveryAddress => _deliveryAddress;

  void updateAddress(String address) {
    _deliveryAddress = address;
    notifyListeners();
  }

  //--------------------------------------------------
  // Payment Method
  //--------------------------------------------------

  String _paymentMethod = 'Cash on Delivery';

  String get paymentMethod => _paymentMethod;

  void selectPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }

  //--------------------------------------------------
  // Coupon
  //--------------------------------------------------

  String? _couponCode;

  String? get couponCode => _couponCode;

  void applyCoupon(String code) {
    _couponCode = code;
    notifyListeners();
  }

  void removeCoupon() {
    _couponCode = null;
    notifyListeners();
  }
}