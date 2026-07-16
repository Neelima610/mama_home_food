import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class OrderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderAppBar({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,

      leading: showBackButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.textDark,
                size: AppSizes.iconMedium,
              ),
            )
          : null,

      title: Text(
        AppStrings.myOrders,
        style: AppTextStyles.heading2,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        AppSizes.appBarHeight,
      );
}