class AppValidator {
  AppValidator._();

  /// Required Field
  static String? requiredField(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Email Validation
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    const pattern =
        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$';

    final regex = RegExp(pattern);

    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Minimum Length
  static String? minLength(
    String? value,
    int length,
  ) {
    if (value == null || value.length < length) {
      return 'Minimum $length characters required';
    }

    return null;
  }

  /// OTP Validation
  static String? otp(
    String? value, {
    int length = 6,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'OTP is required';
    }

    if (value.length != length) {
      return 'OTP must be $length digits';
    }

    return null;
  }
}