import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class CartAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,

      centerTitle: true,

      title: Text(
        AppStrings.cart,
        style: AppTextStyles.heading2,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        kToolbarHeight,
      );
}