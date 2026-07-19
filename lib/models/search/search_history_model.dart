import 'package:flutter/foundation.dart';

@immutable
class SearchHistoryModel {
  final String query;

  final DateTime searchedAt;

  const SearchHistoryModel({
    required this.query,
    required this.searchedAt,
  });

  SearchHistoryModel copyWith({
    String? query,
    DateTime? searchedAt,
  }) {
    return SearchHistoryModel(
      query: query ?? this.query,
      searchedAt:
          searchedAt ?? this.searchedAt,
    );
  }

  factory SearchHistoryModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return SearchHistoryModel(
      query: map['query'] ?? '',
      searchedAt: DateTime.tryParse(
            map['searchedAt'] ?? '',
          ) ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'searchedAt':
          searchedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'SearchHistoryModel(query: $query)';
  }
}