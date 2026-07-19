


import '../../../core/constants/constants.dart';

class CartCalculator {
  CartCalculator._();

  //--------------------------------------------------
  // Delivery Charge
  //--------------------------------------------------

  static double deliveryCharge(
    double subtotal,
  ) {
    return subtotal >=
            AppNumbers.freeDeliveryLimit
        ? 0
        : AppNumbers.deliveryCharge;
  }

  //--------------------------------------------------
  // Discount
  //--------------------------------------------------

  static double discount(
    double subtotal,
  ) {
    return subtotal >=
            AppNumbers.discountLimit
        ? AppNumbers.discountAmount
        : 0;
  }

  //--------------------------------------------------
  // Grand Total
  //--------------------------------------------------

  static double grandTotal(
    double subtotal,
  ) {
    return subtotal +
        deliveryCharge(subtotal) -
        discount(subtotal);
  }

  //--------------------------------------------------
  // Free Delivery Available
  //--------------------------------------------------

  static bool hasFreeDelivery(
    double subtotal,
  ) {
    return subtotal >=
        AppNumbers.freeDeliveryLimit;
  }

  //--------------------------------------------------
  // Discount Applied
  //--------------------------------------------------

  static bool hasDiscount(
    double subtotal,
  ) {
    return subtotal >=
        AppNumbers.discountLimit;
  }

  //--------------------------------------------------
  // Remaining Amount for Free Delivery
  //--------------------------------------------------

  static double remainingForFreeDelivery(
    double subtotal,
  ) {
    final remaining =
        AppNumbers.freeDeliveryLimit -
            subtotal;

    return remaining <= 0
        ? 0
        : remaining;
  }

  //--------------------------------------------------
  // Delivery Message
  //--------------------------------------------------

  static String freeDeliveryMessage(
    double subtotal,
  ) {
    if (hasFreeDelivery(subtotal)) {
      return AppStrings.freeDeliveryUnlocked;
    }

    return "Add ${AppConstants.currencySymbol}${remainingForFreeDelivery(subtotal).toStringAsFixed(0)} more to get FREE Delivery";
  }

  //--------------------------------------------------
  // Discount Message
  //--------------------------------------------------

  static String discountMessage(
    double subtotal,
  ) {
    if (hasDiscount(subtotal)) {
      return AppStrings.discountApplied;
    }

    final remaining =
        AppNumbers.discountLimit -
            subtotal;

    return "Shop ${AppConstants.currencySymbol}${remaining.toStringAsFixed(0)} more to get ₹${AppNumbers.discountAmount.toStringAsFixed(0)} OFF";
  }
}