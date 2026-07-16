import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../helpers/order_helper.dart';

class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({
    super.key,
    required this.status,
  });

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final color =
        OrderHelper.getStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceM,
        vertical: AppSizes.spaceXS,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            OrderHelper.getStatusIcon(
              status,
            ),
            size: AppSizes.iconSmall,
            color: color,
          ),

          const SizedBox(
            width: AppSizes.spaceXS,
          ),

          Text(
            OrderHelper.getStatusText(
              status,
            ),
            style:
                AppTextStyles.labelMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}