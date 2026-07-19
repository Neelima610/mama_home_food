

// order_model.dart
import '../address/address_model.dart';
import '../payment/payment_method_type.dart';
import '../payment/payment_status.dart';
import 'order_item_model.dart';
import 'order_status.dart';
import 'order_timeline_model.dart';

class OrderModel {
  const OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.quantity,

    //--------------------------------------------------
    // Amount
    //--------------------------------------------------

    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.grandTotal,

    //--------------------------------------------------
    // Payment
    //--------------------------------------------------

    required this.paymentMethod,
    required this.paymentStatus,
    required this.transactionId,

    //--------------------------------------------------
    // Order
    //--------------------------------------------------

    required this.orderStatus,

    //--------------------------------------------------
    // Address
    //--------------------------------------------------

    required this.deliveryAddress,

    //--------------------------------------------------
    // Dates
    //--------------------------------------------------

    required this.orderDate,
    required this.estimatedDeliveryTime,

    this.acceptedTime,
    this.preparingTime,
    this.outForDeliveryTime,
    this.deliveredTime,

    //--------------------------------------------------
    // Optional
    //--------------------------------------------------

    this.couponCode,
    this.deliveryBoyName,
    this.deliveryBoyPhone,
    this.deliveryNotes,
    this.cancellationReason,

    //--------------------------------------------------
    // Timeline
    //--------------------------------------------------

    this.timeline = const [],
  });

  //--------------------------------------------------
  // Order Details
  //--------------------------------------------------

  final String id;

  final String userId;

  final List<OrderItemModel> items;
  final int quantity;

  //--------------------------------------------------
  // Amount
  //--------------------------------------------------

  final double subtotal;

  final double deliveryCharge;

  final double discount;

  final double grandTotal;

  //--------------------------------------------------
  // Payment
  //--------------------------------------------------

  final PaymentMethodType paymentMethod;

  final PaymentStatus paymentStatus;

  final String transactionId;

  //--------------------------------------------------
  // Order Status
  //--------------------------------------------------

  final OrderStatus orderStatus;

  //--------------------------------------------------
  // Delivery Address
  //--------------------------------------------------

  final AddressModel deliveryAddress;

  //--------------------------------------------------
  // Dates
  //--------------------------------------------------

  final DateTime orderDate;

  final DateTime estimatedDeliveryTime;

  final DateTime? acceptedTime;

  final DateTime? preparingTime;

  final DateTime? outForDeliveryTime;

  final DateTime? deliveredTime;

  //--------------------------------------------------
  // Delivery Information
  //--------------------------------------------------

  final String? deliveryBoyName;

  final String? deliveryBoyPhone;

  final String? deliveryNotes;

  //--------------------------------------------------
  // Coupon
  //--------------------------------------------------

  final String? couponCode;

  //--------------------------------------------------
  // Cancellation
  //--------------------------------------------------

  final String? cancellationReason;

  //--------------------------------------------------
  // Timeline
  //--------------------------------------------------

  final List<OrderTimelineModel> timeline;

  //--------------------------------------------------
  // Total Products
  //--------------------------------------------------

  int get totalProducts =>
      items.length;

  //--------------------------------------------------
  // Is Delivered
  //--------------------------------------------------

  bool get isDelivered =>
      orderStatus ==
      OrderStatus.delivered;

  //--------------------------------------------------
  // Is Cancelled
  //--------------------------------------------------

  bool get isCancelled =>
      orderStatus ==
      OrderStatus.cancelled;

  //--------------------------------------------------
  // Is Active
  //--------------------------------------------------

  bool get isActive =>
      !isDelivered &&
      !isCancelled;

  //--------------------------------------------------
  // CopyWith
  //--------------------------------------------------

  OrderModel copyWith({
    String? id,
    String? userId,
    List<OrderItemModel>? items,
    int? quantity,
    double? subtotal,
    double? deliveryCharge,
    double? discount,
    double? grandTotal,
    PaymentMethodType? paymentMethod,
    PaymentStatus? paymentStatus,
    String? transactionId,
    OrderStatus? orderStatus,
    AddressModel? deliveryAddress,
    DateTime? orderDate,
    DateTime? estimatedDeliveryTime,
    DateTime? acceptedTime,
    DateTime? preparingTime,
    DateTime? outForDeliveryTime,
    DateTime? deliveredTime,
    String? couponCode,
    String? deliveryBoyName,
    String? deliveryBoyPhone,
    String? deliveryNotes,
    String? cancellationReason,
    List<OrderTimelineModel>? timeline,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
      deliveryCharge:
          deliveryCharge ??
              this.deliveryCharge,
      discount:
          discount ?? this.discount,
      grandTotal:
          grandTotal ??
              this.grandTotal,
      paymentMethod:
          paymentMethod ??
              this.paymentMethod,
      paymentStatus:
          paymentStatus ??
              this.paymentStatus,
      transactionId:
          transactionId ??
              this.transactionId,
      orderStatus:
          orderStatus ??
              this.orderStatus,
      deliveryAddress:
          deliveryAddress ??
              this.deliveryAddress,
      orderDate:
          orderDate ??
              this.orderDate,
      estimatedDeliveryTime:
          estimatedDeliveryTime ??
              this
                  .estimatedDeliveryTime,
      acceptedTime:
          acceptedTime ??
              this.acceptedTime,
      preparingTime:
          preparingTime ??
              this.preparingTime,
      outForDeliveryTime:
          outForDeliveryTime ??
              this
                  .outForDeliveryTime,
      deliveredTime:
          deliveredTime ??
              this.deliveredTime,
      couponCode:
          couponCode ??
              this.couponCode,
      deliveryBoyName:
          deliveryBoyName ??
              this.deliveryBoyName,
      deliveryBoyPhone:
          deliveryBoyPhone ??
              this.deliveryBoyPhone,
      deliveryNotes:
          deliveryNotes ??
              this.deliveryNotes,
      cancellationReason:
          cancellationReason ??
              this
                  .cancellationReason,
      timeline:
          timeline ??
              this.timeline,
    );
  }
}