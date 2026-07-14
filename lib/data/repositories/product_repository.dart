import '../../models/product/product_model.dart';
import '../dummy/product_data.dart';

class ProductRepository {
  ProductRepository._();

  /// Returns all products
  static List<ProductModel> getAllProducts() {
    return ProductData.products;
  }

  /// Returns featured products
  static List<ProductModel> getFeaturedProducts() {
    return ProductData.products
        .where((product) => product.isFeatured)
        .toList();
  }

  /// Returns products by category
  static List<ProductModel> getProductsByCategory(
    String categoryId,
  ) {
    return ProductData.products
        .where(
          (product) => product.categoryId == categoryId,
        )
        .toList();
  }

  /// Returns a single product
  static ProductModel? getProductById(
    String productId,
  ) {
    try {
      return ProductData.products.firstWhere(
        (product) => product.id == productId,
      );
    } catch (_) {
      return null;
    }
  }

  /// Search products
  static List<ProductModel> searchProducts(
    String keyword,
  ) {
    return ProductData.products.where((product) {
      return product.name
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
          product.description
              .toLowerCase()
              .contains(keyword.toLowerCase());
    }).toList();
  }
}