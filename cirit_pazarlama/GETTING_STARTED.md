# 📋 Cirit Pazarlama - Başlangıç Rehberi

## 🎉 Hoşgeldiniz!

Bu e-ticaret platformu şu anda hızlı bir şekilde kurulabilecek durumda. Aşağıdaki adımları izleyerek başlayabilirsiniz.

## ⚡ 5 Dakikalık Kurulum

### Adım 1: Bağımlılıkları Yükle

```bash
flutter pub get
```

### Adım 2: Uygulamayı Çalıştır

```bash
flutter run -d web
```

### Adım 3: Tarayıcıda Aç

```
http://localhost:5000
```

**Done! ✅**

## 🗂️ Dosya Yapısı Özeti

```
lib/
├── main.dart                 # Ana uygulama başlama noktası
├── models/                   # Veri modelleri
│   ├── product.dart
│   ├── user.dart
│   ├── order.dart
│   └── review.dart
├── providers/               # State management
│   ├── product_provider.dart
│   ├── cart_provider.dart
│   ├── user_provider.dart
│   └── order_provider.dart
├── pages/                   # Sayfalar
│   ├── home_page.dart
│   ├── contact_page.dart
│   └── kvkk_page.dart
├── widgets/                 # Bileşenler
│   ├── product_card.dart
│   └── app_footer.dart
├── services/                # Servisler
│   ├── local_storage_service.dart
│   └── email_service.dart
└── constants/               # Sabitler
    ├── app_constants.dart
    └── validators.dart
```

## 🚀 Sonraki Adımlar

### 1️⃣ Backend'i Kurmak

Backend API'si kurmak için aşağıdaki teknolojileri öneriyoruz:

- **Node.js + Express.js** (JavaScript)
- **Python + Django/Flask** (Python)
- **Java + Spring Boot** (Java)

### 2️⃣ Veritabanını Bağlamak

`lib/services/` klasöründe API çağrılarını güncelleyin:

```dart
// Ürünleri API'den yükle
final response = await http.get(
  Uri.parse('${AppConstants.baseUrl}/api/products'),
);
```

### 3️⃣ Ödeme Sistemi Eklemek

Stripe veya iyzipay entegrasyonu ekleyin:

```dart
// pubspec.yaml'a ekle
flutter_stripe: ^latest
```

### 4️⃣ Admin Paneli Oluşturmak

Yeni sayfa ve navigasyon ekleyin:

```dart
lib/pages/admin/
├── admin_dashboard_page.dart
├── product_management_page.dart
└── order_management_page.dart
```

## 📖 Önemli Sayfalar

| Sayfa     | URL         | Açıklama                    |
| --------- | ----------- | --------------------------- |
| Ana Sayfa | `/`         | Ürün vitrin ve öne çıkanlar |
| Ürünler   | `/products` | Tüm ürünler kataloğu        |
| İletişim  | `/contact`  | İletişim formu              |
| KVKK      | `/privacy`  | Gizlilik politikası         |

## 🔑 Yapılandırma Dosyaları

### `lib/constants/app_constants.dart`

```dart
// Buraya API URL'ini ekle
static const String baseUrl = 'https://api.example.com';

// E-mail yapılandırması
static const String appEmail = 'info@ciritp.com';

// Para birimi
static const String currency = '₺';
```

### `web/index.html`

```html
<!-- SEO için meta tags ekle -->
<meta name="description" content="Cirit Pazarlama E-Ticaret Sitesi" />
<meta property="og:title" content="Cirit Pazarlama" />
<meta property="og:image" content="path/to/image.png" />
```

## 🔑 API Entegrasyonu

### Mevcut Mock API

Geçici olarak mock veri kullanılıyor. Gerçek API için:

1. **ProductProvider.loadProducts()** güncelleyin
2. HTTP istekleri yapın
3. JSON parse yapın

