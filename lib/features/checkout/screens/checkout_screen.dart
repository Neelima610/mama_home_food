import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../shared/widgets/cards/price_summary_card.dart';
import '../../cart/providers/cart_provider.dart';
import '../providers/checkout_provider.dart';
import '../widgets/checkout_app_bar.dart';
import '../widgets/coupon_card.dart';
import '../widgets/delivery_address_card.dart';
import '../widgets/payment_method_card.dart';
import '../widgets/place_order_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final checkoutProvider =
        context.watch<CheckoutProvider>();

    return Scaffold(
      appBar: const CheckoutAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            children: [
              //--------------------------------------------------
              // Delivery Address
              //--------------------------------------------------

              DeliveryAddressCard(
                name: "Neelima",
                phone: "+91 9876543210",
                address:
                    "Flat No.101,\nNagole,\nHyderabad - 500068",
                onEdit: () {
                  debugPrint(
                    "Edit Address",
                  );
                },
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // Order Summary
              //--------------------------------------------------

              PriceSummaryCard(
                subtotal: cartProvider.subtotal,
  deliveryCharge: cartProvider.deliveryCharge,
  discount: cartProvider.discount,
  grandTotal: cartProvider.grandTotal,
),
              //--------------------------------------------------
              // Payment Method
              //--------------------------------------------------

              PaymentMethodCard(
                selectedMethod:
                    checkoutProvider.paymentMethod,
                onChanged: (method) {
                  checkoutProvider
                      .selectPaymentMethod(
                    method,
                  );
                },
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // Coupon
              //--------------------------------------------------

              CouponCard(
                onApply: (coupon) {
                  checkoutProvider
                      .applyCoupon(coupon);
                },
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // Place Order
              //--------------------------------------------------

              PlaceOrderSection(
                subtotal:
                    cartProvider.subtotal,
                deliveryCharge:
                    cartProvider.deliveryCharge,
                discount:
                    cartProvider.discount,
                grandTotal:
                    cartProvider.grandTotal,
                onPlaceOrder: () {
                  debugPrint(
                    "Place Order Clicked",
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Order placed successfully!",
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}