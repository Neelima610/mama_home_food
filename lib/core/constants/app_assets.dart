
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

  static const String productPlaceholder =
      '$_images/product_placeholder.png';

  static const String profilePlaceholder =
      '$_images/profile_placeholder.png';

  // ==========================================================
  // Icons
  // ==========================================================

  static const String appIcon = '$_icons/app_icon.png';

  //==========================================================
// Product Images
//==========================================================

//--------------------------
// Veg Meals
//--------------------------

static const String vegMeals =
    '$_products/veg_meals_1.jpg';

static const List<String> vegMealsImages = [
  '$_products/veg_meals_1.jpg',
  '$_products/veg_meals_2.jpg',
  '$_products/veg_meals_3.jpg',
];

//--------------------------
// Mini Meals
//--------------------------

static const String miniMeals =
    '$_products/mini_meals_1.jpg';

static const List<String> miniMealsImages = [
  '$_products/mini_meals_1.jpg',
  '$_products/mini_meals_2.jpg',
];

//--------------------------
// Mango Pickle
//--------------------------

static const String mangoPickle =
    '$_products/mango_pickle_1.jpg';

static const List<String> mangoPickleImages = [
  '$_products/mango_pickle_1.jpg',
  '$_products/mango_pickle_2.jpg',
  '$_products/mango_pickle_3.jpg',
];

//--------------------------
// Gongura Pickle
//--------------------------

static const String gonguraPickle =
    '$_products/gongura_pickle_1.jpg';

static const List<String> gonguraPickleImages = [
  '$_products/gongura_pickle_1.jpg',
  '$_products/gongura_pickle_2.jpg',
];

//--------------------------
// Karam Podi
//--------------------------

static const String karamPodi =
    '$_products/karam_podi_1.jpg';

static const List<String> karamPodiImages = [
  '$_products/karam_podi_1.jpg',
  '$_products/karam_podi_2.jpg',
  '$_products/karam_podi_3.jpg',
];

//--------------------------
// Murukulu
//--------------------------

static const String murukulu =
    '$_products/murukulu_1.jpg';

static const List<String> murukuluImages = [
  '$_products/murukulu_1.jpg',
  '$_products/murukulu_2.jpg',
];

//--------------------------
// Boondi Laddu
//--------------------------

static const String boondiLaddu =
    '$_products/boondi_laddu_1.jpg';

static const List<String> boondiLadduImages = [
  '$_products/boondi_laddu_1.jpg',
  '$_products/boondi_laddu_2.jpg',
  '$_products/boondi_laddu_3.jpg',
];

//--------------------------
// Monthly Plan
//--------------------------

static const String monthlyPlan =
    '$_products/monthly_plan_1.jpg';

static const List<String> monthlyPlanImages = [
  '$_products/monthly_plan_1.jpg',
  '$_products/monthly_plan_2.jpg',
];

//--------------------------
// Birthday Catering
//--------------------------

static const String birthdayCatering =
    '$_products/birthday_catering_1.jpg';

static const List<String> birthdayCateringImages = [
  '$_products/birthday_catering_1.jpg',
  '$_products/birthday_catering_2.jpg',
];

  // ==========================================================
  // Animations
  // ==========================================================

  static const String loading = '$_animations/loading.json';
  static const String empty = '$_animations/empty.json';
  static const String success = '$_animations/success.json';
  static const String error = '$_animations/error.json';

  // ==========================================================
  // Payment Icons
  // ==========================================================

  static const String cod = '$_icons/payments/cod.png';
  static const String upi = '$_icons/payments/upi.png';
  static const String card = '$_icons/payments/card.png';
  static const String wallet = '$_icons/payments/wallet.png';
}