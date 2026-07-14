import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';

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

      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
            )
          : leading,

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),

      centerTitle: centerTitle,

      backgroundColor:
          backgroundColor ?? AppColors.primary,

      elevation: elevation,

      actions: actions,

      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppSizes.appBarHeight);
}