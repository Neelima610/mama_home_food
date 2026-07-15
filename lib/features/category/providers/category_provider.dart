import 'package:flutter/material.dart';

import '../../../models/product/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class CategoryProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void loadProducts(String categoryId) {
    _isLoading = true;
    notifyListeners();

    _products = ProductRepository.getProductsByCategory(
      categoryId,
    );

    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _products = [];
    notifyListeners();
  }
}