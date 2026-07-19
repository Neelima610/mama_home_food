// home_screen.dart

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/repositories/repositories.dart';

import '../../../shared/widgets/cards/category_card.dart';
import '../../../shared/widgets/cards/product_card.dart';

import '../widgets/banner_slider.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //--------------------------------------------------
    // Load Data
    //--------------------------------------------------

    final categories =
        CategoryRepository.getAllCategories();

    final featuredProducts =
        ProductRepository.getFeaturedProducts();

    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              //--------------------------------------------------
              // Home App Bar
              //--------------------------------------------------

              const HomeAppBar(
                userName:
                    AppConstants.userName,

                location:
                    AppConstants.hyderabad,

                cartCount: 2,
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Search Box
              //--------------------------------------------------

              const SearchBox(),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Banner Slider
              //--------------------------------------------------

              const BannerSlider(),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Categories Title
              //--------------------------------------------------

              Text(
                AppStrings.categories,
                style:
                    AppTextStyles.heading2,
              ),

              const SizedBox(
                height: AppSizes.spaceM,
              ),

              //--------------------------------------------------
              // Categories
              //--------------------------------------------------

              SizedBox(
                height: 110,

                child: ListView.separated(
                  scrollDirection:
                      Axis.horizontal,

                  itemCount:
                      categories.length,

                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return const SizedBox(
                      width: AppSizes.spaceM,
                    );
                  },

                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: 80,

                      child: CategoryCard(
                        category:
                            categories[index],

                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.category,
                            arguments:
                                categories[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: AppSizes.spaceXL,
              ),

              //--------------------------------------------------
              // Featured Products Title
              //--------------------------------------------------

              Text(
                AppStrings.featuredProducts,
                style:
                    AppTextStyles.heading2,
              ),

              const SizedBox(
                height: AppSizes.spaceL,
              ),

              //--------------------------------------------------
              // Featured Products
              //--------------------------------------------------

              GridView.builder(
                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount:
                    featuredProducts.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing:
                      AppSizes.spaceM,

                  mainAxisSpacing:
                      AppSizes.spaceM,

                  childAspectRatio: 0.48,
                ),

                itemBuilder: (
                  context,
                  index,
                ) {
                  return ProductCard(
                    product:
                        featuredProducts[index],
                  );
                },
              ),

              //--------------------------------------------------
              // Bottom Spacing
              //--------------------------------------------------

              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}