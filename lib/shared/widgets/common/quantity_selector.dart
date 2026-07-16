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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Quantity",
          style: AppTextStyles.titleMedium,
        ),

        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(
              AppSizes.radiusLarge,
            ),
            border: Border.all(
              color: AppColors.divider,
            ),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: quantity > 1
                    ? onDecrease
                    : null,
                icon: const Icon(Icons.remove),
              ),

              SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    quantity.toString(),
                    style: AppTextStyles.titleMedium,
                  ),
                ),
              ),

              IconButton(
                onPressed: onIncrease,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}