import '../product/product_model.dart';

class CartModel {
  final ProductModel product;
  final int quantity;

  const CartModel({
    required this.product,
    required this.quantity,
  });

  double get totalPrice =>
      product.price * quantity;

  CartModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  factory CartModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return CartModel(
      product: ProductModel.fromMap(
        map['product'],
      ),
      quantity: map['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CartModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}