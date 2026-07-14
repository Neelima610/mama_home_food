import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../models/product/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void loadProducts() {
    _products
      ..clear()
      ..addAll(
        ProductRepository.getAllProducts(),
      );

    notifyListeners();
  }

  List<ProductModel> get featuredProducts {
    return _products
        .where((product) => product.isFeatured)
        .toList();
  }

  List<ProductModel> getProductsByCategory(
    String categoryId,
  ) {
    return _products
        .where(
          (product) =>
              product.categoryId == categoryId,
        )
        .toList();
  }

  void search(String keyword) {
    _products
      ..clear()
      ..addAll(
        ProductRepository.searchProducts(
          keyword,
        ),
      );

    notifyListeners();
  }
}