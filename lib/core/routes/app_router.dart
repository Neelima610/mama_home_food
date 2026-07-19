
// app_router.dart
import 'package:flutter/material.dart';
import 'package:mama_home_food/features/splash/screens/splash_screen.dart';

import '../../features/address/screens/add_edit_address_screen.dart';
import '../../features/address/screens/address_screen.dart';
import '../../features/address/screens/address_selection_screen.dart';
import '../../features/authentication/screens/otp_screen.dart';
import '../../features/checkout/screens/checkout_screen.dart';
import '../../features/favorites/screens/favorites_screen.dart';
import '../../features/orders/screens/order_details_screen.dart';
import '../../features/authentication/screens/forgot_password_screen.dart';
import '../../features/authentication/screens/login_screen.dart';
import '../../features/authentication/screens/signup_screen.dart';
import '../../features/orders/screens/order_tracking_screen.dart';
import '../../features/orders/screens/orders_screen.dart';
import '../../features/payment/screens/payment_failed_screen.dart';
import '../../features/payment/screens/payment_screen.dart';
import '../../features/payment/screens/payment_success_screen.dart';
import '../../features/product/screens/product_screen.dart';
import '../../features/profile/screens/notification_settings_screen.dart';
import '../../models/address/address_model.dart';
import '../../models/category/category_model.dart';
import '../../features/category/screens/category_screen.dart';
// Product Screens

import '../../features/product/screens/product_details_screen.dart';
import '../../features/product/screens/product_reviews_screen.dart';
import '../../features/product/screens/write_review_screen.dart';
import '../../features/product/screens/product_gallery_screen.dart';
import '../../features/product/screens/similar_products_screen.dart';
// import '../../screens/home/home_screen.dart';
import '../../features/navigation/screens/navigation_screen.dart';
import '../../models/order/order_model.dart';
import '../../models/product/product_model.dart';
import 'route_names.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/settings_screen.dart';
import '../../features/profile/screens/about_screen.dart';
import '../../features/profile/screens/help_support_screen.dart';
import '../../features/profile/screens/privacy_policy_screen.dart';
import '../../features/profile/screens/terms_conditions_screen.dart';
import '../../features/profile/screens/contact_us_screen.dart';
import '../../features/profile/screens/faq_screen.dart';
import '../../features/profile/screens/language_screen.dart';
import '../../features/profile/screens/refer_earn_screen.dart';

/// Centralized route management for the application.
class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _buildRoute(
          const SplashScreen(),
        );

      case RouteNames.home:
        return _buildRoute(
           const NavigationScreen(),
        );

      case RouteNames.category:
        if (settings.arguments is! CategoryModel) {
  return _buildRoute(const _PageNotFound());
}

final category = settings.arguments as CategoryModel;

  return _buildRoute(
    CategoryScreen(
      category: category,
    ),
  );

      case RouteNames.product:
      if (settings.arguments is! ProductModel) {
  return _buildRoute(const _PageNotFound());
}
        final product =
      settings.arguments as ProductModel;

  return _buildRoute(
    ProductScreen(
      product: product,
    ),
  );
  //==================================================
// Product Details
//==================================================