```dart
Future<void> loadProducts() async {
  try {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/api/products'),
    );

    if (response.statusCode == 200) {
      // JSON parse ve model oluştur
      _products = List<Product>.from(
        jsonDecode(response.body).map(
          (p) => Product.fromJson(p),
        ),
      );
    }
  } catch (e) {
    debugPrint('Error: $e');
  }
}
```

## 🎨 Kustomizasyon Rehberi

### Renkleri Değiştir

`lib/constants/app_constants.dart`:

```dart
class AppColors {
  static const Color primary = Color(0xFF6200EE); // Değiştir
  static const Color secondary = Color(0xFF03DAC6);
}
```

### Logo Ekle

```
assets/images/logo.png (256x256)
```

### Font Değiştir

`pubspec.yaml`:

```yaml
google_fonts:
  - packages/google_fonts
```

## 📦 Önemli Paketler

| Paket                | Amaç             | Dokümantasyon                                         |
| -------------------- | ---------------- | ----------------------------------------------------- |
| provider             | State management | [Link](https://pub.dev/packages/provider)             |
| hive                 | Yerel depolama   | [Link](https://pub.dev/packages/hive)                 |
| dio                  | HTTP istemcisi   | [Link](https://pub.dev/packages/dio)                  |
| cached_network_image | Resim cache'i    | [Link](https://pub.dev/packages/cached_network_image) |

## 🐛 Yaygın Sorunlar ve Çözümler

### Problem: "Cannot find 'lib/main.dart'"

**Çözüm**: Proje klasörü doğru mu kontrol et

```bash
cd cirit_pazarlama
flutter run -d web
```

### Problem: Port zaten kullanımda

**Çözüm**: Farklı port kullan

```bash
flutter run -d web --web-port 5001
```

### Problem: Build hatası

**Çözüm**: Temizle ve yeniden yükle

```bash
flutter clean
flutter pub get
flutter run -d web
```

## 🚢 Deployment Hazırlığı

### Web Build

```bash
flutter build web --release
```

### Firebase'e Deploy

```bash
firebase init
firebase deploy
```

### Netlify'e Deploy

```bash
netlify deploy --prod --dir=build/web
```

## 📊 Veritabanı Şeması (Referans)

### Users Tablosu

```sql
CREATE TABLE users (
  id VARCHAR(36) PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  full_name VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255),
  city VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(10),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Products Tablosu

```sql
CREATE TABLE products (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  discount_price DECIMAL(10, 2),
  category VARCHAR(100),
  image_url VARCHAR(500),
  stock INT DEFAULT 0,
  rating FLOAT DEFAULT 0,
  review_count INT DEFAULT 0,
  is_featured BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 📞 Geliştirici Desteği

- **Documentation**: Bkz. [DEVELOPMENT.md](DEVELOPMENT.md)
- **API Referans**: Bkz. [API.md](API.md)
- **E-mail**: info@ciritp.com
- **GitHub Issues**: Hata raporla

## ✅ Checklist - Başlangıç

- [ ] Flutter yükledim
- [ ] Projeyi klonladım
- [ ] `flutter pub get` çalıştırdım
- [ ] `flutter run -d web` çalıştırdım
- [ ] Tarayıcıda test ettim
- [ ] DEVELOPMENT.md okudum
- [ ] API.md okudum
- [ ] Renkleri özelleştirdim
- [ ] Logo ekledim
- [ ] Backend API'yi ayarladım

## 🎓 Öğrenme Kaynakları

1. **Flutter Official**: https://flutter.dev
2. **Dart Lang**: https://dart.dev
3. **Provider Pattern**: https://codewithandrea.com/articles/flutter-state-management-riverpod/
4. **E-commerce Best Practices**: https://www.shopify.com/

## 🔮 Gelecek Planlar

- [ ] Admin dashboard
- [ ] Mobil app
- [ ] Çok dil desteği
- [ ] AI tabanlı ürün önerileri
- [ ] Canlı sohbet
- [ ] İnsan Kaynakları Panel

---

**Başlamaya hazır mısınız? Şimdi `flutter run -d web` yazın! 🚀**

**Sorunuz olursa bize ulaşın: info@ciritp.com**
