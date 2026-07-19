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
      height: AppSizes.bannerHeight + 20,

      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
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
          AppSizes.spaceL,
        ),

        child: Row(

          children: [


            Expanded(
              flex: 3,

              child: Column(

                mainAxisSize:
                    MainAxisSize.min,

                mainAxisAlignment:
                    MainAxisAlignment.center,

                crossAxisAlignment:
                    CrossAxisAlignment.start,


                children: [

                  Text(
                    "Fresh Homemade Food",

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style:
                        AppTextStyles.heading2
                            .copyWith(
                      color:
                          AppColors.white,
                    ),
                  ),


                  const SizedBox(
                    height: AppSizes.spaceS,
                  ),


                  Text(
                    "Healthy • Hygienic • Delicious",

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style:
                        AppTextStyles.bodyMedium
                            .copyWith(
                      color: AppColors.white
                          .withValues(
                            alpha: 0.9,
                          ),
                    ),
                  ),


                  const SizedBox(
                    height: AppSizes.spaceM,
                  ),


                  Container(

                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),

                    decoration:
                        BoxDecoration(
                      color:
                          AppColors.white,

                      borderRadius:
                          BorderRadius.circular(
                        30,
                      ),
                    ),


                    child: Text(

                      "Order Now",

                      style:
                          AppTextStyles.bodyMedium
                              .copyWith(
                        color:
                            AppColors.primary,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Expanded(
              flex: 2,

              child: Center(

                child: Container(

                  padding:
                      const EdgeInsets.all(10),


                  decoration:
                      BoxDecoration(

                    color:
                        AppColors.white
                            .withValues(
                              alpha: 0.15,
                            ),

                    shape:
                        BoxShape.circle,
                  ),


                  child: const AppLogo(

                    width: 75,

                    height: 75,
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