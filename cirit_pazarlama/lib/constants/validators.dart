// Validasyon
class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-posta adresi gerekli';
    }
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Geçerli bir e-posta adresi girin';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre gerekli';
    }
    if (value.length < 8) {
      return 'Şifre en az 8 karakter olmalıdır';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ad ve soyad gerekli';
    }
    if (value.length < 3) {
      return 'Ad ve soyad en az 3 karakter olmalıdır';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası gerekli';
    }
    final phoneRegex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Geçerli bir telefon numarası girin';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Adres gerekli';
    }
    if (value.length < 5) {
      return 'Adres en az 5 karakter olmalıdır';
    }
    return null;
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName gerekli';
    }
    return null;
  }
}

// Format fonksiyonları
class Formatters {
  static String formatCurrency(double amount) {
    return '${amount.toStringAsFixed(2)} ₺';
  }

  static String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static String formatPhoneNumber(String phone) {
    // +90 5XX XXX XXXX formatına çevir
    if (phone.length >= 10) {
      return '+90 ${phone.substring(0, 3)} ${phone.substring(3, 6)} ${phone.substring(6)}';
    }
    return phone;
  }

  static String formatProductName(String name) {
    if (name.length > 50) {
      return '${name.substring(0, 47)}...';
    }
    return name;
  }
}

// Hesaplama fonksiyonları
class Calculations {
  static double calculateDiscount(double original, double discounted) {
    if (original == 0) return 0;
    return ((original - discounted) / original) * 100;
  }

  static double calculateTotalWithTax(
    double subtotal, {
    double taxRate = 0.18,
  }) {
    return subtotal + (subtotal * taxRate);
  }

  static double calculateShippingCost(
    double cartTotal, {
    double freeThreshold = 250.0,
    double normalCost = 29.99,
  }) {
    return cartTotal >= freeThreshold ? 0 : normalCost;
  }
}
