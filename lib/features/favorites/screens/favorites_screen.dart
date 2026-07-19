
// favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../providers/favorites_provider.dart';
import '../widgets/favorite_item.dart';
import '../widgets/favorites_app_bar.dart';
import '../widgets/favorites_empty_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavoritesProvider>();

    return Scaffold(
      appBar: const FavoritesAppBar(),
      body: SafeArea(
        child: provider.favorites.isEmpty
            ? const FavoritesEmptyView()
            : ListView.separated(
                padding: const EdgeInsets.all(
                  AppSizes.screenPadding,
                ),
                itemCount: provider.favorites.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(
                  height: AppSizes.spaceL,
                ),
                itemBuilder: (context, index) {
                  final product =
                      provider.favorites[index];

                  return FavoriteItem(
                    product: product,
                  );
                },
              ),
      ),
    );
  }
}