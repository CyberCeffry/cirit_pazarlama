import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  // Getters
  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  // Kullanıcı giriş yap
  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simüle edilmiş giriş
      await Future.delayed(const Duration(seconds: 1));

      _user = User(
        email: email,
        fullName: 'Örnek Kullanıcı',
        phone: '+90 555 123 4567',
        address: 'Örnek Sokak No:123',
        city: 'İstanbul',
        country: 'Türkiye',
        postalCode: '34000',
      );
      _isLoggedIn = true;
    } catch (e) {
      debugPrint('Giriş hatası: $e');
      _isLoggedIn = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Kullanıcı kaydı
  Future<void> register(String email, String fullName, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      _user = User(email: email, fullName: fullName);
      _isLoggedIn = true;
    } catch (e) {
      debugPrint('Kayıt hatası: $e');
      _isLoggedIn = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Çıkış yap
  void logout() {
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  // Kullanıcı bilgilerini güncelle
  void updateUser(User updatedUser) {
    _user = updatedUser;
    notifyListeners();
  }
}
