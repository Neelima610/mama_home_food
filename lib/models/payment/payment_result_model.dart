import 'payment_method_type.dart';
import 'payment_status.dart';

class PaymentResultModel {
  const PaymentResultModel({
    required this.status,
    required this.transactionId,
    required this.amount,
    required this.method,
    required this.message,
  });

  final PaymentStatus status;

  final String transactionId;

  final double amount;

  final PaymentMethodType method;

  final String message;

  bool get isSuccess =>
      status == PaymentStatus.success;

  bool get isFailed =>
      status == PaymentStatus.failed;

  bool get isPending =>
      status == PaymentStatus.pending;

  PaymentResultModel copyWith({
    PaymentStatus? status,
    String? transactionId,
    double? amount,
    PaymentMethodType? method,
    String? message,
  }) {
    return PaymentResultModel(
      status: status ?? this.status,
      transactionId:
          transactionId ??
              this.transactionId,
      amount: amount ?? this.amount,
      method: method ?? this.method,
      message: message ?? this.message,
    );
  }
}