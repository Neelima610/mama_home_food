import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../../../shared/widgets/cards/price_summary_card.dart';
import '../helpers/order_helper.dart';
import '../widgets/order_app_bar.dart';
import '../widgets/order_item_tile.dart';
import '../widgets/order_status_chip.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              //--------------------------------------------------
              // Order Information
              //--------------------------------------------------

              Text(
                AppStrings.orderDetails,
                style: AppTextStyles.heading2,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              _InfoTile(
                title: AppStrings.orderId,
                value:
                    OrderHelper.formatOrderId(
                  order.id,
                ),
              ),

              _InfoTile(
                title: AppStrings.orderDate,
                value:
                    OrderHelper.formatDateTime(
                  order.orderedAt,
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              OrderStatusChip(
                status: order.status,
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Delivery Address
              //--------------------------------------------------

              Text(
                AppStrings.deliveryAddress,
                style: AppTextStyles.heading3,
              ),

              const SizedBox(
                height: AppSizes.spaceS,
              ),

              Text(
                order.deliveryAddress,
                style:
                    AppTextStyles.bodyMedium,
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Payment Method
              //--------------------------------------------------

              Text(
                AppStrings.paymentMethod,
                style: AppTextStyles.heading3,
              ),

              const SizedBox(
                height: AppSizes.spaceS,
              ),

              Text(
                order.paymentMethod,
                style:
                    AppTextStyles.bodyMedium,
              ),

              const SizedBox(
                height: AppSizes.spaceXXL,
              ),

              //--------------------------------------------------
              // Ordered Items
              //--------------------------------------------------

              Text(
                AppStrings.items,
                style: AppTextStyles.heading3,
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              ...order.items.map(
                (item) => OrderItemTile(
                  item: item,
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // Price Summary
              //--------------------------------------------------

              PriceSummaryCard(
                subtotal: order.subtotal,
                deliveryCharge:
                    order.deliveryCharge,
                discount: order.discount,
                grandTotal:
                    order.grandTotal,
              ),

              const SizedBox(
                height: AppSizes.spaceXXL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSizes.spaceM,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style:
                  AppTextStyles.bodyMedium,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style:
                  AppTextStyles.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}