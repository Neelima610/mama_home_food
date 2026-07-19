import '../../../models/search/search_history_model.dart';


class SearchHistoryService {
  SearchHistoryService._();

  //--------------------------------------------------
  // Configuration
  //--------------------------------------------------

  static const int _maxHistoryItems = 10;

  //--------------------------------------------------
  // Storage
  //--------------------------------------------------

  static final List<SearchHistoryModel> _history = [];

  //--------------------------------------------------
  // Get History
  //--------------------------------------------------

  static List<SearchHistoryModel> getHistory() {
    return List.unmodifiable(_history);
  }

  //--------------------------------------------------
  // Add Search
  //--------------------------------------------------

  static void addSearch(String query) {
    final trimmedQuery = query.trim();

    if (trimmedQuery.isEmpty) {
      return;
    }

    //--------------------------------------------------
    // Remove Duplicate
    //--------------------------------------------------

    _history.removeWhere(
      (item) =>
          item.query.toLowerCase() ==
          trimmedQuery.toLowerCase(),
    );

    //--------------------------------------------------
    // Add To Beginning
    //--------------------------------------------------

    _history.insert(
      0,
      SearchHistoryModel(
        query: trimmedQuery,
        searchedAt: DateTime.now(),
      ),
    );

    //--------------------------------------------------
    // Limit History
    //--------------------------------------------------

    if (_history.length > _maxHistoryItems) {
      _history.removeRange(
        _maxHistoryItems,
        _history.length,
      );
    }
  }

  //--------------------------------------------------
  // Remove Search
  //--------------------------------------------------

  static void removeSearch(String query) {
    _history.removeWhere(
      (item) =>
          item.query.toLowerCase() ==
          query.toLowerCase(),
    );
  }

  //--------------------------------------------------
  // Clear History
  //--------------------------------------------------

  static void clearHistory() {
    _history.clear();
  }

  //--------------------------------------------------
  // Has History
  //--------------------------------------------------

  static bool get hasHistory {
    return _history.isNotEmpty;
  }
}