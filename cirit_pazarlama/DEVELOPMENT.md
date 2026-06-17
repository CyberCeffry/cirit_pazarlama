# Cirit Pazarlama E-Ticaret Sitesi - Kurulum ve Geliştirme Rehberi

## 📋 Kurulum Adımları

### 1. Gereksinimler

- **Flutter**: 3.11.1 veya daha yüksek
- **Dart**: 3.11.1 veya daha yüksek
- **Git**: Sürüm kontrolü için
- **Visual Studio Code veya Android Studio**: Code editörü

### 2. Bağımlılıkları Yükleme

```bash
# Proje klasörüne gir
cd cirit_pazarlama

# Pubspec'deki paketleri yükle
flutter pub get

# (Opsiyonel) Build runner çalıştır
flutter pub run build_runner build
```

### 3. Uygulamayı Çalıştırma

#### Web Üzerinde

```bash
flutter run -d web
# veya
flutter run -d chrome
```

#### Android Emülatörde

```bash
flutter run -d emulator
```

#### iOS Simülatöründe (macOS)

```bash
flutter run -d ios
```

## 🏗️ Proje Mimarisi

### Model-View-Provider Mimarisi

```
┌─────────────────────────────────┐
│          UI (Pages)             │
├─────────────────────────────────┤
│       Provider (State)          │
├─────────────────────────────────┤
│      Services (Business Logic)  │
├─────────────────────────────────┤
│         Models (Data)           │
└─────────────────────────────────┘
```

### Katmanlar

#### 1. **Models** (`lib/models/`)

- Veri yapıları tanımları
- JSON serialization/deserialization
- Dosyalar: `product.dart`, `user.dart`, `order.dart`, vb.

#### 2. **Providers** (`lib/providers/`)

- State management (Provider pattern)
- Business logic
- Dosyalar: `product_provider.dart`, `cart_provider.dart`, vb.

#### 3. **Services** (`lib/services/`)

- API çağrıları
- Veritabanı işlemleri
- E-posta gönderimi
- Dosyalar: `local_storage_service.dart`, `email_service.dart`

#### 4. **Pages** (`lib/pages/`)

- Tam sayfa bileşenleri
- Navigasyon yapısı
- Dosyalar: `home_page.dart`, `contact_page.dart`, `kvkk_page.dart`

#### 5. **Widgets** (`lib/widgets/`)

- Yeniden kullanılabilir bileşenler
- Özel UI elemanları
- Dosyalar: `product_card.dart`, `category_badge.dart`

#### 6. **Constants** (`lib/constants/`)

- Renkler, fontlar, boyutlar
- Validasyon ve formatters
- Sabit değerler
- Dosyalar: `app_constants.dart`, `validators.dart`

## 🎯 Temel İşlevler

### Ürün Yönetimi

```dart
// Ürünleri yükle
context.read<ProductProvider>().loadProducts();

// Kategoriye göre filtrele
context.read<ProductProvider>().filterByCategory('Elektronik');

// Ara
context.read<ProductProvider>().searchProducts('laptop');
```

### Sepet İşlemleri

```dart
// Sepete ekle
context.read<CartProvider>().addToCart(product, quantity: 2);

// Çıkar
context.read<CartProvider>().removeFromCart(productId);

// Miktarı güncelle
context.read<CartProvider>().updateQuantity(productId, 5);

// Toplam fiyat
double total = context.read<CartProvider>().totalPrice;
```

### Kullanıcı Yönetimi

```dart
// Giriş yap
await context.read<UserProvider>().login(email, password);

// Kayıt ol
await context.read<UserProvider>().register(email, name, password);

// Çıkış yap
context.read<UserProvider>().logout();

// Mevcut kullanıcı
User? user = context.read<UserProvider>().user;
```

## 🔌 API Entegrasyonu

### Basit HTTP İstek Örneği

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('${AppConstants.baseUrl}/products'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Ürünleri yüklenemedi');
  }
}
```

### DIO ile İstek Örneği

```dart
import 'package:dio/dio.dart';

final dio = Dio();

Future<List<Product>> fetchProducts() async {
  try {
    final response = await dio.get('${AppConstants.baseUrl}/products');
    List<dynamic> jsonList = response.data;
    return jsonList
        .map((json) => Product.fromJson(json))
        .toList();
  } catch (e) {
    print('Hata: $e');
    throw Exception('Ürünleri yüklenemedi');
  }
}
```

## 💾 Yerel Depolama Kullanımı

```dart
final storage = LocalStorageService();

