import '../../../models/product/product_model.dart';
import '../../../models/search/search_filter_model.dart';


class SearchFilterHelper {
  SearchFilterHelper._();

  static List<ProductModel> applyFilters({
    required List<ProductModel> products,
    required SearchFilterModel filter,
  }) {
    return products.where((product) {
      //--------------------------------------------------
      // Availability
      //--------------------------------------------------

      if (filter.onlyAvailable &&
          !product.isAvailable) {
        return false;
      }

      //--------------------------------------------------
      // Veg / Non-Veg
      //--------------------------------------------------

      if (filter.isVeg != null &&
          product.isVeg != filter.isVeg) {
        return false;
      }

      //--------------------------------------------------
      // Best Seller
      //--------------------------------------------------

      if (filter.isBestSeller &&
          !product.isBestSeller) {
        return false;
      }

      //--------------------------------------------------
      // Recommended
      //--------------------------------------------------

      if (filter.isRecommended &&
          !product.isRecommended) {
        return false;
      }

      //--------------------------------------------------
      // Featured
      //--------------------------------------------------

      if (filter.isFeatured &&
          !product.isFeatured) {
        return false;
      }

      //--------------------------------------------------
      // Discount
      //--------------------------------------------------

      if (filter.hasDiscount &&
          product.discountPercentage <= 0) {
        return false;
      }

      //--------------------------------------------------
      // Minimum Price
      //--------------------------------------------------

      if (filter.minimumPrice != null &&
          product.price <
              filter.minimumPrice!) {
        return false;
      }

      //--------------------------------------------------
      // Maximum Price
      //--------------------------------------------------

      if (filter.maximumPrice != null &&
          product.price >
              filter.maximumPrice!) {
        return false;
      }

      //--------------------------------------------------
      // Minimum Rating
      //--------------------------------------------------

      if (filter.minimumRating != null &&
          product.rating <
              filter.minimumRating!) {
        return false;
      }

      return true;
    }).toList();
  }
}