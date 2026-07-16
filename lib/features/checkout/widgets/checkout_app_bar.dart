import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';

class CheckoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CheckoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      title: Text(
        AppStrings.checkout,
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