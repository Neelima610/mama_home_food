import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../models/order/order_model.dart';

import '../helpers/order_validator.dart';

import '../widgets/order_tracking_app_bar.dart';
import '../widgets/order_tracking_card.dart';
import '../widgets/order_info_card.dart';
import '../widgets/delivery_address_card.dart';
import '../widgets/order_footer.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderTrackingAppBar(),

      bottomNavigationBar: OrderFooter(
        showTrackButton: false,
        showCancelButton:
            OrderValidator.canCancel(order),
        showInvoiceButton: false,
        showReorderButton:
            OrderValidator.canReorder(order),

        onCancel: () {
          // TODO
        },

        onReorder: () {
          // TODO
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              OrderTrackingCard(
                order: order,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              OrderInfoCard(
                order: order,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              DeliveryAddressCard(
                address:
                    order.deliveryAddress,
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