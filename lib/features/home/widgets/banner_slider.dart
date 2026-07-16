import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/widgets/common/app_logo.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.bannerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusLarge,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceXL,
        ),
        child: Row(
          children: [
            //--------------------------------------------------
            // Left Content
            //--------------------------------------------------

            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fresh Homemade Food",
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceS,
                  ),

                  Text(
                    "Healthy • Hygienic • Delicious",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white.withValues(alpha: 0.9),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceL,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Order Now",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------------------------------
            // Right Logo
            //--------------------------------------------------

            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const AppLogo(
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}