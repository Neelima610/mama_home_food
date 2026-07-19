// payment_method_model.dart

import 'payment_method_type.dart';

class PaymentMethodModel {
  const PaymentMethodModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.recommended = false,
    this.enabled = true,
  });

  final PaymentMethodType type;

  final String title;

  final String subtitle;

  final String icon;

  final bool recommended;

  final bool enabled;

  PaymentMethodModel copyWith({
    PaymentMethodType? type,
    String? title,
    String? subtitle,
    String? icon,
    bool? recommended,
    bool? enabled,
  }) {
    return PaymentMethodModel(
      type: type ?? this.type,
      title: title ?? this.title,
      subtitle:
          subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
      recommended:
          recommended ??
              this.recommended,
      enabled:
          enabled ?? this.enabled,
    );
  }
}