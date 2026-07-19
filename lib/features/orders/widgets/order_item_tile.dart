

// order_item_tile.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_item_model.dart';
import '../helpers/order_formatter.dart';


class OrderItemTile extends StatelessWidget {
  const OrderItemTile({
    super.key,
    required this.item,
  });

  final OrderItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.spaceS,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Image
          //--------------------------------------------------

          ClipRRect(
            borderRadius:
                BorderRadius.circular(
              AppSizes.radiusM,
            ),
            child: Image.asset(
              item.product.image,
              width: AppSizes.imageS,
              height: AppSizes.imageS,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            width: AppSizes.spaceM,
          ),

          //--------------------------------------------------
          // Product
          //--------------------------------------------------

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: AppTextStyles
                      .titleSmall,
                ),

                const SizedBox(
                  height:
                      AppSizes.spaceXS,
                ),

                Text(
                  OrderFormatter
                      .formatQuantity(
                    item.quantity,
                  ),
                  style: AppTextStyles
                      .bodySmall,
                ),
              ],
            ),
          ),

          //--------------------------------------------------
          // Price
          //--------------------------------------------------

          Text(
            OrderFormatter
                .formatAmount(
              item.total,
            ),
            style:
                AppTextStyles.price,
          ),
        ],
      ),
    );
  }
}