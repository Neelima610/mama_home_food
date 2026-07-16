// app_assets.dart
/// Centralized asset paths used throughout the application.
///
/// Never hardcode asset paths in widgets.
/// Always use AppAssets.
class AppAssets {
  AppAssets._();

  // ==========================================================
  // Base Paths
  // ==========================================================

  static const String _images = 'assets/images';
  static const String _icons = 'assets/icons';
  static const String _logo = 'assets/logo';
  static const String _banners = 'assets/banners';
  static const String _categories = 'assets/categories';
  static const String _products = 'assets/products';
  static const String _animations = 'assets/animations';

  // ==========================================================
  // Logo
  // ==========================================================

  static const String appLogo = '$_logo/app_logo.png';

  // ==========================================================
  // Banners
  // ==========================================================

  static const String banner1 = '$_banners/banner_1.jpg';
  static const String banner2 = '$_banners/banner_2.jpg';
  static const String banner3 = '$_banners/banner_3.jpg';

  // ==========================================================
  // Categories
  // ==========================================================

  static const String lunchBox = '$_categories/lunch_box.png';
  static const String pickles = '$_categories/pickles.png';
  static const String podi = '$_categories/podi.png';
  static const String snacks = '$_categories/snacks.png';
  static const String sweets = '$_categories/sweets.png';
  static const String subscription = '$_categories/subscription.png';
  static const String catering = '$_categories/catering.png';

  // ==========================================================
  // Placeholder Images
  // ==========================================================

  static const String productPlaceholder = '$_images/product_placeholder.png';

  static const String profilePlaceholder = '$_images/profile_placeholder.png';

  // ==========================================================
  // Icons
  // ==========================================================

  static const String appIcon = '$_icons/app_icon.png';

  // ==========================================================
  // Product Images
  // ==========================================================

  static const String sampleProduct = '$_products/sample_product.jpg';

  static const String vegMeals = '$_products/veg_meals.png';

  static const String miniMeals = '$_products/mini_meals.png';

  static const String mangoPickle = '$_products/mango_pickle.png';

  static const String gonguraPickle = '$_products/gongura_pickle.png';

  static const String karamPodi = '$_products/karam_podi.png';

  static const String murukulu = '$_products/murukulu.png';

  static const String boondiLaddu = '$_products/boondi_laddu.png';

  static const String monthlyPlan = '$_products/monthly_plan.png';

  static const String birthdayCatering = '$_products/birthday_catering.png';

  // ==========================================================
  // Animations
  // ==========================================================

  static const String loading = '$_animations/loading.json';

  static const String empty = '$_animations/empty.json';

  static const String success = '$_animations/success.json';

  static const String error = '$_animations/error.json';
}
