// cod_option.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class CodOption extends StatelessWidget {
  const CodOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppNumbers.cardElevation,
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(
                AppSizes.spaceM,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: 0.10,
                ),
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.radiusM,
                ),
              ),
              child: const Icon(
                Icons.payments_outlined,
                color: AppColors.primary,
                size: AppNumbers.paymentIconSize,
              ),
            ),

            const SizedBox(
              width: AppSizes.spaceL,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.cashOnDelivery,
                    style:
                        AppTextStyles.titleMedium,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceXS,
                  ),

                  Text(
                    AppStrings.codDescription,
                    style:
                        AppTextStyles.bodyMedium,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceM,
                  ),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal:
                          AppSizes.spaceM,
                      vertical:
                          AppSizes.spaceXS,
                    ),
                    decoration: BoxDecoration(
                      color:
                          AppColors.success.withValues(
                        alpha: 0.12,
                      ),
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.radiusM,
                      ),
                    ),
                    child: Text(
                      AppStrings.payOnDelivery,
                      style: AppTextStyles.bodySmall
                          .copyWith(
                        color:
                            AppColors.success,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
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