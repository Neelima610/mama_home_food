
// product_provider.dart
import 'package:flutter/material.dart';

import '../../../data/repositories/product_repository.dart';
import '../../../models/product/product_model.dart';

class ProductProvider extends ChangeNotifier {
  

  //--------------------------------------------------
  // State
  //--------------------------------------------------

  bool _isLoading = false;

  ProductModel? _selectedProduct;

  int _quantity = 1;

  String _searchQuery = "";

  final Set<String> _favoriteIds = {};

  List<ProductModel> _products = [];

  List<ProductModel> _filteredProducts = [];

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  bool get isLoading => _isLoading;

  ProductModel? get selectedProduct =>
      _selectedProduct;

  int get quantity => _quantity;

  String get searchQuery =>
      _searchQuery;

  List<ProductModel> get products =>
      _products;

  List<ProductModel> get filteredProducts =>
      _filteredProducts;

  List<ProductModel> get featuredProducts =>
      ProductRepository.getFeaturedProducts();

  List<ProductModel> get bestSellerProducts =>
      ProductRepository.getBestSellerProducts();

  List<ProductModel> get recommendedProducts =>
      ProductRepository.getRecommendedProducts();

  List<ProductModel> get popularProducts =>
      ProductRepository.getPopularProducts();

  List<ProductModel> get offerProducts =>
      ProductRepository.getOfferProducts();

  //--------------------------------------------------
  // Initial Load
  //--------------------------------------------------

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    _products =
        ProductRepository.getAllProducts();

    _filteredProducts =
        List.from(_products);

    _isLoading = false;

    notifyListeners();
  }

  //--------------------------------------------------
  // Product
  //--------------------------------------------------

  void selectProduct(
    ProductModel product,
  ) {
    _selectedProduct = product;

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
    if (_quantity == 1) return;

    _quantity--;

    notifyListeners();
  }

  void resetQuantity() {
    _quantity = 1;

    notifyListeners();
  }

  //--------------------------------------------------
  // Favorites
  //--------------------------------------------------

  bool isFavorite(
    String id,
  ) {
    return _favoriteIds.contains(id);
  }

  void toggleFavorite(
    ProductModel product,
  ) {
    if (_favoriteIds.contains(product.id)) {
      _favoriteIds.remove(product.id);
    } else {
      _favoriteIds.add(product.id);
    }

    notifyListeners();
  }

  //--------------------------------------------------
  // Search
  //--------------------------------------------------

  void search(
    String value,
  ) {
    _searchQuery = value;

    _filteredProducts =
        ProductRepository.searchProducts(
      value,
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Category
  //--------------------------------------------------

  void loadCategoryProducts(
    String categoryId,
  ) {
    _filteredProducts =
        ProductRepository
            .getProductsByCategory(
      categoryId,
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Similar
  //--------------------------------------------------

  List<ProductModel> getSimilarProducts(
    ProductModel product,
  ) {
    return ProductRepository
        .getSimilarProducts(product);
  }

  //--------------------------------------------------
  // Sorting
  //--------------------------------------------------

  void sortByPriceLowToHigh() {
    _filteredProducts.sort(
      (a, b) =>
          a.price.compareTo(b.price),
    );

    notifyListeners();
  }

  void sortByPriceHighToLow() {
    _filteredProducts.sort(
      (a, b) =>
          b.price.compareTo(a.price),
    );

    notifyListeners();
  }

  void sortByRating() {
    _filteredProducts.sort(
      (a, b) =>
          b.rating.compareTo(a.rating),
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Refresh
  //--------------------------------------------------

  Future<void> refresh() async {
    await loadProducts();
  }

  //--------------------------------------------------
  // Clear Search
  //--------------------------------------------------

  void clearSearch() {
    _searchQuery = "";

    _filteredProducts =
        List.from(_products);

    notifyListeners();
  }
}