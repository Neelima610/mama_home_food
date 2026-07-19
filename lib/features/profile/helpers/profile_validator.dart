import '../../../core/constants/constants.dart';
import '../../../models/user/user_model.dart';

class ProfileValidator {
  const ProfileValidator._();

  //--------------------------------------------------
  // First Name
  //--------------------------------------------------

  static String? validateFirstName(
    String? value,
  ) {
    final firstName = value?.trim() ?? '';

    if (firstName.isEmpty) {
      return AppStrings.nameRequired;
    }

    if (firstName.length < 3) {
      return AppStrings.shortName;
    }

    if (!AppRegex.name.hasMatch(firstName)) {
      return AppStrings.invalidName;
    }

    return null;
  }

  //--------------------------------------------------
  // Last Name
  //--------------------------------------------------

  static String? validateLastName(
    String? value,
  ) {
    final lastName = value?.trim() ?? '';

    if (lastName.isEmpty) {
      return AppStrings.nameRequired;
    }

    if (lastName.length < 3) {
      return AppStrings.shortName;
    }

    if (!AppRegex.name.hasMatch(lastName)) {
      return AppStrings.invalidName;
    }

    return null;
  }

  //--------------------------------------------------
  // Full Name
  //--------------------------------------------------

  static String? validateFullName(
    String? value,
  ) {
    final name = value?.trim() ?? '';

    if (name.isEmpty) {
      return AppStrings.nameRequired;
    }

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

  static String? validateEmail(
    String? value,
  ) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) {
      return AppStrings.emailRequired;
    }

    if (!AppRegex.email.hasMatch(email)) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  //--------------------------------------------------
  // Phone Number
  //--------------------------------------------------

  static String? validatePhoneNumber(
    String? value,
  ) {
    final phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return AppStrings.phoneRequired;
    }

    if (!AppRegex.phone.hasMatch(phone)) {
      return AppStrings.invalidPhone;
    }

    return null;
  }

  //--------------------------------------------------
  // Profile Complete
  //--------------------------------------------------

  static bool isProfileComplete(
    UserModel user,
  ) {
    return validateFirstName(
               user.firstName,
           ) ==
           null &&
        validateLastName(
               user.lastName,
           ) ==
           null &&
        validateEmail(
               user.email,
           ) ==
           null &&
        validatePhoneNumber(
               user.phoneNumber,
           ) ==
           null;
  }

  //--------------------------------------------------
  // Profile Image
  //--------------------------------------------------

  static bool hasProfileImage(
    UserModel user,
  ) {
    return user.hasProfileImage;
  }

  //--------------------------------------------------
  // Date Of Birth
  //--------------------------------------------------

  static bool hasDateOfBirth(
    UserModel user,
  ) {
    return user.dateOfBirth != null;
  }

  //--------------------------------------------------
  // Gender
  //--------------------------------------------------

  static bool hasGender(
    UserModel user,
  ) {
    return user.gender?.trim().isNotEmpty ??
        false;
  }

  //--------------------------------------------------
  // Referral Code
  //--------------------------------------------------

  static bool hasReferralCode(
    UserModel user,
  ) {
    return user.referralCode
            ?.trim()
            .isNotEmpty ??
        false;
  }

  //--------------------------------------------------
  // Email Verified
  //--------------------------------------------------

  static bool isEmailVerified(
    UserModel user,
  ) {
    return user.isEmailVerified;
  }

  //--------------------------------------------------
  // Phone Verified
  //--------------------------------------------------

  static bool isPhoneVerified(
    UserModel user,
  ) {
    return user.isPhoneVerified;
  }

  //--------------------------------------------------
  // Fully Verified
  //--------------------------------------------------

  static bool isVerified(
    UserModel user,
  ) {
    return user.isEmailVerified &&
        user.isPhoneVerified;
  }

  //--------------------------------------------------
  // Account Active
  //--------------------------------------------------

  static bool isActive(
    UserModel user,
  ) {
    return user.isActive;
  }

  //--------------------------------------------------
  // Can Edit
  //--------------------------------------------------

  static bool canEditProfile(
    UserModel user,
  ) {
    return user.isActive;
  }

  //--------------------------------------------------
  // Can Delete
  //--------------------------------------------------

  static bool canDeleteAccount(
    UserModel user,
  ) {
    return user.isActive;
  }

  //--------------------------------------------------
  // Can Logout
  //--------------------------------------------------

  static bool canLogout(
    UserModel user,
  ) {
    return true;
  }
}