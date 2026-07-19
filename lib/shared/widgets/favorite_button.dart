
// favorite_button.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';
import '../../features/favorites/providers/favorites_provider.dart';
import '../../models/product/product_model.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.product,
    this.size = AppSizes.favoriteButtonSize,
    this.iconSize = AppSizes.favoriteIconSize,
    this.backgroundColor = AppColors.white,
    this.showShadow = true,
  });

  final ProductModel product;

  final double size;
  final double iconSize;
  final Color backgroundColor;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (_, favorites, __) {
        final isFavorite =
            favorites.isFavorite(product.id);

        return Material(
          color: Colors.transparent,
          child: InkWell(
            key: const ValueKey(
              AppKeys.productFavoriteButton,
            ),
            borderRadius:
                BorderRadius.circular(100),
            onTap: () {
              favorites.toggle(product);
            },
            child: AnimatedContainer(
              duration:
                  AppDurations.animationDuration,
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
                boxShadow: showShadow
                    ? const [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: AnimatedSwitcher(
                duration:
                    AppDurations.animationDuration,
                transitionBuilder:
                    (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite
                      ? Icons.favorite_rounded
                      : Icons
                          .favorite_border_rounded,
                  key: ValueKey(isFavorite),
                  size: iconSize,
                  color: isFavorite
                      ? AppColors.favorite
                      : AppColors.textMedium,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}