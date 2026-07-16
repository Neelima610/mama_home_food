import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/colors.dart';
import '../../../core/routes/route_names.dart';
import '../../../models/product/product_model.dart';
import '../../cart/providers/cart_provider.dart';
import '../providers/product_provider.dart';

class ProductAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductAppBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,

      title: Text(product.name),

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      actions: [
        Consumer<ProductProvider>(
          builder: (context, provider, child) {
            final current =
                provider.selectedProduct ?? product;

            return IconButton(
              onPressed: () {
                provider.toggleFavorite(
                  current.id,
                );
              },
              icon: Icon(
                current.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: current.isFavorite
                    ? Colors.red
                    : AppColors.primary,
              ),
            );
          },
        ),

        Consumer<CartProvider>(
          builder: (context, cart, child) {
            return Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.cart,
                    );
                  },
                ),

                if (cart.totalItems > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding:
                          const EdgeInsets.all(4),
                      decoration:
                          const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cart.totalItems.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),

        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}