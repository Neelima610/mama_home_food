
// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/routes/route_names.dart';
import 'core/theme/themes.dart';
import 'features/address/providers/address_provider.dart';
import 'features/authentication/providers/auth_provider.dart';
import 'features/cart/providers/cart_provider.dart';
import 'features/category/providers/category_provider.dart';
import 'features/checkout/providers/checkout_provider.dart';
import 'features/favorites/providers/favorites_provider.dart';
import 'features/payment/providers/payment_provider.dart';
import 'features/product/providers/product_provider.dart';
import 'features/profile/providers/profile_provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider()..loadCategories(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider()..loadCart(),
        ),
        ChangeNotifierProvider(
  create: (_) => CheckoutProvider(),
),
ChangeNotifierProvider(
  create: (_) => AuthProvider(),
),
ChangeNotifierProvider(
  create: (_) => FavoritesProvider(),
),
ChangeNotifierProvider(
  create: (_) => ProfileProvider(),
),
ChangeNotifierProvider(
  create: (_) => AddressProvider(),
),
ChangeNotifierProvider(
  create: (_) => PaymentProvider(),
),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Mama Home Food',

      theme: AppTheme.lightTheme,


      initialRoute: RouteNames.splash,

      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}