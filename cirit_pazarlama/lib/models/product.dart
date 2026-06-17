import 'package:uuid/uuid.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? discountPrice;
  final String category;
  final String imageUrl;
  final List<String>? images;
  final int stock;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final DateTime createdAt;

  Product({
    String? id,
    required this.name,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.category,
    required this.imageUrl,
    this.images,
    required this.stock,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFeatured = false,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  // Discount yüzdesini hesapla
  double get discountPercentage {
    if (discountPrice == null) return 0;
    return ((price - discountPrice!) / price * 100).roundToDouble();
  }

  // Satış fiyatını getir
  double get salePrice => discountPrice ?? price;

  // JSON'a dönüştür
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'discountPrice': discountPrice,
    'category': category,
    'imageUrl': imageUrl,
    'images': images,
    'stock': stock,
    'rating': rating,
    'reviewCount': reviewCount,
    'isFeatured': isFeatured,
    'createdAt': createdAt.toIso8601String(),
  };

  // JSON'dan oluştur
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as String?,
    name: json['name'] as String,
    description: json['description'] as String,
    price: (json['price'] as num).toDouble(),
    discountPrice: json['discountPrice'] != null
        ? (json['discountPrice'] as num).toDouble()
        : null,
    category: json['category'] as String,
    imageUrl: json['imageUrl'] as String,
    images: json['images'] != null
        ? List<String>.from(json['images'] as List)
        : null,
    stock: json['stock'] as int,
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    reviewCount: json['reviewCount'] as int? ?? 0,
    isFeatured: json['isFeatured'] as bool? ?? false,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
  );

  // Kopya oluştur
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? discountPrice,
    String? category,
    String? imageUrl,
    List<String>? images,
    int? stock,
    double? rating,
    int? reviewCount,
    bool? isFeatured,
    DateTime? createdAt,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    price: price ?? this.price,
    discountPrice: discountPrice ?? this.discountPrice,
    category: category ?? this.category,
    imageUrl: imageUrl ?? this.imageUrl,
    images: images ?? this.images,
    stock: stock ?? this.stock,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    isFeatured: isFeatured ?? this.isFeatured,
    createdAt: createdAt ?? this.createdAt,
  );
}
