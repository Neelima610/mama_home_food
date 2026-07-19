// payment_method_list.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

import '../../../models/payment/payment_method_model.dart';
import 'payment_method_card.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({
    super.key,
    required this.methods,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<PaymentMethodModel> methods;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const ValueKey(
        AppKeys.paymentMethodList,
      ),
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: methods.length,

      separatorBuilder: (_, _) =>
          const SizedBox(
        height: AppSizes.spaceM,
      ),

      itemBuilder: (context, index) {
        final payment = methods[index];

        return PaymentMethodCard(
          payment: payment,

          selected:
              selectedIndex == index,

          showBadge:
              payment.recommended,

          badgeText: payment.recommended
              ? AppStrings.recommended
              : null,

          onTap: () {
            onChanged(index);
          },
        );
      },
    );
  }
}