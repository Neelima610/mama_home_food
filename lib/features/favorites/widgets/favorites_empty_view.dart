import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class FavoritesEmptyView extends StatelessWidget {
  const FavoritesEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            //--------------------------------------------------
            // Icon
            //--------------------------------------------------

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: 0.08,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border_rounded,
                size: 60,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceXL,
            ),

            //--------------------------------------------------
            // Title
            //--------------------------------------------------

            Text(
              AppStrings.noFavoritesYet,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading2,
            ),

            const SizedBox(
              height: AppSizes.spaceS,
            ),

            //--------------------------------------------------
            // Subtitle
            //--------------------------------------------------

            Text(
              AppStrings.noFavoritesSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),

            const SizedBox(
              height: AppSizes.spaceXXL,
            ),

            //--------------------------------------------------
            // Continue Shopping
            //--------------------------------------------------

            PrimaryButton(
              text: AppStrings.continueShopping,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.navigation,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}