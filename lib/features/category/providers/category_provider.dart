import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../models/category/category_model.dart';
import '../../../models/product/product_model.dart';

class CategoryProvider extends ChangeNotifier {
  //------------------------------------------------------
  // Categories
  //------------------------------------------------------

  final List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  void loadCategories() {
    _categories
      ..clear()
      ..addAll(
        CategoryRepository.getAllCategories(),
      );

    notifyListeners();
  }

  //------------------------------------------------------
  // Products
  //------------------------------------------------------

  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void loadProducts(String categoryId) {
    _isLoading = true;
    notifyListeners();

    _products
      ..clear()
      ..addAll(
        ProductRepository.getProductsByCategory(
          categoryId,
        ),
      );

    _isLoading = false;
    notifyListeners();
  }

  void clearProducts() {
    _products.clear();
    notifyListeners();
  }
}