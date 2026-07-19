
// auth_validator.dart
import '../../../core/constants/app_regex.dart';
import '../../../core/constants/app_strings.dart';

class AuthValidator {
  AuthValidator._();

  //--------------------------------------------------
  // Phone
  //--------------------------------------------------

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.phoneRequired;
    }

    if (!AppRegex.phone.hasMatch(value.trim())) {
      return AppStrings.invalidPhone;
    }

    return null;
  }

  //--------------------------------------------------
  // OTP
  //--------------------------------------------------

  static String? validateOtp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.otpRequired;
    }

    if (!AppRegex.otp.hasMatch(value.trim())) {
      return AppStrings.invalidOtp;
    }

    return null;
  }

  //--------------------------------------------------
  // Name
  //--------------------------------------------------

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.nameRequired;
    }

    final name = value.trim();

    if (name.length < 3) {
      return AppStrings.shortName;
    }

    if (!AppRegex.name.hasMatch(name)) {
      return AppStrings.invalidName;
    }

    return null;
  }

  //--------------------------------------------------
  // Email
  //--------------------------------------------------

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emailRequired;
    }

    if (!AppRegex.email.hasMatch(value.trim())) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  //--------------------------------------------------
  // Password
  //--------------------------------------------------

  static String? validatePassword(
  String? value,
) {
  if (value == null ||
      value.isEmpty) {
    return 'Please enter your password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }

  if (!RegExp(r'[A-Z]')
      .hasMatch(value)) {
    return 'Include at least one uppercase letter';
  }

  if (!RegExp(r'[a-z]')
      .hasMatch(value)) {
    return 'Include at least one lowercase letter';
  }

  if (!RegExp(r'[0-9]')
      .hasMatch(value)) {
    return 'Include at least one number';
  }

  return null;
}
}