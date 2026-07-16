import 'package:flutter/material.dart';

import '../../../data/repositories/product_repository.dart';
import '../../../models/product/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider();

  //--------------------------------------------------
  // Variables
  //--------------------------------------------------

  final List<ProductModel> _products = [];

  ProductModel? _selectedProduct;

  bool _isLoading = false;

  int _quantity = 1;

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  List<ProductModel> get products => _products;

  ProductModel? get selectedProduct => _selectedProduct;

  bool get isLoading => _isLoading;

  int get quantity => _quantity;

  //--------------------------------------------------
  // Load All Products
  //--------------------------------------------------

  void loadProducts() {
    _isLoading = true;
    notifyListeners();

    _products
      ..clear()
      ..addAll(
        ProductRepository.getAllProducts(),
      );

    _isLoading = false;
    notifyListeners();
  }

  //--------------------------------------------------
  // Featured Products
  //--------------------------------------------------

  List<ProductModel> get featuredProducts =>
      ProductRepository.getFeaturedProducts();

  //--------------------------------------------------
  // Products By Category
  //--------------------------------------------------

  List<ProductModel> getProductsByCategory(
    String categoryId,
  ) {
    return ProductRepository.getProductsByCategory(
      categoryId,
    );
  }

  //--------------------------------------------------
  // Search Products
  //--------------------------------------------------

  List<ProductModel> searchProducts(
    String keyword,
  ) {
    if (keyword.trim().isEmpty) {
      return _products;
    }

    return ProductRepository.searchProducts(
      keyword,
    );
  }

  //--------------------------------------------------
  // Select Product
  //--------------------------------------------------

  void selectProduct(ProductModel product) {
    _selectedProduct = product;

    _quantity = 1;

    notifyListeners();
  }

  //--------------------------------------------------
  // Clear Product
  //--------------------------------------------------

  void clearSelectedProduct() {
    _selectedProduct = null;

    _quantity = 1;

    notifyListeners();
  }

  //--------------------------------------------------
  // Quantity
  //--------------------------------------------------

  void increaseQuantity() {
    _quantity++;

    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;

      notifyListeners();
    }
  }

  void resetQuantity() {
    _quantity = 1;

    notifyListeners();
  }

//--------------------------------------------------
// Favorite
//--------------------------------------------------

void toggleFavorite(String productId) {
  final index = _products.indexWhere(
    (product) => product.id == productId,
  );

  if (index == -1) return;

  final product = _products[index];

  _products[index] = product.copyWith(
    isFavorite: !product.isFavorite,
  );

  // Update selected product if it's the same product
  if (_selectedProduct != null &&
      _selectedProduct!.id == productId) {
    _selectedProduct = _products[index];
  }

  notifyListeners();
}

//--------------------------------------------------
// Favorite Products
//--------------------------------------------------

List<ProductModel> get favoriteProducts {
  return _products
      .where((product) => product.isFavorite)
      .toList();
}
  //--------------------------------------------------
  // Total Price
  //--------------------------------------------------

  double get totalPrice {
    if (_selectedProduct == null) {
      return 0;
    }

    return _selectedProduct!.price * _quantity;
  }

  //--------------------------------------------------
  // Refresh
  //--------------------------------------------------

  Future<void> refreshProducts() async {
    loadProducts();
  }
}