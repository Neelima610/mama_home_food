import 'package:flutter/material.dart';

import '../../../data/repositories/profile_repository.dart';
import '../../../models/user/user_model.dart';
import '../models/faq_model.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider();

  //--------------------------------------------------
  // Repository
  //--------------------------------------------------

  final ProfileRepository _repository =
      const ProfileRepository();

  //--------------------------------------------------
  // User
  //--------------------------------------------------

  UserModel? _user;

  UserModel? get user => _user;

  bool get hasUser => _user != null;

  //--------------------------------------------------
  // Profile Loading
  //--------------------------------------------------

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //--------------------------------------------------
  // Saving
  //--------------------------------------------------

  bool _isSaving = false;

  bool get isSaving => _isSaving;

  //--------------------------------------------------
  // Error
  //--------------------------------------------------

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get hasError =>
      _errorMessage != null &&
      _errorMessage!.isNotEmpty;

  //--------------------------------------------------
  // FAQ
  //--------------------------------------------------

  List<FaqModel> _faqs = [];

  List<FaqModel> get faqs =>
      List.unmodifiable(_faqs);

  bool get hasFaqs =>
      _faqs.isNotEmpty;

  //--------------------------------------------------
  // FAQ Loading
  //--------------------------------------------------

  bool _isFaqLoading = false;

  bool get isFaqLoading => _isFaqLoading;

  //--------------------------------------------------
  // Load Profile
  //--------------------------------------------------

  Future<void> loadProfile() async {
    try {
      setLoading(true);
      clearError();

      final profile =
          await _repository.getProfile();

      _user = profile;
    } catch (_) {
      setError(
        'Failed to load profile.',
      );
    } finally {
      setLoading(false);
    }
  }

  //--------------------------------------------------
  // Refresh Profile
  //--------------------------------------------------

  Future<void> refreshProfile() async {
    await loadProfile();
  }

  //--------------------------------------------------
  // Set User
  //--------------------------------------------------

  void setUser(
    UserModel user,
  ) {
    _user = user;
    notifyListeners();
  }

  //--------------------------------------------------
  // Clear User
  //--------------------------------------------------

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  //--------------------------------------------------
  // Update Profile
  //--------------------------------------------------

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImage,
    DateTime? dateOfBirth,
    String? gender,
  }) async {
    if (_user == null) {
      return;
    }

    try {
      setSaving(true);
      clearError();

      final updatedUser =
          await _repository.updateProfile(
        _user!.copyWith(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          profileImage: profileImage,
          dateOfBirth: dateOfBirth,
          gender: gender,
          updatedAt: DateTime.now(),
        ),
      );

      _user = updatedUser;
    } catch (_) {
      setError(
        'Failed to update profile.',
      );
    } finally {
      setSaving(false);
    }

    notifyListeners();
  }

  //--------------------------------------------------
  // Update Profile Image
  //--------------------------------------------------

  Future<void> updateProfileImage(
    String imageUrl,
  ) async {
    if (_user == null) {
      return;
    }

    try {
      await _repository.updateProfileImage(
        imageUrl,
      );

      _user = _user!.copyWith(
        profileImage: imageUrl,
        updatedAt: DateTime.now(),
      );

      notifyListeners();
    } catch (_) {
      setError(
        'Failed to update profile image.',
      );
    }
  }

  //--------------------------------------------------
  // Verify Email
  //--------------------------------------------------

  void verifyEmail() {
    if (_user == null) {
      return;
    }

    _user = _user!.copyWith(
      isEmailVerified: true,
      updatedAt: DateTime.now(),
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Verify Phone
  //--------------------------------------------------

  void verifyPhone() {
    if (_user == null) {
      return;
    }

    _user = _user!.copyWith(
      isPhoneVerified: true,
      updatedAt: DateTime.now(),
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Loading State
  //--------------------------------------------------

  void setLoading(
    bool value,
  ) {
    _isLoading = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // Saving State
  //--------------------------------------------------

  void setSaving(
    bool value,
  ) {
    _isSaving = value;
    notifyListeners();
  }

  //--------------------------------------------------
  // Error State
  //--------------------------------------------------

  void setError(
    String? message,
  ) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  //--------------------------------------------------
  // Load FAQs
  //--------------------------------------------------

  Future<void> loadFaqs() async {
    try {
      _isFaqLoading = true;
      clearError();

      notifyListeners();

      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      _faqs = _defaultFaqs();
    } catch (_) {
      setError(
        'Failed to load FAQs.',
      );
    } finally {
      _isFaqLoading = false;

      notifyListeners();
    }
  }

  //--------------------------------------------------
  // Refresh FAQs
  //--------------------------------------------------

  Future<void> refreshFaqs() async {
    await loadFaqs();
  }

  //--------------------------------------------------
  // Default FAQs
  //--------------------------------------------------

  List<FaqModel> _defaultFaqs() {
    return const [
      FaqModel(
        id: '1',
        question:
            'How can I place an order?',
        answer:
            'You can browse our menu, select the food items you want, add them to your cart, and proceed to checkout to place your order.',
      ),

      FaqModel(
        id: '2',
        question:
            'Do you prepare fresh food?',
        answer:
            'Yes. We prepare food fresh for our customers using quality ingredients. We do not prepare large quantities in advance unnecessarily.',
      ),

      FaqModel(
        id: '3',
        question:
            'Do you accept bulk orders?',
        answer:
            'Yes. We accept bulk orders. Please contact us in advance so we can prepare the required quantity according to your requirements.',
      ),

      FaqModel(
        id: '4',
        question:
            'Can I customize my order?',
        answer:
            'Yes. You can contact us regarding your preferences and requirements. We will try our best to prepare the food according to your preferences.',
      ),

      FaqModel(
        id: '5',
        question:
            'How can I contact Mama Home Food?',
        answer:
            'You can contact us through the Contact Us section available in the app.',
      ),

      FaqModel(
        id: '6',
        question:
            'Do you provide delivery?',
        answer:
            'Delivery availability depends on your location. Delivery charges may apply based on the distance and order details.',
      ),

      FaqModel(
        id: '7',
        question:
            'Can I cancel my order?',
        answer:
            'Order cancellation depends on the preparation status of your order. Please contact us as soon as possible if you need to cancel an order.',
      ),

      FaqModel(
        id: '8',
        question:
            'What payment methods are accepted?',
        answer:
            'Available payment methods will be displayed during the checkout process.',
      ),
    ];
  }

  //--------------------------------------------------
  // Logout
  //--------------------------------------------------

  Future<void> logout() async {
    try {
      await _repository.logout();
    } finally {
      _user = null;
      _errorMessage = null;
      _isLoading = false;
      _isSaving = false;

      notifyListeners();
    }
  }

  //--------------------------------------------------
  // Delete Account
  //--------------------------------------------------

  Future<void> deleteAccount() async {
    try {
      setLoading(true);

      await _repository.deleteAccount();

      _user = null;
    } catch (_) {
      setError(
        'Failed to delete account.',
      );
    } finally {
      setLoading(false);
    }

    notifyListeners();
  }
}