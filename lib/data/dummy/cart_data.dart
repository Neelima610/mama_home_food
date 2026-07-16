import '../../models/cart/cart_model.dart';
import 'product_data.dart';

class CartData {
  CartData._();

  static final List<CartModel> cartItems = [
    CartModel(
      product: ProductData.products[0],
      quantity: 2,
    ),

    CartModel(
      product: ProductData.products[2],
      quantity: 1,
    ),
  ];
}