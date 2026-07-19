

// order_status_chip.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_status.dart';
import '../helpers/order_helper.dart';


class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({
    super.key,
    required this.status,
  });

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final color = OrderHelper.getStatusColor(
      status,
    );

    return Chip(
      backgroundColor: color.withValues(
        alpha: 0.12,
      ),
      side: BorderSide.none,
      visualDensity:
          VisualDensity.compact,
      padding:
          const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceS,
      ),
      label: Text(
        OrderHelper.getStatusTitle(
          status,
        ),
        style: AppTextStyles.bodySmall
            .copyWith(
          color: color,
          fontWeight:
              FontWeight.w600,
        ),
      ),
    );
  }
}