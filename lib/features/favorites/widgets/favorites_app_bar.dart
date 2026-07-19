import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class FavoritesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FavoritesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,

      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.textDark,
          size: AppSizes.iconM,
        ),
      ),

      title: Text(
        AppStrings.favorites,
        style: AppTextStyles.appBarTitle,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        AppSizes.appBarHeight,
      );
}