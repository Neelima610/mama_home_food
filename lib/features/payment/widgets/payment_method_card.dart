// payment_method_card.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

import '../../../models/payment/payment_method_model.dart';
import 'payment_icon.dart';
import 'payment_subtitle.dart';
import 'payment_badge.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.payment,
    required this.selected,
    required this.onTap,
    this.showBadge = false,
    this.badgeText,
  });

  final PaymentMethodModel payment;
  final bool selected;
  final VoidCallback onTap;

  final bool showBadge;
  final String? badgeText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppNumbers.cardElevation,
      color: AppColors.card,
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceM,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        side: BorderSide(
          color: selected
              ? AppColors.primary
              : AppColors.border,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        onTap: payment.enabled
            ? onTap
            : null,
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.spaceL,
          ),
          child: Row(
            children: [
              PaymentIcon(
                icon: payment.icon,
                size: AppNumbers.paymentIconSize,
              ),

              const SizedBox(
                width: AppSizes.spaceL,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            payment.title,
                            style: AppTextStyles
                                .titleMedium,
                          ),
                        ),

                        if (showBadge &&
                            badgeText != null)
                          PaymentBadge(
                            text: badgeText!,
                          ),
                      ],
                    ),

                    const SizedBox(
                      height:
                          AppSizes.spaceXS,
                    ),

                    PaymentSubtitle(
                      subtitle:
                          payment.subtitle,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: AppSizes.spaceM,
              ),

              AnimatedContainer(
                duration: Duration(
                  milliseconds:
                      AppNumbers.animationDuration,
                ),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? AppColors.primary
                      : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? AppColors.primary
                        : AppColors.border,
                    width: 2,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check,
                        color:
                            AppColors.white,
                        size: 16,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}