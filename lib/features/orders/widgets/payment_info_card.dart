
// payment_info_card.dart
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_model.dart';
import '../../../shared/widgets/cards/custom_card.dart';
import '../../payment/helpers/payment_formatter.dart';
import '../../payment/helpers/payment_helper.dart';




class PaymentInfoCard extends StatelessWidget {
  const PaymentInfoCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

  Widget _infoTile({
    required String title,
    required String value,
    Color? valueColor,
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.spaceXS,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: AppNumbers.two,
            child: Text(
              title,
              style: AppTextStyles.bodyMedium,
            ),
          ),
          Expanded(
            flex: AppNumbers.three,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: bold
                  ? AppTextStyles.titleMedium
                      .copyWith(
                      color: valueColor,
                    )
                  : AppTextStyles.titleSmall
                      .copyWith(
                      color: valueColor,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusColor =
        PaymentHelper.getStatusColor(
      order.paymentStatus,
    );

    return CustomCard(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Title
          //--------------------------------------------------

          Text(
            AppStrings.paymentInformation,
            style:
                AppTextStyles.titleMedium,
          ),

          const SizedBox(
            height: AppSizes.spaceL,
          ),

          //--------------------------------------------------
          // Payment Method
          //--------------------------------------------------

          _infoTile(
            title:
                AppStrings.paymentMethod,
            value: PaymentHelper
                .getMethodTitle(
              order.paymentMethod,
            ),
          ),

          //--------------------------------------------------
          // Payment Status
          //--------------------------------------------------

          _infoTile(
            title:
                AppStrings.paymentStatus,
            value: PaymentHelper
                .getStatusTitle(
              order.paymentStatus,
            ),
            valueColor: statusColor,
          ),

          //--------------------------------------------------
          // Transaction ID
          //--------------------------------------------------

          _infoTile(
            title:
                AppStrings.transactionId,
            value: PaymentFormatter
                .formatTransactionId(
              order.transactionId,
            ),
          ),

          //--------------------------------------------------
          // Coupon
          //--------------------------------------------------

          if ((order.couponCode ?? '')
              .isNotEmpty)
            _infoTile(
              title:
                  AppStrings.couponCode,
              value: PaymentFormatter
                  .formatCoupon(
                order.couponCode,
              ),
            ),

          const Divider(
            height: AppSizes.spaceXL,
          ),

          //--------------------------------------------------
          // Amount Details
          //--------------------------------------------------

          _infoTile(
            title:
                AppStrings.subtotal,
            value: PaymentFormatter
                .formatAmount(
              order.subtotal,
            ),
          ),

          _infoTile(
            title: AppStrings
                .deliveryCharge,
            value: PaymentFormatter
                .formatAmount(
              order.deliveryCharge,
            ),
          ),
                    //--------------------------------------------------
          // Discount
          //--------------------------------------------------

          _infoTile(
            title: AppStrings.discount,
            value:
                "-${PaymentFormatter.formatAmount(order.discount)}",
            valueColor:
                AppColors.success,
          ),

          const Divider(
            height: AppSizes.spaceXL,
          ),

          //--------------------------------------------------
          // Total Amount
          //--------------------------------------------------

          _infoTile(
            title:
                AppStrings.totalAmount,
            value: PaymentFormatter
                .formatAmount(
              order.grandTotal,
            ),
            valueColor:
                AppColors.primary,
            bold: true,
          ),

          //--------------------------------------------------
          // Payment Success Banner
          //--------------------------------------------------

          if (PaymentHelper.isSuccess(
            order.paymentStatus,
          )) ...[
            const SizedBox(
              height: AppSizes.spaceL,
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(
                AppSizes.spaceM,
              ),
              decoration: BoxDecoration(
                color: AppColors.success
                    .withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.radiusM,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons
                        .check_circle_rounded,
                    color:
                        AppColors.success,
                    size:
                        AppSizes.iconM,
                  ),
                  const SizedBox(
                    width:
                        AppSizes.spaceS,
                  ),
                  Expanded(
                    child: Text(
                      AppStrings
                          .paymentCompletedSuccessfully,
                      style:
                          AppTextStyles
                              .bodyMedium
                              .copyWith(
                        color:
                            AppColors.success,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          //--------------------------------------------------
          // Payment Pending Banner
          //--------------------------------------------------

          if (PaymentHelper.isPending(
            order.paymentStatus,
          )) ...[
            const SizedBox(
              height: AppSizes.spaceL,
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(
                AppSizes.spaceM,
              ),
              decoration: BoxDecoration(
                color: AppColors.warning
                    .withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.radiusM,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons
                        .schedule_rounded,
                    color:
                        AppColors.warning,
                    size:
                        AppSizes.iconM,
                  ),
                  const SizedBox(
                    width:
                        AppSizes.spaceS,
                  ),
                  Expanded(
                    child: Text(
                      AppStrings
                          .paymentPendingMessage,
                      style:
                          AppTextStyles
                              .bodyMedium
                              .copyWith(
                        color:
                            AppColors.warning,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          //--------------------------------------------------
          // Payment Failed Banner
          //--------------------------------------------------

          if (PaymentHelper.isFailed(
            order.paymentStatus,
          )) ...[
            const SizedBox(
              height: AppSizes.spaceL,
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(
                AppSizes.spaceM,
              ),
              decoration: BoxDecoration(
                color:
                    AppColors.error
                        .withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.radiusM,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_rounded,
                    color:
                        AppColors.error,
                    size:
                        AppSizes.iconM,
                  ),
                  const SizedBox(
                    width:
                        AppSizes.spaceS,
                  ),
                  Expanded(
                    child: Text(
                      AppStrings
                          .paymentFailedMessage,
                      style:
                          AppTextStyles
                              .bodyMedium
                              .copyWith(
                        color:
                            AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}