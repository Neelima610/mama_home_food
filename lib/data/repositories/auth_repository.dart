// auth_repository.dart

import '../../models/user/user_model.dart';

class AuthRepository {
  //--------------------------------------------------
  // Current User
  //--------------------------------------------------

  UserModel? _currentUser;

  //--------------------------------------------------
  // Get Current User
  //--------------------------------------------------

  Future<UserModel?> getCurrentUser() async {
    return _currentUser;
  }

  //--------------------------------------------------
  // Login
  //--------------------------------------------------

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    // Firebase login will come here later.

    final user = UserModel(
      id: 'demo_user_id',
      firstName: 'User',
      lastName: '',
      email: email,
      phoneNumber: '',
      isEmailVerified: true,
      isActive: true,
      createdAt: DateTime.now(),
    );

    _currentUser = user;

    return user;
  }

  //--------------------------------------------------
  // Signup
  //--------------------------------------------------

  Future<UserModel> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    // Firebase signup will come here later.

    final user = UserModel(
      id: 'demo_user_id',
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      isEmailVerified: false,
      isPhoneVerified: false,
      isActive: true,
      createdAt: DateTime.now(),
    );

    _currentUser = user;

    return user;
  }

  //--------------------------------------------------
  // Send OTP
  //--------------------------------------------------

  Future<void> sendOtp(
    String phoneNumber,
  ) async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    // Firebase Phone Authentication
    // will be added here later.
  }

  //--------------------------------------------------
  // Verify OTP
  //--------------------------------------------------

  Future<UserModel> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    // Temporary demo OTP
    if (otp != '123456') {
      throw Exception(
        'Invalid OTP',
      );
    }

    final user = UserModel(
      id: 'demo_user_id',
      firstName: 'User',
      lastName: '',
      email: '',
      phoneNumber: phoneNumber,
      isEmailVerified: false,
      isPhoneVerified: true,
      isActive: true,
      createdAt: DateTime.now(),
    );

    _currentUser = user;

    return user;
  }

  //--------------------------------------------------
  // Reset Password
  //--------------------------------------------------

  Future<void> resetPassword(
    String email,
  ) async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    // Firebase password reset later.
  }

  //--------------------------------------------------
  // Verify OTP
  //--------------------------------------------------

  Future<void> verifyOtpCode(
    String otp,
  ) async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );

    // Additional OTP verification
    // can be implemented later.
  }

  //--------------------------------------------------
  // Logout
  //--------------------------------------------------

  Future<void> logout() async {
    await Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
    );

    _currentUser = null;
  }
}