import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/product_repository.dart';

import '../../../models/category/category_model.dart';
import '../../../models/product/product_model.dart';

import '../../features/search/helpers/search_filter_helper.dart';
import '../../features/search/helpers/search_helper.dart';
import '../../features/search/helpers/search_sort_helper.dart';
import '../../models/search/search_filter_model.dart';
import '../../models/search/search_result_model.dart';


class SearchRepository {
  SearchRepository._();

  //--------------------------------------------------
  // Search Products
  //--------------------------------------------------

  static List<ProductModel> searchProducts(
    String query,
  ) {
    return SearchHelper.searchProducts(
      products:
          ProductRepository.getAllProducts(),
      query: query,
    );
  }

  //--------------------------------------------------
  // Search Categories
  //--------------------------------------------------

  static List<CategoryModel> searchCategories(
    String query,
  ) {
    return SearchHelper.searchCategories(
      categories:
          CategoryRepository.getAllCategories(),
      query: query,
    );
  }

  //--------------------------------------------------
  // Search Products + Categories
  //--------------------------------------------------

  static SearchResultModel search(
    String query,
  ) {
    return SearchResultModel(
      products: searchProducts(query),
      categories: searchCategories(query),
      query: query,
    );
  }

  //--------------------------------------------------
  // Search With Filters
  //--------------------------------------------------

  static List<ProductModel> searchWithFilters({
    required String query,
    required SearchFilterModel filter,
  }) {
    final products = searchProducts(query);

    return SearchFilterHelper.applyFilters(
      products: products,
      filter: filter,
    );
  }

  //--------------------------------------------------
  // Sort Products
  //--------------------------------------------------

  static List<ProductModel> sortProducts({
    required List<ProductModel> products,
    required SearchSortType sortType,
  }) {
    return SearchSortHelper.sort(
      products: products,
      sortType: sortType,
    );
  }

  //--------------------------------------------------
  // Suggestions
  //--------------------------------------------------

  static List<String> getSuggestions(
    String query,
  ) {
    return SearchHelper.getSuggestions(
      products:
          ProductRepository.getAllProducts(),
      query: query,
    );
  }

  //--------------------------------------------------
  // Popular Suggestions
  //--------------------------------------------------

  static List<String> getPopularSuggestions() {
    final products =
        ProductRepository.getPopularProducts();

    return products
        .map(
          (product) => product.name,
        )
        .take(10)
        .toList();
  }
}