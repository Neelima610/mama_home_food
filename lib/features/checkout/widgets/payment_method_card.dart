import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/cards/selectable_card.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.selectedMethod,
    required this.onChanged,
  });

  final String selectedMethod;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Text(
              AppStrings.paymentMethod,
              style: AppTextStyles.heading3,
            ),

            const SizedBox(
              height: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Cash on Delivery
            //--------------------------------------------------

            SelectableCard(
              title: AppStrings.cashOnDelivery,
              icon: Icons.payments_outlined,
              isSelected:
                  selectedMethod ==
                  AppStrings.cashOnDelivery,
              onTap: () {
                onChanged(
                  AppStrings.cashOnDelivery,
                );
              },
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            //--------------------------------------------------
            // UPI
            //--------------------------------------------------

            SelectableCard(
              title: AppStrings.upi,
              icon: Icons.qr_code_2_outlined,
              isSelected:
                  selectedMethod ==
                  AppStrings.upi,
              onTap: () {
                onChanged(
                  AppStrings.upi,
                );
              },
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            //--------------------------------------------------
            // Credit / Debit Card
            //--------------------------------------------------

            SelectableCard(
              title: AppStrings.cardPayment,
              icon: Icons.credit_card_outlined,
              isSelected:
                  selectedMethod ==
                  AppStrings.cardPayment,
              onTap: () {
                onChanged(
                  AppStrings.cardPayment,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}