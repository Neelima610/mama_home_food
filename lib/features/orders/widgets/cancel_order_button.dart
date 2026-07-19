

// cancel_order_button.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/custom_button.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
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
          AppKeys.cancelOrderButton,
        ),
        text: AppStrings.cancelOrder,
        icon: Icons.cancel_outlined,
        backgroundColor:
            AppColors.error,
        foregroundColor:
            AppColors.white,
        onPressed: onPressed,
      ),
    );
  }
}