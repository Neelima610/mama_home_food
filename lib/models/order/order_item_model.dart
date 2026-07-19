
// order_item_model.dart

import '../../../models/product/product_model.dart';

class OrderItemModel {
  const OrderItemModel({
    required this.product,
    required this.quantity,
    required this.price,
  });

  final ProductModel product;

  final int quantity;

  final double price;

  double get total =>
      quantity * price;

  OrderItemModel copyWith({
    ProductModel? product,
    int? quantity,
    double? price,
  }) {
    return OrderItemModel(
      product: product ?? this.product,
      quantity:
          quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
