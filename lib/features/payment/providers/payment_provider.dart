import 'package:flutter/material.dart';

import '../../../models/payment/payment_method_type.dart';

class PaymentProvider extends ChangeNotifier {
  PaymentMethodType? _selectedMethod;

  bool _isLoading = false;

  bool _paymentSuccess = false;

  bool _paymentFailed = false;

  String _transactionId = "";

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  PaymentMethodType? get selectedMethod =>
      _selectedMethod;

  bool get isLoading => _isLoading;

  bool get paymentSuccess =>
      _paymentSuccess;

  bool get paymentFailed =>
      _paymentFailed;

  String get transactionId =>
      _transactionId;

  //--------------------------------------------------
  // Select Payment Method
  //--------------------------------------------------

  void selectMethod(
    PaymentMethodType method,
  ) {
    _selectedMethod = method;
    notifyListeners();
  }

  //--------------------------------------------------
  // Loading
  //--------------------------------------------------

  void setLoading(
    bool value,
  ) {
    _isLoading = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // Payment Success
  //--------------------------------------------------

  void setPaymentSuccess(
    String transactionId,
  ) {
    _paymentSuccess = true;
    _paymentFailed = false;
    _transactionId = transactionId;
    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Payment Failed
  //--------------------------------------------------

  void setPaymentFailed() {
    _paymentFailed = true;
    _paymentSuccess = false;
    _transactionId = "";
    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Clear Status
  //--------------------------------------------------

  void clearStatus() {
    _paymentSuccess = false;
    _paymentFailed = false;
    _transactionId = "";
    notifyListeners();
  }

  //--------------------------------------------------
  // Reset
  //--------------------------------------------------

  void reset() {
    _selectedMethod = null;
    _paymentSuccess = false;
    _paymentFailed = false;
    _transactionId = "";
    _isLoading = false;
    notifyListeners();
  }
}