import 'package:uuid/uuid.dart';
import 'cart_item.dart';

enum OrderStatus { pending, confirmed, shipped, delivered, cancelled }

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double total;
  final OrderStatus status;
  final String shippingAddress;
  final String shippingCity;
  final String shippingCountry;
  final String shippingPostalCode;
  final String paymentMethod;
  final String? notes;
  final DateTime createdAt;
  final DateTime? deliveryDate;

  Order({
    String? id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.total,
    this.status = OrderStatus.pending,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingCountry,
    required this.shippingPostalCode,
    required this.paymentMethod,
    this.notes,
    DateTime? createdAt,
    this.deliveryDate,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  // JSON'a dönüştür
  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'items': items.map((item) => item.toJson()).toList(),
    'subtotal': subtotal,
    'shippingCost': shippingCost,
    'tax': tax,
    'total': total,
    'status': status.name,
    'shippingAddress': shippingAddress,
    'shippingCity': shippingCity,
    'shippingCountry': shippingCountry,
    'shippingPostalCode': shippingPostalCode,
    'paymentMethod': paymentMethod,
    'notes': notes,
    'createdAt': createdAt.toIso8601String(),
    'deliveryDate': deliveryDate?.toIso8601String(),
  };

  // JSON'dan oluştur
  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'] as String?,
    userId: json['userId'] as String,
    items: (json['items'] as List)
        .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
        .toList(),
    subtotal: (json['subtotal'] as num).toDouble(),
    shippingCost: (json['shippingCost'] as num).toDouble(),
    tax: (json['tax'] as num).toDouble(),
    total: (json['total'] as num).toDouble(),
    status: OrderStatus.values.byName(json['status'] as String),
    shippingAddress: json['shippingAddress'] as String,
    shippingCity: json['shippingCity'] as String,
    shippingCountry: json['shippingCountry'] as String,
    shippingPostalCode: json['shippingPostalCode'] as String,
    paymentMethod: json['paymentMethod'] as String,
    notes: json['notes'] as String?,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
    deliveryDate: json['deliveryDate'] != null
        ? DateTime.parse(json['deliveryDate'] as String)
        : null,
  );
}
