import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/cart/cart_model.dart';
import '../../../shared/widgets/common/app_network_image.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({
    super.key,
    required this.item,
  });

  final CartModel item;

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceL,
      ),
      padding: const EdgeInsets.all(
        AppSizes.spaceM,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Product Image
          //--------------------------------------------------

          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppSizes.radiusMedium,
            ),
            child: AppNetworkImage(
              imagePath: product.image,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            width: AppSizes.spaceM,
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
                  style:
                      AppTextStyles.titleMedium,
                  maxLines: 2,
                  overflow:
                      TextOverflow.ellipsis,
                ),

                const SizedBox(
                  height: AppSizes.spaceXS,
                ),

                Text(
                  "₹${product.price.toStringAsFixed(0)}",
                  style:
                      AppTextStyles.bodyMedium,
                ),

                const SizedBox(
                  height: AppSizes.spaceXS,
                ),

                Text(
                  "Qty : ${item.quantity}",
                  style:
                      AppTextStyles.bodySmall,
                ),
              ],
            ),
          ),

          //--------------------------------------------------
          // Total Price
          //--------------------------------------------------

          Text(
            "₹${item.totalPrice.toStringAsFixed(0)}",
            style: AppTextStyles.heading3,
          ),
        ],
      ),
    );
  }
}