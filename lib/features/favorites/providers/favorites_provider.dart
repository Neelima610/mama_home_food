
// favorites_provider.dart
import 'package:flutter/material.dart';

import '../../../models/product/product_model.dart';

class FavoritesProvider extends ChangeNotifier {
  FavoritesProvider();

  //--------------------------------------------------
  // Favorites List
  //--------------------------------------------------

  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites =>
      List.unmodifiable(_favorites);

  //--------------------------------------------------
  // Count
  //--------------------------------------------------

  int get count => _favorites.length;

  //--------------------------------------------------
  // Check Favorite
  //--------------------------------------------------

  bool isFavorite(String productId) {
    return _favorites.any(
      (product) => product.id == productId,
    );
  }

  //--------------------------------------------------
  // Add
  //--------------------------------------------------

  void add(ProductModel product) {
    if (isFavorite(product.id)) return;

    _favorites.add(product);
    notifyListeners();
  }

  //--------------------------------------------------
  // Remove
  //--------------------------------------------------

  void remove(String productId) {
    _favorites.removeWhere(
      (product) => product.id == productId,
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Toggle
  //--------------------------------------------------

  void toggle(ProductModel product) {
    if (isFavorite(product.id)) {
      remove(product.id);
    } else {
      add(product);
    }
  }

  //--------------------------------------------------
  // Clear
  //--------------------------------------------------

  void clear() {
    _favorites.clear();
    notifyListeners();
  }
}