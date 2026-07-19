

// orders_app_bar.dart

import 'package:flutter/material.dart';


import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';

class OrdersAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OrdersAppBar({
    super.key,
    this.showSearch = true,
  });

  final bool showSearch;

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
        AppStrings.myOrders,
        style:
            AppTextStyles.appBarTitle,
      ),

      actions: [
        if (showSearch)
          IconButton(
            tooltip:
                AppStrings.search,
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteNames.search,
              );
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
      ],
    );
  }
}