import 'dart:async';

import '../../../core/constants/constants.dart';

class AuthService {
  AuthService._();

  //--------------------------------------------------
  // Dummy OTP
  //--------------------------------------------------

  static const String _dummyOtp = '123456';

  //--------------------------------------------------
  // Send OTP
  //--------------------------------------------------

  static Future<bool> sendOtp(
    String phoneNumber,
  ) async {
    await Future.delayed(
      AppDurations.longAnimation,
    );

    final phone = phoneNumber.trim();

    return AppRegex.phone.hasMatch(phone);
  }

  //--------------------------------------------------
  // Verify OTP
  //--------------------------------------------------

  static Future<bool> verifyOtp(
    String otp,
  ) async {
    await Future.delayed(
      AppDurations.longAnimation,
    );

    return otp.trim() == _dummyOtp;
  }

  //--------------------------------------------------
  // Logout
  //--------------------------------------------------

  static Future<void> logout() async {
    await Future.delayed(
      AppDurations.mediumAnimation,
    );
  }

  //--------------------------------------------------
  // Development Helper
  //--------------------------------------------------

  static String get dummyOtp => _dummyOtp;
}