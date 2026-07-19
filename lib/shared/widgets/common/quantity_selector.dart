// quantity_selector.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        border: Border.all(
          color: AppColors.divider,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //--------------------------------------------------
          // Decrease
          //--------------------------------------------------

          InkWell(
            onTap: quantity > 1 ? onDecrease : null,
            borderRadius: BorderRadius.circular(
              AppSizes.radiusL,
            ),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.remove,
                color: quantity > 1
                    ? AppColors.primary
                    : AppColors.grey,
              ),
            ),
          ),

          //--------------------------------------------------
          // Quantity
          //--------------------------------------------------

          SizedBox(
            width: 36,
            child: Center(
              child: Text(
                quantity.toString(),
                style: AppTextStyles.titleMedium,
              ),
            ),
          ),

          //--------------------------------------------------
          // Increase
          //--------------------------------------------------

          InkWell(
            onTap: onIncrease,
            borderRadius: BorderRadius.circular(
              AppSizes.radiusL,
            ),
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.add,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}