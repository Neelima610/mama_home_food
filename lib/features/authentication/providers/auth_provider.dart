// auth_provider.dart

import 'package:flutter/material.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../models/user/user_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  //--------------------------------------------------
  // Repository
  //--------------------------------------------------

  final AuthRepository _repository = AuthRepository();

  //--------------------------------------------------
  // User
  //--------------------------------------------------

  UserModel? _user;

  UserModel? get user => _user;

  bool get hasUser => _user != null;

  //--------------------------------------------------
  // Authentication Status
  //--------------------------------------------------

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  bool get isAuthenticated =>
      _isLoggedIn && _user != null;

  //--------------------------------------------------
  // Phone Number
  //--------------------------------------------------

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String value) {
    final phone = value.trim();

    if (_phoneNumber == phone) {
      return;
    }

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

    if (_otp == otp) {
      return;
    }

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

    if (_userName == name) {
      return;
    }

    _userName = name;
    notifyListeners();
  }

  //--------------------------------------------------
  // Loading
  //--------------------------------------------------

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    if (_isLoading == value) {
      return;
    }

    _isLoading = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // Error
  //--------------------------------------------------

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get hasError =>
      _errorMessage != null &&
      _errorMessage!.isNotEmpty;

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    if (_errorMessage == null) {
      return;
    }

    _errorMessage = null;
    notifyListeners();
  }

  //--------------------------------------------------
  // OTP Status
  //--------------------------------------------------

  bool _isOtpSent = false;

  bool get isOtpSent => _isOtpSent;

  void startOtpVerification() {
    if (_isOtpSent) {
      return;
    }

    _isOtpSent = true;
    notifyListeners();
  }

  void setOtpSent(bool value) {
    if (_isOtpSent == value) {
      return;
    }

    _isOtpSent = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // Login
  //--------------------------------------------------

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      setLoading(true);
      clearError();

      final user = await _repository.login(
        email: email,
        password: password,
      );

      _user = user;
      _isLoggedIn = true;
      _isOtpSent = false;
    } catch (_) {
      setError(
        'Login failed. Please try again.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Signup
  //--------------------------------------------------

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      setLoading(true);
      clearError();

      final user = await _repository.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

      _user = user;
      _isLoggedIn = true;
      _phoneNumber = phoneNumber;
      _userName = '$firstName $lastName'.trim();
    } catch (_) {
      setError(
        'Signup failed. Please try again.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Send OTP
  //--------------------------------------------------

  Future<void> sendOtp() async {
    try {
      setLoading(true);
      clearError();

      if (_phoneNumber.isEmpty) {
        setError(
          'Please enter a phone number.',
        );
        return;
      }

      await _repository.sendOtp(
        _phoneNumber,
      );

      _isOtpSent = true;
    } catch (_) {
      setError(
        'Failed to send OTP.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Verify OTP
  //--------------------------------------------------

  Future<void> verifyOtp(
    String otp,
  ) async {
    try {
      setLoading(true);
      clearError();

      final user = await _repository.verifyOtp(
        phoneNumber: _phoneNumber,
        otp: otp,
      );

      _user = user;
      _isLoggedIn = true;
      _isOtpSent = false;
      _otp = otp;
    } catch (_) {
      setError(
        'Invalid OTP. Please try again.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Get Current User
  //--------------------------------------------------

  Future<void> getCurrentUser() async {
    try {
      setLoading(true);
      clearError();

      final user =
          await _repository.getCurrentUser();

      _user = user;
      _isLoggedIn = user != null;

      if (user != null) {
        _phoneNumber = user.phoneNumber;
        _userName = user.fullName;
      }
    } catch (_) {
      setError(
        'Failed to load user.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Reset Password
  //--------------------------------------------------

  Future<void> resetPassword(
    String email,
  ) async {
    try {
      setLoading(true);
      clearError();

      await _repository.resetPassword(
        email,
      );
    } catch (_) {
      setError(
        'Failed to reset password.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Logout
  //--------------------------------------------------

  Future<void> logout() async {
    try {
      setLoading(true);
      clearError();

      await _repository.logout();
    } catch (_) {
      setError(
        'Logout failed.',
      );
    } finally {
      clear();
    }
  }

  //--------------------------------------------------
  // Computed Getters
  //--------------------------------------------------

  bool get hasPhoneNumber =>
      _phoneNumber.isNotEmpty;

  bool get hasOtp =>
      _otp.length == 6;

  bool get canVerifyOtp =>
      hasPhoneNumber &&
      _isOtpSent;

  //--------------------------------------------------
  // Clear
  //--------------------------------------------------

  void clear() {
    _user = null;
    _phoneNumber = '';
    _otp = '';
    _userName = '';

    _isLoading = false;
    _isOtpSent = false;
    _isLoggedIn = false;

    _errorMessage = null;

    notifyListeners();
  }

  //--------------------------------------------------
  // Initialize Authentication
  //--------------------------------------------------

  Future<void> initialize() async {
    try {
      setLoading(true);
      clearError();

      final user =
          await _repository.getCurrentUser();

      _user = user;
      _isLoggedIn = user != null;

      if (user != null) {
        _phoneNumber = user.phoneNumber;
        _userName = user.fullName;
      }
    } catch (_) {
      setError(
        'Failed to initialize authentication.',
      );
    } finally {
      setLoading(false);
    }
  }
}