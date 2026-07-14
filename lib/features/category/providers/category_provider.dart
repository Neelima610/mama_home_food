import 'package:flutter/material.dart';

import '../../../data/repositories/repositories.dart';
import '../../../models/category/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> get categories =>
      _categories;

  void loadCategories() {
    _categories
      ..clear()
      ..addAll(
        CategoryRepository.getAllCategories(),
      );

    notifyListeners();
  }
}