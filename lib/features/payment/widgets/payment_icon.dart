import 'package:flutter/material.dart';

class PaymentIcon extends StatelessWidget {
  const PaymentIcon({
    super.key,
    required this.icon,
    this.size = 32,
  });

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}