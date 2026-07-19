
import 'dart:math';

import '../../core/constants/constants.dart';
import '../../models/payment/payment_method_type.dart';
import '../../models/payment/payment_result_model.dart';
import '../../models/payment/payment_status.dart';

class PaymentRepository {
  PaymentRepository._();

  //--------------------------------------------------
  // Dummy Payment
  //--------------------------------------------------

  static Future<PaymentResultModel> makePayment({
    required double amount,
    required PaymentMethodType method,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    final success =
        Random().nextInt(100) < 90;

    final transactionId =
        success
            ? "TXN${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(9999)}"
            : "";

    return PaymentResultModel(
      status: success
          ? PaymentStatus.success
          : PaymentStatus.failed,
      transactionId: transactionId,
      amount: amount,
      method: method,
      message: success
          ? AppStrings.paymentCompletedSuccessfully
          : AppStrings.paymentFailed,
    );
  }
}