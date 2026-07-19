import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../../../shared/widgets/cards/custom_card.dart';

import 'order_timeline.dart';

class OrderTrackingCard extends StatelessWidget {
  const OrderTrackingCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.trackOrder,
            style: AppTextStyles.titleMedium,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          OrderTimeline(
            timeline: order.timeline,
          ),
        ],
      ),
    );
  }
}