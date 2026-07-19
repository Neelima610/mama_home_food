

// reorder_button.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../shared/widgets/buttons/custom_button.dart';

class ReorderButton extends StatelessWidget {
  const ReorderButton({
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
          AppKeys.reorderButton,
        ),
        text: AppStrings.reorder,
        icon: Icons.shopping_cart_checkout_rounded,
        backgroundColor:
            AppColors.primary,
        foregroundColor:
            AppColors.white,
        onPressed: onPressed,
      ),
    );
  }
}