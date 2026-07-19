import 'package:flutter/material.dart';

import '../../../data/repositories/search_repository.dart';
import '../../../models/search/search_filter_model.dart';
import '../../../models/search/search_history_model.dart';
import '../../../models/search/search_result_model.dart';
import '../helpers/search_sort_helper.dart';
import '../../../models/product/product_model.dart';
import '../../../models/category/category_model.dart';
import '../services/search_history_service.dart';

class SearchProvider extends ChangeNotifier {
  //--------------------------------------------------
  // State
  //--------------------------------------------------

  bool _isLoading = false;

  String _query = '';

  SearchResultModel _searchResult =
      SearchResultModel.empty();

  SearchFilterModel _filter =
      SearchFilterModel.initial();

  SearchSortType _sortType =
      SearchSortType.relevance;

  List<String> _suggestions = [];

  List<SearchHistoryModel> _history = [];

  //--------------------------------------------------
  // Getters
  //--------------------------------------------------

  bool get isLoading => _isLoading;
  

  String get query => _query;

  SearchResultModel get searchResult =>
      _searchResult;

  SearchFilterModel get filter => _filter;

  SearchSortType get sortType => _sortType;

  List<String> get suggestions =>
      List.unmodifiable(_suggestions);

  List<SearchHistoryModel> get history =>
      List.unmodifiable(_history);

  //--------------------------------------------------
  // Products
  //--------------------------------------------------

List<ProductModel> get products =>
    _searchResult.products;


  //--------------------------------------------------
  // Categories
  //--------------------------------------------------

  List<CategoryModel> get categories =>
    _searchResult.categories;

  //--------------------------------------------------
  // Has Results
  //--------------------------------------------------

  bool get hasResults =>
      _searchResult.hasResults;

  //--------------------------------------------------
  // Has Query
  //--------------------------------------------------

  bool get hasQuery =>
      _query.trim().isNotEmpty;

  //--------------------------------------------------
  // Initialize
  //--------------------------------------------------

  void initialize() {
    _loadHistory();
  }

  //--------------------------------------------------
  // Search
  //--------------------------------------------------

  void search(String value) {
    _query = value;

    if (value.trim().isEmpty) {
      _searchResult =
          SearchResultModel.empty();

      _suggestions = [];

      notifyListeners();

      return;
    }

    _suggestions =
        SearchRepository.getSuggestions(value);

    final products =
        SearchRepository.searchWithFilters(
      query: value,
      filter: _filter,
    );

    final sortedProducts =
        SearchRepository.sortProducts(
      products: products,
      sortType: _sortType,
    );

    final categories =
        SearchRepository.searchCategories(value);

    _searchResult = SearchResultModel(
      products: sortedProducts,
      categories: categories,
      query: value,
    );

    notifyListeners();
  }

  //--------------------------------------------------
  // Submit Search
  //--------------------------------------------------

  void submitSearch(String value) {
    final trimmedValue = value.trim();

    if (trimmedValue.isEmpty) {
      return;
    }

    SearchHistoryService.addSearch(
      trimmedValue,
    );

    _loadHistory();

    search(trimmedValue);
  }

  //--------------------------------------------------
  // Apply Filter
  //--------------------------------------------------

  void applyFilter(
    SearchFilterModel filter,
  ) {
    _filter = filter;

    if (_query.trim().isNotEmpty) {
      search(_query);
    } else {
      notifyListeners();
    }
  }

  //--------------------------------------------------
  // Clear Filters
  //--------------------------------------------------

  void clearFilters() {
    _filter =
        SearchFilterModel.initial();

    if (_query.trim().isNotEmpty) {
      search(_query);
    } else {
      notifyListeners();
    }
  }

  //--------------------------------------------------
  // Sort
  //--------------------------------------------------

  void changeSort(
    SearchSortType sortType,
  ) {
    _sortType = sortType;

    if (_query.trim().isNotEmpty) {
      search(_query);
    } else {
      notifyListeners();
    }
  }

  //--------------------------------------------------
  // Clear Search
  //--------------------------------------------------

  void clearSearch() {
    _query = '';

    _searchResult =
        SearchResultModel.empty();

    _suggestions = [];

    notifyListeners();
  }

  //--------------------------------------------------
  // History
  //--------------------------------------------------

  void _loadHistory() {
    _history =
        SearchHistoryService.getHistory();
  }

  //--------------------------------------------------
  // Remove History
  //--------------------------------------------------

  void removeHistory(
    String query,
  ) {
    SearchHistoryService.removeSearch(
      query,
    );

    _loadHistory();

    notifyListeners();
  }

  //--------------------------------------------------
  // Clear History
  //--------------------------------------------------

  void clearHistory() {
    SearchHistoryService.clearHistory();

    _loadHistory();

    notifyListeners();
  }

  //--------------------------------------------------
  // Refresh
  //--------------------------------------------------

  Future<void> refresh() async {
    _isLoading = true;

    notifyListeners();

    await Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
    );

    if (_query.trim().isNotEmpty) {
      search(_query);
    }

    _isLoading = false;

    notifyListeners();
  }
}