

// order_summary_card.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../../../shared/widgets/cards/custom_card.dart';
import '../helpers/order_formatter.dart';


class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

  Widget _row({
    required String title,
    required String value,
    bool highlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.spaceXS,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: highlight
                  ? AppTextStyles.titleMedium
                  : AppTextStyles.bodyMedium,
            ),
          ),
          Text(
            value,
            style: highlight
                ? AppTextStyles.price
                : AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.orderSummary,
            style:
                AppTextStyles.titleLarge,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          _row(
            title: AppStrings.subtotal,
            value: OrderFormatter
                .formatAmount(
              order.subtotal,
            ),
          ),

          _row(
            title:
                AppStrings.deliveryCharge,
            value: OrderFormatter
                .formatAmount(
              order.deliveryCharge,
            ),
          ),

          _row(
            title: AppStrings.discount,
            value: "-${OrderFormatter.formatAmount(order.discount)}",
          ),

          const Divider(),

          _row(
            title: AppStrings.total,
            value: OrderFormatter
                .formatAmount(
              order.grandTotal,
            ),
            highlight: true,
          ),
        ],
      ),
    );
  }
}