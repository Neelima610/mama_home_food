import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    super.key,
    required this.cardNumber,
    required this.onTap,
    this.cardHolderName,
    this.expiryDate,
    this.isSelected = false,
  });

  //--------------------------------------------------
  // Properties
  //--------------------------------------------------

  final String cardNumber;

  final String? cardHolderName;

  final String? expiryDate;

  final bool isSelected;

  final VoidCallback onTap;

  //--------------------------------------------------
  // Build
  //--------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppNumbers.cardElevation,

      color: isSelected
          ? AppColors.primary.withValues(
              alpha: 0.08,
            )
          : AppColors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),

        side: BorderSide(
          color: isSelected
              ? AppColors.primary
              : AppColors.textHint.withValues(
                  alpha: 0.3,
                ),

          width: isSelected
              ? AppSizes.two
              : AppSizes.one,
        ),
      ),

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),

        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.spaceL,
          ),

          child: Row(
            children: [

              //--------------------------------------------------
              // Card Icon
              //--------------------------------------------------

              Container(
                width: AppSizes.imageS,
                height: AppSizes.imageS,

                decoration: BoxDecoration(
                  color: AppColors.primary
                      .withValues(
                    alpha: 0.1,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    AppSizes.radiusM,
                  ),
                ),

                child: const Icon(
                  Icons.credit_card_rounded,

                  color: AppColors.primary,

                  size: AppSizes.iconM,
                ),
              ),

              const SizedBox(
                width: AppSizes.spaceM,
              ),

              //--------------------------------------------------
              // Card Details
              //--------------------------------------------------

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      '**** **** **** $cardNumber',

                      style: AppTextStyles
                          .titleMedium
                          .copyWith(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    if (cardHolderName != null) ...[
                      const SizedBox(
                        height: AppSizes.spaceXS,
                      ),

                      Text(
                        cardHolderName!,

                        style:
                            AppTextStyles.bodySmall,
                      ),
                    ],

                    if (expiryDate != null) ...[
                      const SizedBox(
                        height: AppSizes.spaceXS,
                      ),

                      Text(
                        'Expires $expiryDate',

                        style:
                            AppTextStyles.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),

              //--------------------------------------------------
              // Selection Icon
              //--------------------------------------------------

              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,

                color: isSelected
                    ? AppColors.primary
                    : AppColors.textHint,

                size: AppSizes.iconM,
              ),
            ],
          ),
        ),
      ),
    );
  }
}