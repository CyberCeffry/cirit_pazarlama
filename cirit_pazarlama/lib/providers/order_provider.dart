import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/cart_item.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  bool _isLoading = false;

  // Getters
  List<Order> get orders => _orders;
  bool get isLoading => _isLoading;

  // Sipariş oluştur
  Future<void> createOrder({
    required String userId,
    required List<CartItem> items,
    required double shippingCost,
    required String shippingAddress,
    required String shippingCity,
    required String shippingCountry,
    required String shippingPostalCode,
    required String paymentMethod,
    String? notes,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      double subtotal = items.fold(0, (sum, item) => sum + item.totalPrice);
      double tax = subtotal * 0.18; // KDV %18
      double total = subtotal + shippingCost + tax;

      final order = Order(
        userId: userId,
        items: items,
        subtotal: subtotal,
        shippingCost: shippingCost,
        tax: tax,
        total: total,
        shippingAddress: shippingAddress,
        shippingCity: shippingCity,
        shippingCountry: shippingCountry,
        shippingPostalCode: shippingPostalCode,
        paymentMethod: paymentMethod,
        notes: notes,
      );

      _orders.add(order);
    } catch (e) {
      debugPrint('Sipariş oluştururken hata: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Siparişleri yükle
  Future<void> loadOrders(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // API'den siparişleri yükle
      // Şimdilik boş liste
      _orders = [];
    } catch (e) {
      debugPrint('Siparişleri yüklerken hata: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Sipariş durumunu güncelle
  void updateOrderStatus(String orderId, OrderStatus status) {
    final index = _orders.indexWhere((order) => order.id == orderId);
    if (index >= 0) {
      final updatedOrder = Order(
        id: _orders[index].id,
        userId: _orders[index].userId,
        items: _orders[index].items,
        subtotal: _orders[index].subtotal,
        shippingCost: _orders[index].shippingCost,
        tax: _orders[index].tax,
        total: _orders[index].total,
        status: status,
        shippingAddress: _orders[index].shippingAddress,
        shippingCity: _orders[index].shippingCity,
        shippingCountry: _orders[index].shippingCountry,
        shippingPostalCode: _orders[index].shippingPostalCode,
        paymentMethod: _orders[index].paymentMethod,
        notes: _orders[index].notes,
        createdAt: _orders[index].createdAt,
        deliveryDate: status == OrderStatus.delivered ? DateTime.now() : null,
      );
      _orders[index] = updatedOrder;
      notifyListeners();
    }
  }
}
