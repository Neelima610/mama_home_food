// product_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../features/cart/providers/cart_provider.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/buttons/add_to_cart_button.dart';
import '../../../shared/widgets/buttons/buy_now_button.dart';
import '../../../shared/widgets/common/product_price.dart';
import '../../../shared/widgets/common/quantity_selector.dart';
import '../../../shared/widgets/feedback/app_snackbar.dart';


import '../widgets/ingredients_card.dart';
import '../widgets/nutrition_card.dart';
import '../widgets/product_app_bar.dart';
import '../widgets/product_description.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/product_info.dart';

import '../widgets/product_rating.dart';
import '../widgets/product_tags.dart';
import '../widgets/similar_products.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ProductAppBar(
        title: product.name,
        showFavorite: true,
        showShare: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            ProductImageSlider(
              product: product,
            ),

            Padding(
              padding: const EdgeInsets.all(
                AppSizes.spaceM,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  ProductInfo(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceM,
                  ),

                  ProductRating(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceM,
                  ),

                  ProductPrice(
                    product: product,
                    showDiscount: true,
                    showSavings: true,
                  ),

                  if (product.tags.isNotEmpty) ...[
                    const SizedBox(
                      height: AppSizes.spaceM,
                    ),
                    ProductTags(
                      product: product,
                    ),
                  ],

                  const SizedBox(
                    height: AppSizes.spaceL,
                  ),

                  ProductDescription(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceL,
                  ),

                  IngredientsCard(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceL,
                  ),

                  NutritionCard(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceL,
                  ),

                  SimilarProducts(
                    product: product,
                  ),

                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          _buildBottomActionBar(context),
    );
  }

  Widget _buildBottomActionBar(
    BuildContext context,
  ) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Consumer<CartProvider>(
          builder: (_, cart, __) {
            final quantity = cart.getQuantity(
              product.id,
            );

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (quantity > 0) ...[
                  Row(
                    children: [
                      Text(
                        AppStrings.quantity,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const Spacer(),

                      QuantitySelector(
                        quantity: quantity,
                        onIncrease: () {
                          cart.increaseQuantity(
                            product.id,
                          );
                        },
                        onDecrease: () {
                          cart.decreaseQuantity(
                            product.id,
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: AppSizes.spaceM,
                  ),
                ],

                Row(
                  children: [
                    Expanded(
                      child: AddToCartButton(
                        onPressed: () {
                          cart.addToCart(product);

                          AppSnackbar.showSuccess(
                            context,
                            '${product.name} '
                            '${AppStrings.addedToCart}',
                          );
                        },
                        enabled:
                            product.isAvailable,
                      ),
                    ),

                    const SizedBox(
                      width: AppSizes.spaceS,
                    ),

                    Expanded(
                      child: BuyNowButton(
                        onPressed: () {
                          cart.addToCart(product);

                          AppSnackbar.showSuccess(
                            context,
                            '${product.name} '
                            '${AppStrings.addedToCart}',
                          );

                          // Navigate to checkout
                          // after checkout route is finalized.
                        },
                        enabled:
                            product.isAvailable,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}