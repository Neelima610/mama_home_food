import '../cart/cart_model.dart';

class OrderModel {
  const OrderModel({
    required this.id,
    required this.items,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.grandTotal,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.status,
    required this.orderedAt,
    this.deliveredAt,
  });

  //--------------------------------------------------
  // Order Information
  //--------------------------------------------------

  final String id;

  final List<CartModel> items;

  //--------------------------------------------------
  // Price
  //--------------------------------------------------

  final double subtotal;

  final double deliveryCharge;

  final double discount;

  final double grandTotal;

  //--------------------------------------------------
  // Delivery
  //--------------------------------------------------

  final String deliveryAddress;

  final String paymentMethod;

  //--------------------------------------------------
  // Status
  //--------------------------------------------------

  final OrderStatus status;

  //--------------------------------------------------
  // Time
  //--------------------------------------------------

  final DateTime orderedAt;

  final DateTime? deliveredAt;

   //--------------------------------------------------
  // Computed Getters
  //--------------------------------------------------

  bool get isPending =>
      status == OrderStatus.pending;

  bool get isConfirmed =>
      status == OrderStatus.confirmed;

  bool get isPreparing =>
      status == OrderStatus.preparing;

  bool get isOutForDelivery =>
      status == OrderStatus.outForDelivery;

  bool get isDelivered =>
      status == OrderStatus.delivered;

  bool get isCancelled =>
      status == OrderStatus.cancelled;


  //--------------------------------------------------
  // Copy With
  //--------------------------------------------------

  OrderModel copyWith({
    String? id,
    List<CartModel>? items,
    double? subtotal,
    double? deliveryCharge,
    double? discount,
    double? grandTotal,
    String? deliveryAddress,
    String? paymentMethod,
    OrderStatus? status,
    DateTime? orderedAt,
    DateTime? deliveredAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      deliveryCharge:
          deliveryCharge ?? this.deliveryCharge,
      discount: discount ?? this.discount,
      grandTotal:
          grandTotal ?? this.grandTotal,
      deliveryAddress:
          deliveryAddress ??
              this.deliveryAddress,
      paymentMethod:
          paymentMethod ??
              this.paymentMethod,
      status: status ?? this.status,
      orderedAt:
          orderedAt ?? this.orderedAt,
      deliveredAt:
          deliveredAt ?? this.deliveredAt,
    );
  }
}

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  outForDelivery,
  delivered,
  cancelled,
}