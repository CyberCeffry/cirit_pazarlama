import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  String _searchQuery = '';
  String _selectedCategory = '';
  bool _isLoading = false;

  // Getters
  List<Product> get products =>
      _filteredProducts.isEmpty && _searchQuery.isEmpty
      ? _products
      : _filteredProducts;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  // Ürünleri yükle (API'den)
  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simüle edilmiş ürünler
      _products = [
        Product(
          name: 'Premium Ürün 1',
          description: 'Yüksek kaliteli premium ürün',
          price: 299.99,
          discountPrice: 199.99,
          category: 'Elektronik',
          imageUrl: 'https://via.placeholder.com/300x300?text=Product1',
          stock: 50,
          rating: 4.5,
          reviewCount: 24,
          isFeatured: true,
        ),
        Product(
          name: 'Standart Ürün 2',
          description: 'Kaliteli standart ürün',
          price: 149.99,
          category: 'Giyim',
          imageUrl: 'https://via.placeholder.com/300x300?text=Product2',
          stock: 100,
          rating: 4.0,
          reviewCount: 15,
        ),
        Product(
          name: 'Ekonomik Ürün 3',
          description: 'Uygun fiyatlı ekonomik ürün',
          price: 79.99,
          category: 'Ev',
          imageUrl: 'https://via.placeholder.com/300x300?text=Product3',
          stock: 200,
          rating: 3.8,
          reviewCount: 32,
          isFeatured: true,
        ),
      ];

      _filteredProducts = _products;
    } catch (e) {
      debugPrint('Ürünleri yüklerken hata: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Arama yap
  void searchProducts(String query) {
    _searchQuery = query;
    _filterProducts();
    notifyListeners();
  }

  // Kategoriye göre filtrele
  void filterByCategory(String category) {
    _selectedCategory = category;
    _filterProducts();
    notifyListeners();
  }

  // İç filtre fonksiyonu
  void _filterProducts() {
    _filteredProducts = _products.where((product) {
      final matchesSearch =
          product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );

      final matchesCategory =
          _selectedCategory.isEmpty ||
          product.category.toLowerCase() == _selectedCategory.toLowerCase();

      return matchesSearch && matchesCategory;
    }).toList();
  }

  // Ürün bul
  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  // Kategorileri getir
  List<String> getCategories() {
    return _products.map((p) => p.category).toSet().toList();
  }

  // Öne çıkan ürünler
  List<Product> getFeaturedProducts() {
    return _products.where((p) => p.isFeatured).toList();
  }
}
