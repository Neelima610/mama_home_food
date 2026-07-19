// transaction_model.dart

import 'payment_method_type.dart';
import 'payment_status.dart';

class TransactionModel {
  const TransactionModel({
    required this.id,
    required this.orderId,
    required this.amount,
    required this.method,
    required this.status,
    required this.createdAt,
  });

  final String id;

  final String orderId;

  final double amount;

  final PaymentMethodType method;

  final PaymentStatus status;

  final DateTime createdAt;

  TransactionModel copyWith({
    String? id,
    String? orderId,
    double? amount,
    PaymentMethodType? method,
    PaymentStatus? status,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      orderId:
          orderId ?? this.orderId,
      amount:
          amount ?? this.amount,
      method:
          method ?? this.method,
      status:
          status ?? this.status,
      createdAt:
          createdAt ??
              this.createdAt,
    );
  }
}