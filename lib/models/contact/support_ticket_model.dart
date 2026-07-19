class SupportTicketModel {
  const SupportTicketModel({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.subject,
    required this.message,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String userId;
  final String categoryId;
  final String subject;
  final String message;
  final String status;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory SupportTicketModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return SupportTicketModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      categoryId: map['categoryId'] ?? '',
      subject: map['subject'] ?? '',
      message: map['message'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'categoryId': categoryId,
      'subject': subject,
      'message': message,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  SupportTicketModel copyWith({
    String? id,
    String? userId,
    String? categoryId,
    String? subject,
    String? message,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SupportTicketModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}