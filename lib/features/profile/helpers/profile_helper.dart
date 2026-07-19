import '../../../core/constants/constants.dart';
import '../../../models/user/user_model.dart';

class ProfileHelper {
  const ProfileHelper._();

  //--------------------------------------------------
  // Greeting
  //--------------------------------------------------

  static String greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return '${AppStrings.welcome} ☀️';
    }

    if (hour < 17) {
      return 'Good Afternoon ☀️';
    }

    return 'Good Evening 🌙';
  }

  //--------------------------------------------------
  // Verification
  //--------------------------------------------------

  static bool isVerified(
    UserModel user,
  ) {
    return user.isEmailVerified &&
        user.isPhoneVerified;
  }

  //--------------------------------------------------
  // Active Account
  //--------------------------------------------------

  static bool isActive(
    UserModel user,
  ) {
    return user.isActive;
  }

  //--------------------------------------------------
  // Profile Completion
  //--------------------------------------------------

  static double profileCompletion(
    UserModel user,
  ) {
    int completed = 0;
    const total = 8;

    if (user.firstName.trim().isNotEmpty) {
      completed++;
    }

    if (user.lastName.trim().isNotEmpty) {
      completed++;
    }

    if (user.email.trim().isNotEmpty) {
      completed++;
    }

    if (user.phoneNumber.trim().isNotEmpty) {
      completed++;
    }

    if (user.profileImage?.isNotEmpty ?? false) {
      completed++;
    }

    if (user.gender?.isNotEmpty ?? false) {
      completed++;
    }

    if (user.dateOfBirth != null) {
      completed++;
    }

    if (user.referralCode?.isNotEmpty ?? false) {
      completed++;
    }

    return completed / total;
  }

  //--------------------------------------------------
  // Profile Completion Percentage
  //--------------------------------------------------

  static int profileCompletionPercentage(
    UserModel user,
  ) {
    return (profileCompletion(user) * 100)
        .round();
  }

  //--------------------------------------------------
  // Profile Completed
  //--------------------------------------------------

  static bool isProfileCompleted(
    UserModel user,
  ) {
    return profileCompletion(user) == 1;
  }

  //--------------------------------------------------
  // Update Profile
  //--------------------------------------------------

  static UserModel updateProfile({
    required UserModel user,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    String? profileImage,
    DateTime? dateOfBirth,
    String? gender,
  }) {
    return user.copyWith(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      email: email.trim(),
      phoneNumber: phoneNumber.trim(),
      profileImage: profileImage,
      dateOfBirth: dateOfBirth,
      gender: gender,
      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------
  // Update Profile Image
  //--------------------------------------------------

  static UserModel updateProfileImage({
    required UserModel user,
    required String imageUrl,
  }) {
    return user.copyWith(
      profileImage: imageUrl,
      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------
  // Verify Email
  //--------------------------------------------------

  static UserModel verifyEmail(
    UserModel user,
  ) {
    return user.copyWith(
      isEmailVerified: true,
      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------
  // Verify Phone
  //--------------------------------------------------

  static UserModel verifyPhone(
    UserModel user,
  ) {
    return user.copyWith(
      isPhoneVerified: true,
      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------
  // Activate Account
  //--------------------------------------------------

  static UserModel activate(
    UserModel user,
  ) {
    return user.copyWith(
      isActive: true,
      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------
  // Deactivate Account
  //--------------------------------------------------

  static UserModel deactivate(
    UserModel user,
  ) {
    return user.copyWith(
      isActive: false,
      updatedAt: DateTime.now(),
    );
  }
}