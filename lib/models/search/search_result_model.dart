import '../../../models/product/product_model.dart';
import '../../../models/category/category_model.dart';

class SearchResultModel {
  final List<ProductModel> products;

  final List<CategoryModel> categories;

  final String query;

  const SearchResultModel({
    required this.products,
    required this.categories,
    required this.query,
  });

  //--------------------------------------------------
  // Empty Result
  //--------------------------------------------------

  factory SearchResultModel.empty({
    String query = '',
  }) {
    return SearchResultModel(
      products: const [],
      categories: const [],
      query: query,
    );
  }

  //--------------------------------------------------
  // Has Results
  //--------------------------------------------------

  bool get hasResults {
    return products.isNotEmpty ||
        categories.isNotEmpty;
  }

  //--------------------------------------------------
  // Total Results
  //--------------------------------------------------

  int get totalResults {
    return products.length +
        categories.length;
  }

  //--------------------------------------------------
  // Debug
  //--------------------------------------------------

  @override
  String toString() {
    return '''
SearchResultModel(
  query: $query,
  products: ${products.length},
  categories: ${categories.length},
)
''';
  }
}