import '../../../core/constants/constants.dart';
import '../../../models/payment/payment_method_type.dart';
import '../../../models/payment/payment_status.dart';


class PaymentValidator {
  const PaymentValidator._();

  //--------------------------------------------------
  // Can Proceed
  //--------------------------------------------------

  static bool canProceed({
    required PaymentMethodType? method,
    String? cardNumber,
    String? expiryDate,
    String? cvv,
    String? upiId,
    String? wallet,
  }) {
    if (method == null) {
      return false;
    }

    switch (method) {
      case PaymentMethodType.cashOnDelivery:
        return true;

      case PaymentMethodType.upi:
        return isValidUpi(
          upiId ?? AppStrings.empty,
        );

      case PaymentMethodType.card:
        return isValidCardNumber(
              cardNumber ?? AppStrings.empty,
            ) &&
            isValidExpiryDate(
              expiryDate ?? AppStrings.empty,
            ) &&
            isValidCvv(
              cvv ?? AppStrings.empty,
            );

      case PaymentMethodType.wallet:
        return isValidWallet(
          wallet ?? AppStrings.empty,
        );
    }
  }

  //--------------------------------------------------
  // Card Number
  //--------------------------------------------------

  static bool isValidCardNumber(
    String value,
  ) {
    final number = value.replaceAll(
      AppStrings.space,
      AppStrings.empty,
    );

    return AppRegex.cardNumber.hasMatch(
      number,
    );
  }

  //--------------------------------------------------
  // Expiry Date
  //--------------------------------------------------

  static bool isValidExpiryDate(
    String value,
  ) {
    return AppRegex.expiryDate.hasMatch(
      value.trim(),
    );
  }

  //--------------------------------------------------
  // CVV
  //--------------------------------------------------

  static bool isValidCvv(
    String value,
  ) {
    return AppRegex.cvv.hasMatch(
      value.trim(),
    );
  }

  //--------------------------------------------------
  // UPI ID
  //--------------------------------------------------

  static bool isValidUpi(
    String value,
  ) {
    return AppRegex.upiId.hasMatch(
      value.trim(),
    );
  }

  //--------------------------------------------------
  // Wallet
  //--------------------------------------------------

  static bool isValidWallet(
    String value,
  ) {
    return value.trim().isNotEmpty;
  }

    //--------------------------------------------------
  // Validate Transaction Id
  //--------------------------------------------------

  static bool isValidTransactionId(
    String value,
  ) {
    return value.trim().isNotEmpty;
  }

  //--------------------------------------------------
  // Validate Coupon
  //--------------------------------------------------

  static bool isValidCoupon(
    String? value,
  ) {
    if (value == null) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  //--------------------------------------------------
  // Validate Payment Status
  //--------------------------------------------------

  static bool isPaymentCompleted(
    PaymentStatus status,
  ) {
    return status ==
        PaymentStatus.success;
  }

  //--------------------------------------------------
  // Validate Payment Failed
  //--------------------------------------------------

  static bool isPaymentFailed(
    PaymentStatus status,
  ) {
    return status ==
        PaymentStatus.failed;
  }

  //--------------------------------------------------
  // Validate Payment Pending
  //--------------------------------------------------

  static bool isPaymentPending(
    PaymentStatus status,
  ) {
    return status ==
        PaymentStatus.pending;
  }
}