// String kaydet
await storage.saveString('username', 'john_doe');

// String oku
String? username = storage.getString('username');

// JSON kaydet
await storage.saveJson('user_data', {'name': 'John', 'age': 30});

// JSON oku
Map<String, dynamic>? userData = storage.getJson('user_data');

// Sil
await storage.remove('username');
```

## 📧 E-posta Gönderimi

```dart
final emailService = EmailService();

// Sipariş onayı e-postası
await emailService.sendOrderConfirmation(
  toEmail: 'customer@example.com',
  customerName: 'John Doe',
  orderId: 'ORDER-123',
);

// İletişim formu e-postası
await emailService.sendContactFormEmail(
  senderEmail: 'user@example.com',
  senderName: 'John',
  message: 'Merhaba, ürünler hakkında soru sormak istiyorum.',
);
```

## 🎨 Tema Özelleştirmesi

`lib/constants/app_constants.dart` dosyasında:

```dart
class AppColors {
  static const Color primary = Color(0xFF6200EE); // Değiştir
  static const Color secondary = Color(0xFF03DAC6);
  // ...
}
```

## 🧪 Form Validation Örnekleri

```dart
// E-posta validasyonu
String? email = Validators.validateEmail('test@example.com');

// Telefon validasyonu
String? phone = Validators.validatePhone('05551234567');

// Custom validasyon
String? field = Validators.validateNotEmpty(value, 'Alan Adı');
```

## 📊 Responsive Tasarım

```dart
// Ekran genişliğine göre kontrol
final isMobile = MediaQuery.of(context).size.width < 600;

// Responsive grid
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: isMobile ? 2 : 3,
    // ...
  ),
  // ...
);
```

## 🐛 Hata Ayıklama

### Debug Modu

```bash
flutter run -d web --debug
```

### Release Modu

```bash
flutter build web --release
```

### Console Logs

```dart
// Debug çıkışı
debugPrint('Debug mesajı');

// Console çıkışı
print('Konsol mesajı');
```

## 📱 Web Yapılandırması

`web/index.html` dosyasında önemli ayarlar:

```html
<!-- Başlık -->
<title>Cirit Pazarlama</title>

<!-- Favicon -->
<link rel="icon" type="image/png" href="favicon.png" />

<!-- Meta tags -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Cirit Pazarlama E-Ticaret Sitesi" />
```

## 🚀 Production Deployment

### Firebase Hosting

```bash
# Firebase CLI yükle
npm install -g firebase-tools

# Giriş yap
firebase login

# Proje başlat
firebase init

# Web build et
flutter build web --release

# Deploy et
firebase deploy
```

### Alternatif Hosting Seçenekleri

- **Vercel**: `vercel deploy`
- **Netlify**: `netlify deploy`
- **AWS S3**: S3 bucket'ına upload et
- **GitHub Pages**: GitHub Actions ile otomasyonu

## 📚 Yararlı Linkler

- [Flutter Dokumentasyonu](https://docs.flutter.dev/)
- [Dart Dokumentasyonu](https://dart.dev/)
- [Provider Paketi](https://pub.dev/packages/provider)
- [Flutter Community](https://flutter-community.dev/)

## ⚠️ Önemli Notlar

1. **API Keys**: Asla hardcode etmeyin, environment variables kullanın
2. **KVKK Uyumluluğu**: Kullanıcı rızası almadan veri işlemeyin
3. **Güvenlik**: SSL/TLS kullanarak HTTPS ile iletişim yapın
4. **Performance**: Büyük listelerde lazy loading kullanın
5. **Testing**: Önemli özellikler için test yazın

## 🆘 Sık Sorulan Sorular

### P: Yerel sunucu nasıl çalıştırırım?

C: `flutter run -d web` komutunu kullan

### P: CORS hatasını nasıl çözerim?

C: Backend tarafında CORS header'larını ekle

### P: Web üzerinde Navigator nasıl çalışır?

C: GoRouter veya named routes kullan

### P: Offline mod nasıl eklenir?

C: Hive ile yerel cache oluştur

---

**Sorularınız olursa bizimle iletişime geçin: info@ciritp.com**
