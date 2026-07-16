
// app_regex.dart
class AppRegex {
  AppRegex._();

  /// Indian Mobile Number
  static final RegExp phone =
      RegExp(r'^[6-9]\d{9}$');

  /// 6 Digit OTP
  static final RegExp otp =
      RegExp(r'^\d{6}$');

  /// Email
  static final RegExp email =
      RegExp(
        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
      );

  /// Name
  static final RegExp name =
      RegExp(r'^[a-zA-Z ]+$');
}