case RouteNames.productDetails:
  if (settings.arguments is! ProductModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final product =
      settings.arguments as ProductModel;

  return _buildRoute(
    ProductDetailsScreen(
      product: product,
    ),
  );

//==================================================
// Product Reviews
//==================================================

case RouteNames.productReviews:
  if (settings.arguments is! ProductModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final product =
      settings.arguments as ProductModel;

  return _buildRoute(
    ProductReviewsScreen(
      product: product,
    ),
  );

//==================================================
// Write Review
//==================================================

case RouteNames.writeReview:
  if (settings.arguments is! ProductModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final product =
      settings.arguments as ProductModel;

  return _buildRoute(
    WriteReviewScreen(
      product: product,
    ),
  );

//==================================================
// Product Gallery
//==================================================

case RouteNames.productGallery:
  if (settings.arguments is! ProductModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final product =
      settings.arguments as ProductModel;

  return _buildRoute(
    ProductGalleryScreen(
      product: product,
    ),
  );

//==================================================
// Similar Products
//==================================================

case RouteNames.similarProducts:
  if (settings.arguments is! ProductModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final product =
      settings.arguments as ProductModel;

  return _buildRoute(
    SimilarProductsScreen(
      product: product,
    ),
  );

      case RouteNames.cart:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Cart'),
        );

     //==================================================
// Authentication
//==================================================

case RouteNames.login:
  return _buildRoute(
    const LoginScreen(),
  );

case RouteNames.signup:
  return _buildRoute(
    const SignupScreen(),
  );

case RouteNames.otp:
  return _buildRoute(
    const OtpScreen(),
  );

case RouteNames.forgotPassword:
  return _buildRoute(
    const ForgotPasswordScreen(),
  );
      case RouteNames.profile:
  return _buildRoute(
    const ProfileScreen(),
  );

case RouteNames.editProfile:
  return _buildRoute(
    const EditProfileScreen(),
  );

case RouteNames.settings:
  return _buildRoute(
    const SettingsScreen(),
  );

case RouteNames.about:
  return _buildRoute(
    const AboutScreen(),
  );

case RouteNames.helpSupport:
  return _buildRoute(
    const HelpSupportScreen(),
  );

case RouteNames.privacyPolicy:
  return _buildRoute(
    const PrivacyPolicyScreen(),
  );

case RouteNames.termsConditions:
  return _buildRoute(
    const TermsConditionsScreen(),
  );
 case RouteNames.contactUs:
  return _buildRoute(
    const ContactUsScreen(),
  );

case RouteNames.faq:
  return _buildRoute(
    const FaqScreen(),
  );

case RouteNames.language:
  return _buildRoute(
    const LanguageScreen(),
  );

case RouteNames.notificationSettings:
  return _buildRoute(
    const NotificationsSettingsScreen(),
  );

case RouteNames.referEarn:
  return _buildRoute(
    const ReferEarnScreen(),
  );
      case RouteNames.favorites:
  return _buildRoute(
    const FavoritesScreen(),
  );
  

   //==================================================
    // payment
    //==================================================


  case RouteNames.payment:
  if (settings.arguments is! double) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final total =
      settings.arguments as double;

  return _buildRoute(
    PaymentScreen(
      total: total,
    ),
  );

case RouteNames.paymentSuccess:
  if (settings.arguments is! String) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final transactionId =
      settings.arguments as String;

  return _buildRoute(
    PaymentSuccessScreen(
      transactionId: transactionId,
    ),
  );

case RouteNames.paymentFailed:
  return _buildRoute(
    const PaymentFailedScreen(),
  );

      //==================================================
    // Address
    //==================================================

    case RouteNames.myAddresses:
      return MaterialPageRoute(
        builder: (_) =>
            const AddressScreen(),
      );

    case RouteNames.addAddress:
      return MaterialPageRoute(
        builder: (_) =>
            const AddEditAddressScreen(),
      );

    case RouteNames.editAddress:
      final address =
          settings.arguments
              as AddressModel;

      return MaterialPageRoute(
        builder: (_) =>
            AddEditAddressScreen(
          address: address,
        ),
      );
      case RouteNames.addressSelection:

  return MaterialPageRoute(
    builder: (_) =>
        const AddressSelectionScreen(),
  );

    //==================================================

      case RouteNames.checkout:
        return _buildRoute(
           const CheckoutScreen(),
        );


      case RouteNames.orders:
        return _buildRoute(
          const OrdersScreen(),
        );
       case RouteNames.orderDetails:
  if (settings.arguments is! OrderModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final order =
      settings.arguments as OrderModel;

  return _buildRoute(
    OrderDetailsScreen(
      order: order,
    ),
  );

 
   case RouteNames.orderTracking:
  if (settings.arguments is! OrderModel) {
    return _buildRoute(
      const _PageNotFound(),
    );
  }

  final order =
      settings.arguments as OrderModel;

  return _buildRoute(
    OrderTrackingScreen(
      order: order,
    ),
  ); 

      case RouteNames.navigation:
  return _buildRoute(
    const NavigationScreen(),
  );

      case RouteNames.orderHistory:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Order History'),
        );

      case RouteNames.adminDashboard:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Admin Dashboard'),
        );

      case RouteNames.addProduct:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Add Product'),
        );

      case RouteNames.editProduct:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Edit Product'),
        );

      case RouteNames.manageOrders:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Manage Orders'),
        );

      default:
        return _buildRoute(
          const _PageNotFound(),
        );
    }
  }

  static MaterialPageRoute _buildRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}

/// Temporary placeholder screen.
///
/// We'll replace these with the real screens as we build the app.
class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

/// Screen shown when an unknown route is requested.
class _PageNotFound extends StatelessWidget {
  const _PageNotFound();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404\nPage Not Found',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

