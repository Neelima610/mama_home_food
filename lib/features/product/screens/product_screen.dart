import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/buttons/add_to_cart_button.dart';
import '../../../shared/widgets/common/quantity_selector.dart';
import '../../cart/providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/product_description.dart';
import '../widgets/product_image.dart';
import '../widgets/product_info.dart';
import '../../../shared/widgets/common/product_price.dart';
import '../widgets/product_rating.dart';
// import '../widgets/quantity_selector.dart';
import '../widgets/similar_products.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductScreen> createState() =>
      _ProductScreenState();
}

class _ProductScreenState
    extends State<ProductScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ProductProvider>()
          .selectProduct(widget.product);
    });
  }

  @override
  void dispose() {
    context
        .read<ProductProvider>()
        .clearSelectedProduct();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {

        final product =
            provider.selectedProduct ??
            widget.product;

        return Scaffold(
          appBar: ProductAppBar(
            product: product,
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              AppSizes.screenPadding,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                /// Product Image
                ProductImage(
                  product: product,
                ),

                const SizedBox(height: 24),

                /// Product Info
                ProductInfo(
                  product: product,
                ),

                const SizedBox(height: 20),

                /// Product Price
                ProductPrice(
                  product: product,
                ),

                const SizedBox(height: 20),

                /// Product Rating
                ProductRating(
                  product: product,
                ),

                const SizedBox(height: 24),

                /// Quantity
                QuantitySelector(
  quantity: provider.quantity,

  onIncrease: () {
    provider.increaseQuantity();
  },

  onDecrease: () {
    provider.decreaseQuantity();
  },
),

                const SizedBox(height: 24),

                /// Description
                ProductDescription(
                  product: product,
                ),

                const SizedBox(height: AppSizes.spaceXL),

                /// Similar Products
                SimilarProducts(
                   product: product,
                ),

                const SizedBox(height: 30),

                /// Add To Cart
                AddToCartButton(
                  onPressed: (){
                     context.read<CartProvider>().addToCart(
    product,
    quantity: provider.quantity,
                     );
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}