
// app_regex.dart
import 'package:flutter/material.dart';

@immutable
class AppRegex {
  const AppRegex._();

  //--------------------------------------------------
  // Authentication
  //--------------------------------------------------

  static final RegExp email = RegExp(
    r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
  );

  static final RegExp phone = RegExp(
    r'^[6-9]\d{9}$',
  );

  static final RegExp otp = RegExp(
    r'^\d{6}$',
  );

  static final RegExp password = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d).{8,}$',
  );

  //--------------------------------------------------
  // Payment
  //--------------------------------------------------

  static final RegExp cardNumber = RegExp(
    r'^[0-9]{16}$',
  );

  static final RegExp expiryDate = RegExp(
    r'^(0[1-9]|1[0-2])\/([0-9]{2})$',
  );

  static final RegExp cvv = RegExp(
    r'^[0-9]{3}$',
  );

  static final RegExp upiId = RegExp(
    r'^[\w.\-]{2,}@[a-zA-Z]{2,}$',
  );

  //--------------------------------------------------
  // Address
  //--------------------------------------------------

  static final RegExp pincode = RegExp(
    r'^\d{6}$',
  );

  //--------------------------------------------------
  // Name
  //--------------------------------------------------

  static final RegExp name = RegExp(
    r'^[a-zA-Z ]+$',
  );

  static final RegExp orderId =
    RegExp(r'^ORD\d+$');
}