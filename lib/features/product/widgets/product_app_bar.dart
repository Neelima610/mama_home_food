import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/themes.dart';

class ProductAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductAppBar({
    super.key,
    this.title = "",
    this.showShare = true,
    this.showFavorite = false,
    this.onFavorite,
    this.onShare,
    this.isFavorite = false,
  });

  final String title;
  final bool showShare;
  final bool showFavorite;
  final bool isFavorite;

  final VoidCallback? onFavorite;
  final VoidCallback? onShare;

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        AppSizes.appBarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,

      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      title: Text(
        title,
        style: AppTextStyles.appBarTitle,
      ),

      actions: [

        if (showFavorite)
          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite
                  ? AppColors.favorite
                  : AppColors.textDark,
            ),
          ),

        if (showShare)
          IconButton(
            onPressed: onShare,
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),

        const SizedBox(
          width: AppSizes.spaceXS,
        ),
      ],
    );
  }
}