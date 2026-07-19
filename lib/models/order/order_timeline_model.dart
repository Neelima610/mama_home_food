 
 
 // order_timeline_model.dart

import 'order_status.dart';

class OrderTimelineModel {
  const OrderTimelineModel({
    required this.status,
    required this.time,
    this.completed = false,
  });

  final OrderStatus status;

  final DateTime time;

  final bool completed;

  OrderTimelineModel copyWith({
    OrderStatus? status,
    DateTime? time,
    bool? completed,
  }) {
    return OrderTimelineModel(
      status: status ?? this.status,
      time: time ?? this.time,
      completed:
          completed ?? this.completed,
    );
  }
}