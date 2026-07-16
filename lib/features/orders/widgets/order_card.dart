import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../helpers/order_helper.dart';
import 'order_status_chip.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.onTap,
  });

  final OrderModel order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceL,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
        side: const BorderSide(
          color: AppColors.border,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.spaceL,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              //--------------------------------------------------
              // Order ID
              //--------------------------------------------------

              Text(
                OrderHelper.formatOrderId(
                  order.id,
                ),
                style: AppTextStyles.heading3,
              ),

              const SizedBox(
                height: AppSizes.spaceXS,
              ),

              //--------------------------------------------------
              // Order Date
              //--------------------------------------------------

              Text(
                OrderHelper.formatDateTime(
                  order.orderedAt,
                ),
                style: AppTextStyles.bodySmall,
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              //--------------------------------------------------
              // Status
              //--------------------------------------------------

              OrderStatusChip(
                status: order.status,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // Items & Total
              //--------------------------------------------------

              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${order.items.length} Items',
                      style:
                          AppTextStyles.bodyMedium,
                    ),
                  ),

                  Text(
                    '₹${order.grandTotal.toStringAsFixed(0)}',
                    style:
                        AppTextStyles.heading3,
                  ),
                ],
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // View Details
              //--------------------------------------------------

              Align(
                alignment:
                    Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.visibility_rounded,
                    size: AppSizes.iconSmall,
                  ),
                  label: const Text(
                    AppStrings.viewDetails,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}