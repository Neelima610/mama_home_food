

// profile_formatter.dart
import '../../../core/constants/constants.dart';
import '../../../models/user/user_model.dart';

class ProfileFormatter {
  const ProfileFormatter._();

  //--------------------------------------------------
  // Greeting
  //--------------------------------------------------

  static String greeting(
    UserModel user,
  ) {
    if (user.firstName.trim().isEmpty) {
      return AppStrings.welcome;
    }

    return '${AppStrings.welcome}, ${user.firstName}';
  }

  //--------------------------------------------------
  // Email
  //--------------------------------------------------

  static String email(
    String email,
  ) {
    return email.trim().toLowerCase();
  }

  //--------------------------------------------------
  // Phone Number
  //--------------------------------------------------

  static String phoneNumber(
    String phoneNumber,
  ) {
    if (phoneNumber.length != 10) {
      return phoneNumber;
    }

    return '${phoneNumber.substring(0, 5)} ${phoneNumber.substring(5)}';
  }

  //--------------------------------------------------
  // Date
  //--------------------------------------------------

  static String formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return AppStrings.notAvailable;
    }

    final day =
        date.day.toString().padLeft(2, '0');

    final month =
        date.month.toString().padLeft(2, '0');

    final year = date.year;

    return '$day/$month/$year';
  }

  //--------------------------------------------------
  // Date Of Birth
  //--------------------------------------------------

  static String dateOfBirth(
    DateTime? date,
  ) {
    return formatDate(date);
  }

  //--------------------------------------------------
  // Member Since
  //--------------------------------------------------

  static String memberSince(
    DateTime? date,
  ) {
    return formatDate(date);
  }

  //--------------------------------------------------
  // Gender
  //--------------------------------------------------

  static String gender(
    String? gender,
  ) {
    if (gender == null ||
        gender.trim().isEmpty) {
      return AppStrings.notAvailable;
    }

    return gender;
  }

  //--------------------------------------------------
  // Referral Code
  //--------------------------------------------------

  static String referralCode(
    String? code,
  ) {
    if (code == null ||
        code.trim().isEmpty) {
      return AppStrings.notAvailable;
    }

    return code;
  }

  //--------------------------------------------------
  // Profile Completion
  //--------------------------------------------------

  static String profileCompletion(
    int percentage,
  ) {
    return '$percentage%';
  }

  //--------------------------------------------------
  // Order Count
  //--------------------------------------------------

  static String orderCount(
    int count,
  ) {
    return '$count ${count == 1 ? 'Order' : 'Orders'}';
  }

  //--------------------------------------------------
  // Address Count
  //--------------------------------------------------

  static String addressCount(
    int count,
  ) {
    return '$count ${count == 1 ? 'Address' : 'Addresses'}';
  }

  //--------------------------------------------------
  // Verification Status
  //--------------------------------------------------

  static String verificationStatus(
    bool verified,
  ) {
    return verified
        ? AppStrings.success
        : AppStrings.pending;
  }

  //--------------------------------------------------
  // Account Status
  //--------------------------------------------------

  static String accountStatus(
    bool active,
  ) {
    return active
        ? AppStrings.available
        : AppStrings.outOfStock;
  }

  //--------------------------------------------------
  // App Version
  //--------------------------------------------------

  static String appVersion(
    String version,
  ) {
    return '${AppStrings.version} $version';
  }

  //--------------------------------------------------
  // Empty Value
  //--------------------------------------------------

  static String value(
    String? text,
  ) {
    if (text == null ||
        text.trim().isEmpty) {
      return AppStrings.notAvailable;
    }

    return text.trim();
  }
}