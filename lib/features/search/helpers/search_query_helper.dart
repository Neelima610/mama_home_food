class SearchQueryHelper {
  SearchQueryHelper._();

  //--------------------------------------------------
  // Normalize Query
  //--------------------------------------------------

  static String normalize(
    String query,
  ) {
    return query
        .trim()
        .toLowerCase()
        .replaceAll(
          RegExp(r'\s+'),
          ' ',
        );
  }

  //--------------------------------------------------
  // Is Valid Query
  //--------------------------------------------------

  static bool isValid(
    String query,
  ) {
    return normalize(query).isNotEmpty;
  }

  //--------------------------------------------------
  // Query Words
  //--------------------------------------------------

  static List<String> getWords(
    String query,
  ) {
    final normalized =
        normalize(query);

    if (normalized.isEmpty) {
      return [];
    }

    return normalized.split(' ');
  }

  //--------------------------------------------------
  // Contains Query
  //--------------------------------------------------

  static bool containsQuery({
    required String text,
    required String query,
  }) {
    final normalizedText =
        normalize(text);

    final normalizedQuery =
        normalize(query);

    if (normalizedQuery.isEmpty) {
      return true;
    }

    return normalizedText
        .contains(normalizedQuery);
  }
}