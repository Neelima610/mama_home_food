
// cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_names.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_empty_view.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cart_price_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        if (provider.isEmpty) {
          return Scaffold(
            appBar: const CartAppBar(),
            body: const CartEmptyView(),
          );
        }

        return Scaffold(
          appBar: const CartAppBar(),

         body: RefreshIndicator(
  onRefresh: () async {
    provider.loadCart();
  },
  child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16,16,16,100,),
            itemCount: provider.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem =
                  provider.cartItems[index];

              return CartItemCard(
                cartItem: cartItem,

                onIncrease: () {
                  provider.increaseQuantity(
                    cartItem.product.id,
                  );
                },

                onDecrease: () {
                  provider.decreaseQuantity(
                    cartItem.product.id,
                  );
                },

                onRemove: () {
                  provider.removeFromCart(
                    cartItem.product.id,
                  );
                },
              );
            },
          ),
         ),

          bottomNavigationBar: SafeArea(
  child: CartPriceSummary(
    subtotal: provider.subtotal,
    deliveryCharge: provider.deliveryCharge,
    discount: provider.discount,
    total: provider.grandTotal,
    onCheckout: () {
      Navigator.pushNamed(
        context,
        RouteNames.checkout,
      );
    },
  ),
),
      );
      },
    );
  }
}
