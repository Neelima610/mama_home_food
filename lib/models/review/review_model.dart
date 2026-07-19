
import 'package:flutter/foundation.dart';

/// Customer review model used throughout the application.
///
/// This model is reusable for:
/// - Product Reviews
/// - Order Reviews
/// - Ratings Summary
/// - Firebase
/// - Local Database
@immutable
class ReviewModel {
  final String id;

  /// Product ID
  final String productId;

  /// User ID
  final String userId;

  /// Customer Name
  final String userName;

  /// Customer Profile Image
  final String userImage;

  /// Rating (1-5)
  final double rating;

  /// Review Title
  final String title;

  /// Review Message
  final String comment;

  /// Review Date
  final DateTime reviewDate;

  /// Verified Purchase
  final bool isVerifiedPurchase;

  /// Helpful Count
  final int helpfulCount;

  /// Whether current user marked helpful
  final bool isHelpful;

  /// Review Images
  final List<String> images;

  const ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.title,
    required this.comment,
    required this.reviewDate,
    this.isVerifiedPurchase = false,
    this.helpfulCount = 0,
    this.isHelpful = false,
    this.images = const [],
  });

  ReviewModel copyWith({
    String? id,
    String? productId,
    String? userId,
    String? userName,
    String? userImage,
    double? rating,
    String? title,
    String? comment,
    DateTime? reviewDate,
    bool? isVerifiedPurchase,
    int? helpfulCount,
    bool? isHelpful,
    List<String>? images,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      rating: rating ?? this.rating,
      title: title ?? this.title,
      comment: comment ?? this.comment,
      reviewDate: reviewDate ?? this.reviewDate,
      isVerifiedPurchase:
          isVerifiedPurchase ?? this.isVerifiedPurchase,
      helpfulCount: helpfulCount ?? this.helpfulCount,
      isHelpful: isHelpful ?? this.isHelpful,
      images: images ?? this.images,
    );
  }

  factory ReviewModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ReviewModel(
      id: map['id'] ?? '',
      productId: map['productId'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userImage: map['userImage'] ?? '',
      rating: (map['rating'] ?? 0).toDouble(),
      title: map['title'] ?? '',
      comment: map['comment'] ?? '',
      reviewDate: DateTime.tryParse(
            map['reviewDate'] ?? '',
          ) ??
          DateTime.now(),
      isVerifiedPurchase:
          map['isVerifiedPurchase'] ?? false,
      helpfulCount: map['helpfulCount'] ?? 0,
      isHelpful: map['isHelpful'] ?? false,
      images: List<String>.from(
        map['images'] ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'title': title,
      'comment': comment,
      'reviewDate': reviewDate.toIso8601String(),
      'isVerifiedPurchase': isVerifiedPurchase,
      'helpfulCount': helpfulCount,
      'isHelpful': isHelpful,
      'images': images,
    };
  }

  factory ReviewModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ReviewModel.fromMap(json);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ReviewModel &&
        other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ReviewModel(id: $id, userName: $userName, rating: $rating)';
  }
}

