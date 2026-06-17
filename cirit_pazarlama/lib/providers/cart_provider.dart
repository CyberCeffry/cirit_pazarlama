import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  // Getters
  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  // Sepete ürün ekle
  void addToCart(Product product, {int quantity = 1}) {
    try {
      final existingIndex = _items.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingIndex >= 0) {
        // Ürün zaten sepette, miktarını artır
        _items[existingIndex] = _items[existingIndex].copyWith(
          quantity: _items[existingIndex].quantity + quantity,
        );
      } else {
        // Yeni ürün ekle
        _items.add(CartItem(product: product, quantity: quantity));
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Sepete eklerken hata: $e');
    }
  }

  // Sepetten ürün çıkar
  void removeFromCart(String productId) {
    try {
      _items.removeWhere((item) => item.product.id == productId);
      notifyListeners();
    } catch (e) {
      debugPrint('Sepetten çıkarırken hata: $e');
    }
  }

  // Ürün miktarını güncelle
  void updateQuantity(String productId, int quantity) {
    try {
      final index = _items.indexWhere((item) => item.product.id == productId);
      if (index >= 0) {
        if (quantity <= 0) {
          _items.removeAt(index);
        } else {
          _items[index] = _items[index].copyWith(quantity: quantity);
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Miktarı güncellerken hata: $e');
    }
  }

  // Sepeti temizle
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Ürün sepette mi?
  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  // Sepetteki ürün sayısı
  int getQuantity(String productId) {
    final item = _items.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => CartItem(
        product: Product(
          name: '',
          description: '',
          price: 0,
          category: '',
          imageUrl: '',
          stock: 0,
        ),
        quantity: 0,
      ),
    );
    return item.quantity;
  }
}
