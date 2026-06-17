import 'package:uuid/uuid.dart';

class Review {
  final String id;
  final String productId;
  final String userId;
  final String userName;
  final int rating;
  final String title;
  final String comment;
  final List<String>? images;
  final int likes;
  final DateTime createdAt;

  Review({
    String? id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.rating,
    required this.title,
    required this.comment,
    this.images,
    this.likes = 0,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  // JSON'a dönüştür
  Map<String, dynamic> toJson() => {
    'id': id,
    'productId': productId,
    'userId': userId,
    'userName': userName,
    'rating': rating,
    'title': title,
    'comment': comment,
    'images': images,
    'likes': likes,
    'createdAt': createdAt.toIso8601String(),
  };

  // JSON'dan oluştur
  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'] as String?,
    productId: json['productId'] as String,
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    rating: json['rating'] as int,
    title: json['title'] as String,
    comment: json['comment'] as String,
    images: json['images'] != null
        ? List<String>.from(json['images'] as List)
        : null,
    likes: json['likes'] as int? ?? 0,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
  );
}
