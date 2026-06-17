# Cirit Pazarlama - Flutter E-Ticaret Web Sitesi

Tam teşekküllü bir Flutter e-ticaret web sitesi uygulaması. KVKK uyumlu, iletişim formu, ürün kataloğu, alışveriş sepeti ve daha pek çok özellik içerir.

## 🎯 Özellikler

### Müşteri Tarafı

- ✅ **Ürün Kataloğu** - Ürünleri kategorilere göre görüntüle
- ✅ **Arama & Filtreleme** - Ürünleri ara ve filtrele
- ✅ **Alışveriş Sepeti** - Ürün ekle, çıkar, miktarı değiştir
- ✅ **Kullanıcı Hesabı** - Giriş, kayıt, profil yönetimi
- ✅ **Sipariş Takibi** - Siparişleri görüntüle ve takip et
- ✅ **Ürün İncelemesi** - Yıldız puanlama ve yorum yazma
- ✅ **İletişim Formu** - E-posta ile iletişim kur
- ✅ **KVKK Sayfası** - Kişisel verileri koruma politikası

### Admin Tarafı (Hazır)

- 📦 Ürün yönetimi
- 💰 Sipariş yönetimi
- 👥 Kullanıcı yönetimi
- 📊 Raporlar & İstatistikler

### Web Uyumluluğu

- 📱 Tam responsive tasarım
- 🖥️ Desktop, tablet ve mobil desteği
- 🌐 Flutter Web ile çalışır

## 📁 Proje Yapısı

```
lib/
├── constants/          # Sabitler, renkler, tema
├── models/            # Veri modelleri
├── pages/             # Ana sayfalar
├── providers/         # State management (Provider)
├── services/          # API, depolama servisleri
├── widgets/           # Ortak bileşenler
├── utils/             # Yardımcı fonksiyonlar
└── main.dart          # Ana giriş noktası
```

## 🚀 Başlangıç

### Gereksinimler

- Flutter 3.11.1+
- Dart 3.11.1+

### Kurulum

```bash
# Repository'i klonla
git clone <repository-url>

# Projeye git
cd cirit_pazarlama

# Bağımlılıkları yükle
flutter pub get

# Uygulamayı çalıştır
flutter run -d web
```

## 📦 Bağımlılıklar

### UI & Design

- `google_fonts` - Google Fonts desteği
- `cached_network_image` - Resim önbelleği

### State Management

- `provider` - Provider pattern implementasyonu

### Storage & Database

- `hive` - Yerel veri depolama
- `hive_flutter` - Flutter adaptasyonu

### HTTP & API

- `http` - HTTP istekleri
- `dio` - HTTP istemcisi

### Form & Validation

- `flutter_form_builder` - Form yönetimi
- `form_builder_validators` - Form validasyonu

### Utilities

- `intl` - Uluslararasılaştırma
- `uuid` - ID üretimi
- `url_launcher` - Link açma
- `share_plus` - Sosyal medya paylaşımı
- `mailer` - E-posta gönderimi
- `pdf` & `printing` - PDF raporları

## 🎨 Tema & Renkler

```dart
primary: #6200EE (Mor)
secondary: #03DAC6 (Turkuaz)
error: #B00020 (Kırmızı)
success: #4CAF50 (Yeşil)
```

## 🔧 Konfigürasyon

### Email Servisi

`lib/services/email_service.dart` dosyasında e-posta ayarlarını yapılandırın:

```dart
// SMTP Ayarları
final smtpServer = gmail('your-email@gmail.com', 'your-password');
```

### API Endpoints

`lib/constants/app_constants.dart` dosyasında API URL'lerini ayarlayın:

```dart
static const String baseUrl = 'https://api.example.com';
```

## 💾 Yerel Depolama

Uygulama Hive kullanarak yerel veri depolar:

- Kullanıcı tercihleri
- Alışveriş sepeti
- Favoriler

## 🔐 Güvenlik

- KVKK uyumlu veri işleme
- Şifreli yerel depolama
- Güvenli API iletişimi

## 📝 KVKK Uyumluluğu

Uygulama 6698 sayılı Kişisel Verileri Koruma Kanunu'na uygun olarak:

- Veri toplama ve işleme politikası
- Kullanıcı rıza yönetimi
- Veri silme ve taşıma hakları
- Gizlilik politikası

## 🌍 Çok Dilli Destek

Şu anda Türkçe dilinde mevcuttur. Çok dili destek eklemek için:

1. `intl` paketi kullanarak çeviriler ekleyin
2. `l10n.yaml` dosyasını yapılandırın
3. `.arb` dosyalarında çevirileri tanımlayın

## 📱 Responsive Tasarım Breakpoints

- **Mobil**: < 600px
- **Tablet**: 600px - 1200px
- **Desktop**: > 1200px

## 🧪 Test Etme

```bash
# Tüm testleri çalıştır
flutter test

# Web üzerinde çalıştır
flutter run -d web

# Release versiyonunu oluştur
flutter build web --release
```

## 📊 Performans Optimizasyonu

- Resim önbelleği (cached_network_image)
- Lazy loading (ListView.builder)
- Provider pattern ile state yönetimi
- Hive ile hızlı yerel veri erişimi

## 🚢 Deployment

### Firebase Hosting

```bash
# Firebase CLI'yi yükle
npm install -g firebase-tools

# Firebase Deploy
firebase deploy
```

### Diğer Hosting Seçenekleri

- Vercel
- Netlify
- GitHub Pages
- AWS S3 + CloudFront

## 🐛 Bilinen Sorunlar

- Admin paneli henüz geliştirilme aşamasında
- Ödeme sistemi integrasyonu başlanmamış
- E-posta gönderimi test aşamasında

## 🔮 Gelecek Özellikler

- [ ] Tam ödeme sistemi entegrasyonu
- [ ] Dinamik admin paneli
- [ ] Yapay zeka destekli ürün önerileri
- [ ] Canlı sohbet desteği
- [ ] Mobil app versiyonu
- [ ] Multi-language destek
- [ ] Başka ödeme yöntemleri

## 📞 İletişim & Destek

- **E-posta**: info@ciritp.com
- **Telefon**: +90 (542) 525 25 25
- **Web**: https://www.ciritp.com

## 📄 Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.

## 👨‍💻 Geliştirici

Cirit Pazarlama Ekibi

---

**Son Güncelleme**: 2024

**Sürüm**: 1.0.0
