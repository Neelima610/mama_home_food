import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../models/payment/payment_method_model.dart';
import '../../../models/payment/payment_method_type.dart';
import '../../../models/payment/payment_status.dart';


class PaymentHelper {
  const PaymentHelper._();

  //--------------------------------------------------
  // Payment Methods
  //--------------------------------------------------

  static List<PaymentMethodModel>
      paymentMethods = [
    PaymentMethodModel(
      type: PaymentMethodType.upi,
      title: AppStrings.upi,
      subtitle:
          AppStrings.upiDescription,
      icon: AppAssets.upi,
      recommended: true,
    ),

    PaymentMethodModel(
      type: PaymentMethodType.card,
      title: AppStrings.card,
      subtitle:
          AppStrings.cardDescription,
      icon: AppAssets.card,
    ),

    PaymentMethodModel(
      type: PaymentMethodType.wallet,
      title: AppStrings.wallet,
      subtitle:
          AppStrings.walletDescription,
      icon: AppAssets.wallet,
    ),

    PaymentMethodModel(
      type:
          PaymentMethodType.cashOnDelivery,
      title:
          AppStrings.cashOnDelivery,
      subtitle:
          AppStrings.codDescription,
      icon: AppAssets.cod,
    ),
  ];

  //--------------------------------------------------
  // Wallets
  //--------------------------------------------------

  static const List<String> wallets = [
    AppStrings.phonePe,
    AppStrings.googlePay,
    AppStrings.paytm,
  ];

  //--------------------------------------------------
  // Payment Title
  //--------------------------------------------------

  static String getTitle(
    PaymentMethodType type,
  ) {
    switch (type) {
      case PaymentMethodType.upi:
        return AppStrings.upi;

      case PaymentMethodType.card:
        return AppStrings.card;

      case PaymentMethodType.wallet:
        return AppStrings.wallet;

      case PaymentMethodType
          .cashOnDelivery:
        return AppStrings.cashOnDelivery;
    }
  }

  //--------------------------------------------------
  // Payment Subtitle
  //--------------------------------------------------

  static String getSubtitle(
    PaymentMethodType type,
  ) {
    switch (type) {
      case PaymentMethodType.upi:
        return AppStrings.upiDescription;

      case PaymentMethodType.card:
        return AppStrings.cardDescription;

      case PaymentMethodType.wallet:
        return AppStrings.walletDescription;

      case PaymentMethodType
          .cashOnDelivery:
        return AppStrings.codDescription;
    }
  }

  //--------------------------------------------------
  // Payment Icon
  //--------------------------------------------------

  static String getIcon(
    PaymentMethodType type,
  ) {
    switch (type) {
      case PaymentMethodType.upi:
        return AppAssets.upi;

      case PaymentMethodType.card:
        return AppAssets.card;

      case PaymentMethodType.wallet:
        return AppAssets.wallet;

      case PaymentMethodType
          .cashOnDelivery:
        return AppAssets.cod;
    }
  }

  //--------------------------------------------------
  // Recommended
  //--------------------------------------------------

  static bool isRecommended(
    PaymentMethodType type,
  ) {
    return type ==
        PaymentMethodType.upi;
  }

  //--------------------------------------------------
  // Payment Color
  //--------------------------------------------------

  static Color getColor(
    PaymentMethodType type,
  ) {
    switch (type) {
      case PaymentMethodType.upi:
        return AppColors.primary;

      case PaymentMethodType.card:
        return AppColors.secondary;

      case PaymentMethodType.wallet:
        return AppColors.accent;

      case PaymentMethodType
          .cashOnDelivery:
        return AppColors.success;
    }
  }


  //--------------------------------------------------
// Payment Method Title
//--------------------------------------------------

static String getMethodTitle(
  PaymentMethodType type,
) {
  return getTitle(type);
}

//--------------------------------------------------
// Payment Status Title
//--------------------------------------------------

static String getStatusTitle(
  PaymentStatus status,
) {
  switch (status) {
    case PaymentStatus.pending:
      return AppStrings.pending;

    case PaymentStatus.success:
      return AppStrings.success;

    case PaymentStatus.failed:
      return AppStrings.failed;
  }
}

//--------------------------------------------------
// Payment Status Color
//--------------------------------------------------

static Color getStatusColor(
  PaymentStatus status,
) {
  switch (status) {
    case PaymentStatus.pending:
      return AppColors.warning;

    case PaymentStatus.success:
      return AppColors.success;

    case PaymentStatus.failed:
      return AppColors.error;
  }
}

//--------------------------------------------------
// Payment Success
//--------------------------------------------------

static bool isSuccess(
  PaymentStatus status,
) {
  return status ==
      PaymentStatus.success;
}

//--------------------------------------------------
// Payment Failed
//--------------------------------------------------

static bool isFailed(
  PaymentStatus status,
) {
  return status ==
      PaymentStatus.failed;
}

//--------------------------------------------------
// Payment Pending
//--------------------------------------------------

static bool isPending(
  PaymentStatus status,
) {
  return status ==
      PaymentStatus.pending;
}
}