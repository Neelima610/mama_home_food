

// order_details_app_bar.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class OrderDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderDetailsAppBar({
    super.key,
    this.onShare,
  });

  final VoidCallback? onShare;

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        kToolbarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: AppSizes.zero,

      centerTitle: true,

      title: Text(
        AppStrings.orderDetails,
        style:
            AppTextStyles.appBarTitle,
      ),

      actions: [
        IconButton(
          key: const ValueKey(
            AppKeys.shareOrder,
          ),
          tooltip:
              AppStrings.share,
          onPressed: onShare,
          icon: const Icon(
            Icons.share_rounded,
          ),
        ),
      ],
    );
  }
}