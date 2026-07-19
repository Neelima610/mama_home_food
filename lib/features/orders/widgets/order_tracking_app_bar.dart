

// order_tracking_app_bar.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class OrderTrackingAppBar
    extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderTrackingAppBar({
    super.key,
    this.onRefresh,
  });

  final VoidCallback? onRefresh;

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
        AppStrings.trackOrder,
        style:
            AppTextStyles.appBarTitle,
      ),

      actions: [
        IconButton(
          key: const ValueKey(
            AppKeys.refreshOrderTracking,
          ),
          tooltip:
              AppStrings.refresh,
          onPressed: onRefresh,
          icon: const Icon(
            Icons.refresh_rounded,
          ),
        ),
      ],
    );
  }
}