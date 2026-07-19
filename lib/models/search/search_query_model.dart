import 'package:flutter/foundation.dart';

@immutable
class SearchQueryModel {
  final String query;
  final DateTime createdAt;

  const SearchQueryModel({
    required this.query,
    required this.createdAt,
  });

  SearchQueryModel copyWith({
    String? query,
    DateTime? createdAt,
  }) {
    return SearchQueryModel(
      query: query ?? this.query,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory SearchQueryModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return SearchQueryModel(
      query: map['query'] ?? '',
      createdAt: DateTime.tryParse(
            map['createdAt'] ?? '',
          ) ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'SearchQueryModel(query: $query)';
  }
}