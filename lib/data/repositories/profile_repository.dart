import '../../../models/user/user_model.dart';
import '../../../features/profile/models/faq_model.dart';

class ProfileRepository {
  const ProfileRepository();

  //--------------------------------------------------
// FAQ
//--------------------------------------------------

static const List<FaqModel> _faqs = [
  FaqModel(
    id: '1',
    question: 'How can I place an order?',
    answer:
        'Browse our homemade food items, select the product you want, add it to your cart, and proceed to checkout.',
  ),

  FaqModel(
    id: '2',
    question: 'Do you provide home delivery?',
    answer:
        'Yes, we provide home delivery based on the available delivery locations and applicable delivery charges.',
  ),

  FaqModel(
    id: '3',
    question: 'Can I cancel my order?',
    answer:
        'Order cancellation depends on the preparation status of your order. Please contact us as soon as possible if you want to cancel an order.',
  ),

  FaqModel(
    id: '4',
    question: 'Do you accept custom food orders?',
    answer:
        'Yes, we accept custom and bulk food orders based on availability and advance notice.',
  ),

  FaqModel(
    id: '5',
    question: 'How can I contact Mama Home Food?',
    answer:
        'You can contact us through the Contact Us section in the app.',
  ),
];

  //--------------------------------------------------
  // Dummy Database
  //--------------------------------------------------

  static UserModel _user = const UserModel(
    id: '1',
    firstName: 'Neelima',
    lastName: 'Sanati',
    email: 'neelima@example.com',
    phoneNumber: '9876543210',
    profileImage: null,
    dateOfBirth: null,
    gender: null,
    referralCode: null,
    isEmailVerified: true,
    isPhoneVerified: true,
    isActive: true,
    createdAt: null,
    updatedAt: null,
  );

  //--------------------------------------------------
  // Get Profile
  //--------------------------------------------------

  Future<UserModel> getProfile() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return _user;
  }

  //--------------------------------------------------
  // Update Profile
  //--------------------------------------------------

  Future<UserModel> updateProfile(
    UserModel user,
  ) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    _user = user.copyWith(
      updatedAt: DateTime.now(),
    );

    return _user;
  }

  //--------------------------------------------------
  // Update Profile Image
  //--------------------------------------------------

  Future<String> updateProfileImage(
    String imageUrl,
  ) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    _user = _user.copyWith(
      profileImage: imageUrl,
      updatedAt: DateTime.now(),
    );

    return imageUrl;
  }

  //--------------------------------------------------
  // Delete Account
  //--------------------------------------------------

  Future<void> deleteAccount() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    _user = const UserModel(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
    );
  }

  //--------------------------------------------------
  // Logout
  //--------------------------------------------------

  Future<void> logout() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    
  }

  //--------------------------------------------------
// Get FAQs
//--------------------------------------------------

Future<List<FaqModel>> getFaqs() async {
  await Future.delayed(
    const Duration(milliseconds: 500),
  );

  return List.unmodifiable(
    _faqs,
  );
}
}