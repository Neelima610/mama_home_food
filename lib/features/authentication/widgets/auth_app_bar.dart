
// auth_app_bar.dart
import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class AuthAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AuthAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,

      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.textDark,
                size: AppSizes.iconM,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,

      title: Text(
        title,
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
