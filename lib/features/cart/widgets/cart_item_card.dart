import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/cart/cart_model.dart';
import '../../../shared/widgets/badges/rating_badge.dart';
import '../../../shared/widgets/common/app_network_image.dart';
import '../../../shared/widgets/common/product_price.dart';
import '../../../shared/widgets/common/quantity_selector.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final CartModel cartItem;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceM,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceM,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------------------------------------------------
            // Product Image
            //--------------------------------------------------

            AppNetworkImage(
  imagePath: product.image,
  width: 90,
  height: 90,
  fit: BoxFit.cover,
  borderRadius: BorderRadius.circular(
    AppSizes.radiusMedium,
  ),
),
            

            //--------------------------------------------------
            // Product Details
            //--------------------------------------------------

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.heading3,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceXS,
                  ),

                  RatingBadge(
                    rating: product.rating,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceS,
                  ),

                  ProductPrice(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceM,
                  ),

                  Row(
                    children: [
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        onIncrease: onIncrease,
                        onDecrease: onDecrease,
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: onRemove,
                        icon: const Icon(
                          Icons.delete_outline,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}