import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/product_model.dart';
import '../common/custom_button.dart';
import '../common/custom_card.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onFavorite,
  });

  final ProductModel product;

  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //============================
          // Image
          //============================

          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                      AppSizes.radiusLarge,
                    ),
                  ),
                ),
                child: product.image.isNotEmpty
                    ? ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(
                          top: Radius.circular(
                            AppSizes.radiusLarge,
                          ),
                        ),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(
                        Icons.fastfood,
                        size: 60,
                        color: AppColors.secondary,
                      ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: onFavorite,
                  borderRadius:
                      BorderRadius.circular(50),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor:
                        AppColors.white,
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 4,
                        backgroundColor:
                            AppColors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.isVeg
                            ? "VEG"
                            : "NON VEG",
                        style:
                            AppTextStyles.caption.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //============================
          // Details
          //============================

          Padding(
            padding: const EdgeInsets.all(
              AppSizes.spaceM,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis,
                  style:
                      AppTextStyles.titleMedium,
                ),

                const SizedBox(height: 4),

                Text(
                  product.description,
                  maxLines: 2,
                  overflow:
                      TextOverflow.ellipsis,
                  style:
                      AppTextStyles.bodySmall,
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amber,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      product.rating.toString(),
                      style:
                          AppTextStyles.rating,
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "${AppConstants.currencySymbol}${product.price.toStringAsFixed(0)}",
                      style:
                          AppTextStyles.price,
                    ),

                    const SizedBox(width: 8),

                    if (product.oldPrice != null)
                      Text(
                        "${AppConstants.currencySymbol}${product.oldPrice!.toStringAsFixed(0)}",
                        style: AppTextStyles
                            .oldPrice,
                      ),
                  ],
                ),

                const SizedBox(
                  height: 12,
                ),

                CustomButton(
                  text: AppStrings.addToCart,
                  onPressed:
                      onAddToCart ?? () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}