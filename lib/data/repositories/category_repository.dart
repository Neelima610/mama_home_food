import '../../models/category/category_model.dart';
import '../dummy/category_data.dart';

class CategoryRepository {
  CategoryRepository._();

  /// Returns all categories
  static List<CategoryModel> getAllCategories() {
    return CategoryData.categories;
  }

  /// Returns category by id
  static CategoryModel? getCategoryById(String id) {
    try {
      return CategoryData.categories.firstWhere(
        (category) => category.id == id,
      );
    } catch (_) {
      return null;
    }
  }
}