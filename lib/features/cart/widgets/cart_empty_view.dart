import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //--------------------------------------------------
            // Empty Icon
            //--------------------------------------------------

            const Icon(
              Icons.shopping_cart_outlined,
              size: 100,
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Text(
              "Your Cart is Empty",
              style: AppTextStyles.heading2,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: AppSizes.spaceM,
            ),

            //--------------------------------------------------
            // Subtitle
            //--------------------------------------------------

            Text(
              "Looks like you haven't added any delicious food yet.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(
              height: AppSizes.spaceXXL,
            ),

            //--------------------------------------------------
            // Button
            //--------------------------------------------------
PrimaryButton(
  text: AppStrings.startShopping,
  onPressed: () {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.navigation,
      (route) => false,
    );
  },
)
          ],
        ),
      ),
    );
  }
}