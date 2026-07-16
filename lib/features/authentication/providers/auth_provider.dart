
// auth_provider.dart
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  //--------------------------------------------------
  // Phone Number
  //--------------------------------------------------

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String value) {
    final phone = value.trim();

    if (_phoneNumber == phone) return;

    _phoneNumber = phone;
    notifyListeners();
  }

  //--------------------------------------------------
  // OTP
  //--------------------------------------------------

  String _otp = '';

  String get otp => _otp;

  void setOtp(String value) {
    final otp = value.trim();

    if (_otp == otp) return;

    _otp = otp;
    notifyListeners();
  }

  //--------------------------------------------------
  // User Name
  //--------------------------------------------------

  String _userName = '';

  String get userName => _userName;

  void setUserName(String value) {
    final name = value.trim();

    if (_userName == name) return;

    _userName = name;
    notifyListeners();
  }

  //--------------------------------------------------
  // Loading
  //--------------------------------------------------

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    if (_isLoading == value) return;

    _isLoading = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // OTP Status
  //--------------------------------------------------

  bool _isOtpSent = false;

  bool get isOtpSent => _isOtpSent;

  void setOtpSent(bool value) {
    if (_isOtpSent == value) return;

    _isOtpSent = value;
    notifyListeners();
  }

  /// Starts the OTP verification flow.
  void startOtpVerification() {
    if (_isOtpSent) return;

    _isOtpSent = true;
    notifyListeners();
  }

  //--------------------------------------------------
  // Login Status
  //--------------------------------------------------

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    if (_isLoggedIn) return;

    _isLoggedIn = true;
    _isOtpSent = false;
    notifyListeners();
  }

  void logout() {
    clear();
  }

   //--------------------------------------------------
  // Computed Getters
  //--------------------------------------------------

  bool get hasPhoneNumber =>
      _phoneNumber.isNotEmpty;

  bool get hasOtp =>
      _otp.length == 6;

  bool get canVerifyOtp =>
      hasPhoneNumber && _isOtpSent;

  bool get isAuthenticated =>
      _isLoggedIn;

  //--------------------------------------------------
  // Clear Auth Data
  //--------------------------------------------------

  void clear() {
    _phoneNumber = '';
    _otp = '';
    _userName = '';
    _isLoading = false;
    _isOtpSent = false;
    _isLoggedIn = false;

    notifyListeners();
  }

  //--------------------------------------------------
  // Initialize
  //--------------------------------------------------

  Future<void> initialize() async {
    // TODO:
    // Load authentication data from
    // SharedPreferences / Secure Storage.
    //
    // Example:
    //
    // final prefs =
    //     await SharedPreferences.getInstance();
    //
    // _isLoggedIn =
    //     prefs.getBool(AppKeys.isLoggedIn) ?? false;
    //
    // _phoneNumber =
    //     prefs.getString(AppKeys.phoneNumber) ?? '';
    //
    // notifyListeners();
  }
}
