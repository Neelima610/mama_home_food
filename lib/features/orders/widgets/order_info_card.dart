
// order_info_card.dart
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../../../shared/widgets/cards/custom_card.dart';
import '../helpers/order_formatter.dart';


class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

  Widget _infoTile({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.spaceXS,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: AppNumbers.two,
            child: Text(
              title,
              style: AppTextStyles.bodyMedium,
            ),
          ),
          Expanded(
            flex: AppNumbers.three,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyles.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return AppStrings.notAvailable;
    }

    return OrderFormatter.formatDateTime(
      date,
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
            AppStrings.orderInformation,
            style:
                AppTextStyles.titleMedium,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          _infoTile(
            title: AppStrings.orderId,
            value: OrderFormatter
                .formatOrderId(
              order.id,
            ),
          ),

          _infoTile(
            title: AppStrings.userId,
            value: order.userId,
          ),

          _infoTile(
            title: AppStrings.orderDate,
            value: OrderFormatter
                .formatDateTime(
              order.orderDate,
            ),
          ),

          _infoTile(
            title: AppStrings.acceptedTime,
            value: _formatDate(
              order.acceptedTime,
            ),
          ),

          _infoTile(
            title: AppStrings.preparingTime,
            value: _formatDate(
              order.preparingTime,
            ),
          ),

          _infoTile(
            title:
                AppStrings.outForDelivery,
            value: _formatDate(
              order.outForDeliveryTime,
            ),
          ),

          _infoTile(
            title:
                AppStrings.deliveredTime,
            value: _formatDate(
              order.deliveredTime,
            ),
          ),

          _infoTile(
            title:
                AppStrings
                    .estimatedDelivery,
            value: OrderFormatter
                .formatDateTime(
              order
                  .estimatedDeliveryTime,
            ),
          ),
        ],
      ),
    );
  }
}