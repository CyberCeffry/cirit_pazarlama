import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String email;
  final String fullName;
  final String? phone;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final bool isEmailVerified;

  User({
    String? id,
    required this.email,
    required this.fullName,
    this.phone,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    DateTime? createdAt,
    this.lastLogin,
    this.isEmailVerified = false,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  // JSON'a dönüştür
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'fullName': fullName,
    'phone': phone,
    'address': address,
    'city': city,
    'country': country,
    'postalCode': postalCode,
    'createdAt': createdAt.toIso8601String(),
    'lastLogin': lastLogin?.toIso8601String(),
    'isEmailVerified': isEmailVerified,
  };

  // JSON'dan oluştur
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String?,
    email: json['email'] as String,
    fullName: json['fullName'] as String,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    city: json['city'] as String?,
    country: json['country'] as String?,
    postalCode: json['postalCode'] as String?,
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
    lastLogin: json['lastLogin'] != null
        ? DateTime.parse(json['lastLogin'] as String)
        : null,
    isEmailVerified: json['isEmailVerified'] as bool? ?? false,
  );

  // Kopya oluştur
  User copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phone,
    String? address,
    String? city,
    String? country,
    String? postalCode,
    DateTime? createdAt,
    DateTime? lastLogin,
    bool? isEmailVerified,
  }) => User(
    id: id ?? this.id,
    email: email ?? this.email,
    fullName: fullName ?? this.fullName,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    city: city ?? this.city,
    country: country ?? this.country,
    postalCode: postalCode ?? this.postalCode,
    createdAt: createdAt ?? this.createdAt,
    lastLogin: lastLogin ?? this.lastLogin,
    isEmailVerified: isEmailVerified ?? this.isEmailVerified,
  );
}
