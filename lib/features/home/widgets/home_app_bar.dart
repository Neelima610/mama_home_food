import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/common/app_logo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    this.userName = "Guest",
    this.location = AppConstants.hyderabad,
    this.cartCount = 0,
    this.onNotificationTap,
    this.onCartTap,
  });

  final String userName;
  final String location;
  final int cartCount;

  final VoidCallback? onNotificationTap;
  final VoidCallback? onCartTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.screenPadding,
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const AppLogo(width: 55,
            height: 55,),

            const SizedBox(
              width: AppSizes.spaceM,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning 👋",
                    style:
                        AppTextStyles.bodySmall,
                  ),

                  const SizedBox(
                    height: 2,
                  ),

                  Text(
                    userName,
                    style:
                        AppTextStyles.heading3,
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 16,
                      ),

                      const SizedBox(width: 4),

                      Expanded(
                        child: Text(
                          location,
                          overflow:
                              TextOverflow.ellipsis,
                          style: AppTextStyles
                              .labelMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed:
                  onNotificationTap,
              icon: const Icon(
                Icons.notifications_none,
              ),
            ),

            Stack(
              children: [
                IconButton(
                  onPressed: onCartTap,
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),

                if (cartCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration:
                          const BoxDecoration(
                        color:
                            AppColors.error,
                        shape:
                            BoxShape.circle,
                      ),
                      alignment:
                          Alignment.center,
                      child: Text(
                        cartCount > 9
                            ? "9+"
                            : "$cartCount",
                        style:
                            const TextStyle(
                          color:
                              AppColors.white,
                          fontSize: 10,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}