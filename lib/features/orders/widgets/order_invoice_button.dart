

// order_invoice_button.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/custom_button.dart';

class OrderInvoiceButton extends StatelessWidget {
  const OrderInvoiceButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.buttonWidth,
      child: CustomButton(
        key: const ValueKey(
          AppKeys.orderInvoiceButton,
        ),
        text: AppStrings.downloadInvoice,
        icon: Icons.receipt_long_outlined,
        onPressed: onPressed,
      ),
    );
  }
}