import '../../../models/product/product_model.dart';
import '../../../models/category/category_model.dart';

import 'search_query_helper.dart';

class SearchHelper {
  SearchHelper._();

  //--------------------------------------------------
  // Search Products
  //--------------------------------------------------

  static List<ProductModel> searchProducts({
    required List<ProductModel> products,
    required String query,
  }) {
    final normalizedQuery =
        SearchQueryHelper.normalize(query);

    if (normalizedQuery.isEmpty) {
      return [];
    }

    return products.where((product) {
      final searchableText = [
        product.name,
        product.subtitle,
        product.description,
        ...product.tags,
        ...product.ingredients,
      ].join(' ');

      return SearchQueryHelper.containsQuery(
        text: searchableText,
        query: normalizedQuery,
      );
    }).toList();
  }

  //--------------------------------------------------
  // Search Categories
  //--------------------------------------------------

  static List<CategoryModel> searchCategories({
    required List<CategoryModel> categories,
    required String query,
  }) {
    final normalizedQuery =
        SearchQueryHelper.normalize(query);

    if (normalizedQuery.isEmpty) {
      return [];
    }

    return categories.where((category) {
      return SearchQueryHelper.containsQuery(
        text: category.name,
        query: normalizedQuery,
      );
    }).toList();
  }

  //--------------------------------------------------
  // Suggestions
  //--------------------------------------------------

  static List<String> getSuggestions({
    required List<ProductModel> products,
    required String query,
  }) {
    final normalizedQuery =
        SearchQueryHelper.normalize(query);

    if (normalizedQuery.isEmpty) {
      return [];
    }

    final suggestions = <String>{};

    for (final product in products) {
      if (product.name
          .toLowerCase()
          .contains(normalizedQuery)) {
        suggestions.add(product.name);
      }

      for (final tag in product.tags) {
        if (tag
            .toLowerCase()
            .contains(normalizedQuery)) {
          suggestions.add(tag);
        }
      }
    }

    return suggestions.take(8).toList();
  }
}