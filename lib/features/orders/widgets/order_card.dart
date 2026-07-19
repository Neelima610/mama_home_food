

// order_card.dart

import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../../../shared/widgets/cards/custom_card.dart';
import '../helpers/order_formatter.dart';
import '../helpers/order_helper.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order, required this.onTap});

  final OrderModel order;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: ValueKey(order.id),
      margin: const EdgeInsets.only(bottom: AppSizes.spaceM),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Order ID & Status
          //--------------------------------------------------
          Row(
            children: [
              Expanded(
                child: Text(
                  OrderFormatter.formatOrderId(order.id),
                  style: AppTextStyles.titleMedium,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceM,
                  vertical: AppSizes.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: OrderHelper.getStatusColor(
                    order.orderStatus,
                  ).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                ),
                child: Text(
                  OrderHelper.getStatusTitle(order.orderStatus),
                  style: AppTextStyles.labelMedium.copyWith(
                    color: OrderHelper.getStatusColor(order.orderStatus),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.spaceM),

          //--------------------------------------------------
          // Quantity
          //--------------------------------------------------
          Text(
            OrderFormatter.formatQuantity(order.quantity),
            style: AppTextStyles.bodyMedium,
          ),

          const SizedBox(height: AppSizes.spaceXS),

          //--------------------------------------------------
          // Total
          //--------------------------------------------------
          Text(
            OrderFormatter.formatAmount(order.grandTotal),
            style: AppTextStyles.price,
          ),

          const SizedBox(height: AppSizes.spaceXS),

          //--------------------------------------------------
          // Date
          //--------------------------------------------------
          Text(
            OrderFormatter.formatDateTime(order.orderDate),
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
