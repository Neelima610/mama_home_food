
// product_repository.dart
import '../../models/product/product_model.dart';
import '../dummy/product_data.dart';

class ProductRepository {
  ProductRepository._();

  static final List<ProductModel> _products =
      ProductData.products;

  //--------------------------------------------------
  // All Products
  //--------------------------------------------------

  static List<ProductModel> getAllProducts() {
    return List.unmodifiable(_products);
  }

  //--------------------------------------------------
  // Product By Id
  //--------------------------------------------------

  static ProductModel? getProductById(
    String id,
  ) {
    try {
      return _products.firstWhere(
        (e) => e.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------
  // Category
  //--------------------------------------------------

  static List<ProductModel> getProductsByCategory(
    String categoryId,
  ) {
    return _products
        .where(
          (e) =>
              e.categoryId == categoryId &&
              e.isAvailable,
        )
        .toList();
  }

  //--------------------------------------------------
  // Featured
  //--------------------------------------------------

  static List<ProductModel> getFeaturedProducts() {
    return _products
        .where(
          (e) =>
              e.isFeatured &&
              e.isAvailable,
        )
        .toList();
  }

  //--------------------------------------------------
  // Best Sellers
  //--------------------------------------------------

  static List<ProductModel> getBestSellerProducts() {
    return _products
        .where(
          (e) =>
              e.isBestSeller &&
              e.isAvailable,
        )
        .toList();
  }

  //--------------------------------------------------
  // Recommended
  //--------------------------------------------------

  static List<ProductModel> getRecommendedProducts() {
    return _products
        .where(
          (e) =>
              e.isRecommended &&
              e.isAvailable,
        )
        .toList();
  }

  //--------------------------------------------------
  // Top Rated
  //--------------------------------------------------

  static List<ProductModel> getTopRatedProducts() {
    final list =
        List<ProductModel>.from(_products);

    list.sort(
      (a, b) =>
          b.rating.compareTo(a.rating),
    );

    return list;
  }

  //--------------------------------------------------
  // Offers
  //--------------------------------------------------

  static List<ProductModel> getOfferProducts() {
    return _products
        .where(
          (e) =>
              e.discountPercentage > 0 &&
              e.isAvailable,
        )
        .toList();
  }

  //--------------------------------------------------
  // Search
  //--------------------------------------------------

  static List<ProductModel> searchProducts(
    String keyword,
  ) {
    if (keyword.trim().isEmpty) {
      return getAllProducts();
    }

    final query =
        keyword.toLowerCase();

    return _products.where((product) {
      return product.name
              .toLowerCase()
              .contains(query) ||
          product.subtitle
              .toLowerCase()
              .contains(query) ||
          product.description
              .toLowerCase()
              .contains(query) ||
          product.tags.any(
            (tag) => tag
                .toLowerCase()
                .contains(query),
          );
    }).toList();
  }

  //--------------------------------------------------
  // Similar Products
  //--------------------------------------------------

  static List<ProductModel> getSimilarProducts(
    ProductModel product,
  ) {
    return _products
        .where(
          (e) =>
              e.categoryId ==
                  product.categoryId &&
              e.id != product.id,
        )
        .take(10)
        .toList();
  }

  //--------------------------------------------------
  // New Arrivals
  //--------------------------------------------------

  static List<ProductModel> getNewArrivals() {
    return _products.reversed
        .take(10)
        .toList();
  }

  //--------------------------------------------------
  // Popular
  //--------------------------------------------------

  static List<ProductModel> getPopularProducts() {
    final list =
        List<ProductModel>.from(_products);

    list.sort(
      (a, b) => b.totalReviews
          .compareTo(a.totalReviews),
    );

    return list.take(10).toList();
  }
}