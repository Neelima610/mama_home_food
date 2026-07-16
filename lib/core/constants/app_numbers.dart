/// Numeric constants used throughout the application.
///
/// These are NOT UI sizes.
/// UI sizes belong in AppSizes.
class AppNumbers {
  AppNumbers._();

  //==========================================================
  // Product
  //==========================================================

  static const int maxCartQuantity = 10;
  static const int minCartQuantity = 1;

  //==========================================================
  // Ratings
  //==========================================================

  static const double minRating = 0.0;
  static const double maxRating = 5.0;
  static const double defaultRating = 4.5;

  //==========================================================
  // Discounts
  //==========================================================

  static const int defaultDiscount = 10;

  //==========================================================
  // Delivery
  //==========================================================

  static const double freeDeliveryAmount = 499.0;

  static const double defaultDeliveryCharge = 40.0;

  //==========================================================
  // Tax
  //==========================================================

  static const double gstPercentage = 5.0;

  //==========================================================
  // Pagination
  //==========================================================

  static const int pageSize = 10;

  //==========================================================
  // Search
  //==========================================================

  static const int recentSearchLimit = 10;

  //==========================================================
  // Banner
  //==========================================================

  static const int bannerCount = 5;

  //==========================================================
  // Coupon
  //==========================================================

  static const int maxCouponLength = 15;

  //==========================================================
  // OTP
  //==========================================================

  static const int otpLength = 6;
}