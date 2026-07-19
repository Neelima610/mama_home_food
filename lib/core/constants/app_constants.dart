
// app_constants.dart
/// Application-wide business constants.
///
/// This file should contain information related to the application
/// itself, not UI values like padding or border radius.
class AppConstants {
  AppConstants._();

  // ==========================================================
  // App Information
  // ==========================================================

  static const String appName = 'Mama Home Food';

  static const String businessType = 'Homemade Food | Cloud Kitchen';

  static const String version = '1.0.0';

  // ==========================================================
  // Contact Information
  // ==========================================================
static const String userName = 'Neelima';
  static const String phonePrimary = '7780307148';

  static const String phoneSecondary = '9000769978';

  static const String email = 'sweethomefood106@gmail.com';

  // ==========================================================
  // Business Locations
  // ==========================================================

  static const String hyderabad = 'Hyderabad';

  static const String visakhapatnam = 'Visakhapatnam';

  static const String vijayawada = 'Vijayawada';

  // ==========================================================
  // Currency
  // ==========================================================

  static const String currencySymbol = '₹';

  // ==========================================================
  // Default Values
  // ==========================================================

  static const int otpLength = 6;
//--------------------------------------------------
// Currency
//--------------------------------------------------


static const String currencyCode = "INR";


//--------------------------------------------------
// Payment
//--------------------------------------------------

static const String phonePePackage =
    "com.phonepe.app";

static const String googlePayPackage =
    "com.google.android.apps.nbu.paisa.user";

static const String paytmPackage =
    "net.one97.paytm";

    static const String orderPrefix = "ORD";

}
