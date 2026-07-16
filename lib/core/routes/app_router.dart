
// app_router.dart
import 'package:flutter/material.dart';
import 'package:mama_home_food/features/splash/screens/splash_screen.dart';

import '../../features/authentication/screens/otp_screen.dart';
import '../../features/checkout/screens/checkout_screen.dart';
import '../../features/orders/screens/order_details_screen.dart';
import '../../features/orders/screens/orders_screen.dart';
import '../../features/product/screens/product_screen.dart';
import '../../models/category/category_model.dart';
import '../../features/category/screens/category_screen.dart';
// import '../../screens/home/home_screen.dart';
import '../../features/navigation/screens/navigation_screen.dart';
import '../../models/order/order_model.dart';
import '../../models/product/product_model.dart';
import 'route_names.dart';


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

      case RouteNames.cart:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Cart'),
        );

      case RouteNames.login:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Login'),
        );

      case RouteNames.otp:
        return _buildRoute(
          const OtpScreen(),
        );

      case RouteNames.profile:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Profile'),
        );

      case RouteNames.address:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Address'),
        );

      case RouteNames.checkout:
        return _buildRoute(
           const CheckoutScreen(),
        );

      case RouteNames.payment:
        return _buildRoute(
          const _PlaceholderScreen(title: 'Payment'),
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

