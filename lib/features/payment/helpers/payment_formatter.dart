import '../../../core/constants/constants.dart';

class PaymentFormatter {
  const PaymentFormatter._();

  //--------------------------------------------------
  // Card Number
  //--------------------------------------------------

  static String formatCardNumber(
    String value,
  ) {
    final digits = value.replaceAll(
      AppStrings.space,
      AppStrings.empty,
    );

    final buffer = StringBuffer();

    for (
      int i = 0;
      i < digits.length;
      i++
    ) {
      if (i > 0 &&
          i % 4 == 0) {
        buffer.write(
          AppStrings.space,
        );
      }

      buffer.write(
        digits[i],
      );
    }

    return buffer.toString();
  }

  //--------------------------------------------------
  // Expiry Date
  //--------------------------------------------------

  static String formatExpiryDate(
    String value,
  ) {
    final digits = value.replaceAll(
      AppStrings.forwardSlash,
      AppStrings.empty,
    );

    if (digits.length <= 2) {
      return digits;
    }

    return '${digits.substring(0, 2)}${AppStrings.forwardSlash}${digits.substring(2)}';
  }

  //--------------------------------------------------
  // Card Number (Masked)
  //--------------------------------------------------

  static String maskCardNumber(
    String value,
  ) {
    final digits = value.replaceAll(
      AppStrings.space,
      AppStrings.empty,
    );

    if (digits.length < 4) {
      return digits;
    }

    return '${AppStrings.cardMask}${digits.substring(digits.length - 4)}';
  }

  //--------------------------------------------------
  // UPI ID
  //--------------------------------------------------

  static String formatUpiId(
    String value,
  ) {
    return value.trim().toLowerCase();
  }

  //--------------------------------------------------
// Amount
//--------------------------------------------------

static String formatAmount(
  double amount,
) {
  return '${AppConstants.currencySymbol}${amount.toStringAsFixed(2)}';
}

//--------------------------------------------------
// Transaction ID
//--------------------------------------------------

static String formatTransactionId(
  String transactionId,
) {
  if (transactionId.isEmpty) {
    return AppStrings.notAvailable;
  }

  return transactionId;
}

//--------------------------------------------------
// Coupon Code
//--------------------------------------------------

static String formatCoupon(
  String? coupon,
) {
  if (coupon == null ||
      coupon.trim().isEmpty) {
    return AppStrings.notAvailable;
  }

  return coupon.toUpperCase();
}

//--------------------------------------------------
// Wallet Name
//--------------------------------------------------

static String formatWallet(
  String wallet,
) {
  return wallet.trim();
}
}