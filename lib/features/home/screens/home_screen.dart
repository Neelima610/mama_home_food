import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
// import '../../core/theme/theme.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/themes.dart';
import '../../../data/dummy/category_data.dart';
import '../../../data/repositories/repositories.dart';
import '../../../widgets/home/banner_slider.dart';
import '../../../widgets/home/category_card.dart';
import '../../../widgets/home/home_app_bar.dart';
import '../../../widgets/home/product_card.dart';
import '../../../widgets/home/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch data from repositories
    final categories = CategoryRepository.getAllCategories();
    final featuredProducts = ProductRepository.getFeaturedProducts();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //==========================================
              // Home App Bar
              //==========================================

              const HomeAppBar(
                userName: "Neelima",
                location: AppConstants.hyderabad,
                cartCount: 2,
              ),

              const SizedBox(height: AppSizes.spaceXL),

              //==========================================
              // Search Box
              //==========================================

              const SearchBox(),

              const SizedBox(height: AppSizes.spaceXL),

              //==========================================
              // Banner Slider
              //==========================================

              const BannerSlider(),

              const SizedBox(height: AppSizes.spaceXL),

              //==========================================
              // Categories
              //==========================================

              Text(
                AppStrings.categories,
                style: AppTextStyles.heading2,
              ),

              const SizedBox(height: AppSizes.spaceL),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: CategoryData.categories[index],
  onTap: () {
    Navigator.pushNamed(
      context,
      RouteNames.category,
      arguments: CategoryData.categories[index],
    );
  },
                  );
                },
              ),

              const SizedBox(height: AppSizes.spaceXL),

              //==========================================
              // Featured Products
              //==========================================

              Text(
                AppStrings.featuredProducts,
                style: AppTextStyles.heading2,
              ),

              const SizedBox(height: AppSizes.spaceL),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: featuredProducts.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: featuredProducts[index],
                    onTap: () {
                      debugPrint(
                        'Product Selected: ${featuredProducts[index].name}',
                      );
                    },
                    onAddToCart: () {
                      debugPrint(
                        'Added to Cart: ${featuredProducts[index].name}',
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}