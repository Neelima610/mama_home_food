import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';

// import '../../../shared/widgets/cards/price_summary.dart';

import '../helpers/order_validator.dart';

import '../widgets/order_details_app_bar.dart';
import '../widgets/order_info_card.dart';
import '../widgets/order_summary_card.dart';
import '../widgets/delivery_address_card.dart';
import '../widgets/payment_info_card.dart';
import '../widgets/order_item_tile.dart';
import '../widgets/order_footer.dart';
import '../widgets/cancel_order_dialog.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderDetailsAppBar(),

      bottomNavigationBar: OrderFooter(
        showTrackButton:
            OrderValidator.canTrack(order),

        showCancelButton:
            OrderValidator.canCancel(order),

        showInvoiceButton:
            OrderValidator
                .canDownloadInvoice(order),

        showReorderButton:
            OrderValidator.canReorder(order),

        onTrack: () {
          Navigator.pushNamed(
            context,
            RouteNames.orderTracking,
            arguments: order,
          );
        },

        onCancel: () {
          showDialog(
            context: context,
            builder: (_) =>
                CancelOrderDialog(
              onConfirm: (reason) {
                // TODO:
                // context.read<OrderProvider>()
                // .cancelOrder(...)
              },
            ),
          );
        },

        onInvoice: () {
          // TODO Download Invoice
        },

        onReorder: () {
          // TODO Re
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
                height: AppSizes.spaceL,
              ),

              PaymentInfoCard(
                order: order,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              Text(
                AppStrings.items,
                style:
                    AppTextStyles.titleLarge,
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
                            OrderSummaryCard(
                order: order,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}