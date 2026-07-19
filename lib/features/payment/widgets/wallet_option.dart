// wallet_option.dart

import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class WalletOption extends StatelessWidget {
  const WalletOption({
    super.key,
    required this.selectedWallet,
    required this.onChanged,
  });

  final String selectedWallet;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final wallets = [
      AppStrings.phonePe,
      AppStrings.googlePay,
      AppStrings.paytm,
    ];

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
        child: Column(
          children: wallets.map((wallet) {
            final selected =
                wallet == selectedWallet;

            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.account_balance_wallet,
                color: AppColors.primary,
              ),
              title: Text(
                wallet,
                style:
                    AppTextStyles.bodyLarge,
              ),
              trailing: AnimatedContainer(
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
                        size: 16,
                        color:
                            AppColors.white,
                      )
                    : null,
              ),
              onTap: () {
                onChanged(wallet);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}