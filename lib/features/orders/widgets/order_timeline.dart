

// order_timeline.dart

import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/order/order_timeline_model.dart';
import '../helpers/order_formatter.dart';
import '../helpers/order_helper.dart';


class OrderTimeline extends StatelessWidget {
  const OrderTimeline({
    super.key,
    required this.timeline,
  });

  final List<OrderTimelineModel> timeline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        timeline.length,
        (index) {
          final item = timeline[index];

          final isLast =
              index ==
                  timeline.length - 1;

          final color = item.completed
              ? OrderHelper.getStatusColor(
                  item.status,
                )
              : AppColors.grey;

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                //--------------------------------------------------
                // Indicator
                //--------------------------------------------------

                Column(
                  children: [
                    Container(
                      width:
                          AppSizes.iconS,
                      height:
                          AppSizes.iconS,
                      decoration:
                          BoxDecoration(
                        color: color,
                        shape:
                            BoxShape.circle,
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: color,
                        ),
                      ),
                  ],
                ),

                const SizedBox(
                  width:
                      AppSizes.spaceM,
                ),

                //--------------------------------------------------
                // Details
                //--------------------------------------------------

                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(
                      bottom:
                          AppSizes.spaceL,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          OrderHelper
                              .getStatusTitle(
                            item.status,
                          ),
                          style:
                              AppTextStyles
                                  .titleSmall,
                        ),
                        const SizedBox(
                          height:
                              AppSizes
                                  .spaceXS,
                        ),
                        Text(
                          OrderFormatter
                              .formatDateTime(
                            item.time,
                          ),
                          style:
                              AppTextStyles
                                  .bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}