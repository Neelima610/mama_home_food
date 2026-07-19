import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/widgets/buttons/add_to_cart_button.dart';
import '../../../shared/widgets/common/product_price.dart';
// import '../../../shared/widgets/custom_cached_image.dart';
import '../../../shared/widgets/feedback/app_snackbar.dart';
import '../providers/favorites_provider.dart';
import '../../../features/cart/providers/cart_provider.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
    AppSizes.radiusL,
  ),
  onTap: () {
    Navigator.pushNamed(
      context,
      RouteNames.product,
      arguments: product,
    );
  },
  child: Card(
      elevation: 0,
      color: AppColors.white,
      margin: const EdgeInsets.only(
        bottom: AppSizes.spaceL,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radiusL,
        ),
        side: const BorderSide(
          color: AppColors.border,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.spaceL,
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            //--------------------------------------------------
            // Product Image
            //--------------------------------------------------

            ClipRRect(
  borderRadius: BorderRadius.circular(
    AppSizes.radiusM,
  ),
  child: Image.asset(
    product.image,
    width: 90,
    height: 90,
    fit: BoxFit.cover,
  ),
),

            const SizedBox(
              width: AppSizes.spaceL,
            ),

            //--------------------------------------------------
            // Product Details
            //--------------------------------------------------

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style:
                        AppTextStyles.titleMedium,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceXS,
                  ),

                

                  ProductPrice(
                    product: product,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceS,
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size:
                            AppSizes.iconS,
                      ),

                      const SizedBox(
                        width:
                            AppSizes.spaceXS,
                      ),

                      Text(
                        product.rating
                            .toString(),
                        style:
                            AppTextStyles.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: AppSizes.spaceL,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child:
                            AddToCartButton(
  onPressed: () {
    context.read<CartProvider>().addToCart(product);

    AppSnackbar.showSuccess(
  context,
  AppStrings.addedToCart,
);
  },
),
                      ),

                      const SizedBox(
                        width:
                            AppSizes.spaceS,
                      ),

                      IconButton(
                        onPressed: () {
                          context
                              .read<
                                  FavoritesProvider>()
                              .remove(
                                product.id,
                              );
                        },
                        icon: const Icon(
                          Icons
                              .favorite_rounded,
                          color:
                              AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}