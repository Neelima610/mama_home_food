import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';
import '../../core/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.showBackButton = false,
    this.backgroundColor,
    this.elevation = 0,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBackButton;
  final Color? backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          backgroundColor ?? AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: elevation,
      centerTitle: centerTitle,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,

      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppSizes.iconMedium,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : leading,

      title: Text(
        title,
        style: AppTextStyles.heading2.copyWith(
          color: AppColors.white,
        ),
      ),

      actions: actions,

      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: AppSizes.iconMedium,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        AppSizes.appBarHeight,
      );
}