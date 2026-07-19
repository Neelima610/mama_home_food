import '../../../models/product/product_model.dart';

enum SearchSortType {
  relevance,
  priceLowToHigh,
  priceHighToLow,
  rating,
  popularity,
  discount,
}

class SearchSortHelper {
  SearchSortHelper._();

  static List<ProductModel> sort({
    required List<ProductModel> products,
    required SearchSortType sortType,
  }) {
    final sorted =
        List<ProductModel>.from(products);

    switch (sortType) {
      case SearchSortType.relevance:
        break;

      case SearchSortType.priceLowToHigh:
        sorted.sort(
          (a, b) =>
              a.price.compareTo(b.price),
        );
        break;

      case SearchSortType.priceHighToLow:
        sorted.sort(
          (a, b) =>
              b.price.compareTo(a.price),
        );
        break;

      case SearchSortType.rating:
        sorted.sort(
          (a, b) =>
              b.rating.compareTo(a.rating),
        );
        break;

      case SearchSortType.popularity:
        sorted.sort(
          (a, b) =>
              b.totalReviews.compareTo(
            a.totalReviews,
          ),
        );
        break;

      case SearchSortType.discount:
        sorted.sort(
          (a, b) =>
              b.discountPercentage.compareTo(
            a.discountPercentage,
          ),
        );
        break;
    }

    return sorted;
  }
}