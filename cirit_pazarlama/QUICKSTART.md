# 🚀 Cirit Pazarlama - Hızlı Başlangıç

## ⚠️ Önemli: İlk Kurulum Adımları

Flutter e-ticaret web sitesine hoşgeldiniz! Aşağıdaki adımları takip ederek başlayabilirsiniz.

## 1️⃣ Paketleri Yükle

```bash
cd cirit_pazarlama
flutter pub get
```

## 2️⃣ Web Uygulamasını Çalıştır

```bash
flutter run -d web
```

**Veya Chrome'u seç:**

```bash
flutter run -d chrome
```

## 3️⃣ Tarayıcıda Aç

```
http://localhost:5000
```

---

## 📱 Uygulamada Neler Var?

### Mevcut Sayfalar

- **🏠 Ana Sayfa** - Öne çıkan ürünler ve kategoriler
- **🛍️ Ürünler** - Tüm ürün kataloğu
- **📞 İletişim** - İletişim formu (e-posta gönderimi hazır)
- **🔒 KVKK** - Gizlilik ve veri koruma politikası

### İşlevli Özellikler

✅ Ürün arama ve filtreleme
✅ Alışveriş sepeti (ekle, çıkar, miktarı değiştir)
✅ Kullanıcı giriş/kayıt (UI hazır, backend beklenmektedir)
✅ Responsive tasarım (mobil, tablet, desktop)
✅ KVKK uyumlu
✅ E-posta gönderimi hazır (SMTP ayarı gerekli)

---

## 🔧 Sonraki Adımlar

### Backend API'si Bağla

1. `lib/constants/app_constants.dart` dosyasında API URL'sini güncelle
2. `lib/providers/` klasöründeki provider'larda API çağrılarını yapıştır
3. HTTP veya DIO kullanarak real data yükle

### E-posta Gönderimi Ayarla

`lib/services/email_service.dart` dosyasını aç ve SMTP ayarlarını ekle:

```dart
final smtpServer = gmail('your-email@gmail.com', 'app-password');
```

### Ödeme Sistemi Ekle

Stripe, iyzipay veya başka bir ödeme sağlayıcıyı entegre et

---

## 📚 Belgeler

- **[README.md](README.md)** - Proje hakkında detaylı bilgi
- **[DEVELOPMENT.md](DEVELOPMENT.md)** - Geliştirme rehberi
- **[API.md](API.md)** - API dokumentasyonu
- **[GETTING_STARTED.md](GETTING_STARTED.md)** - Başlangıç rehberi

---

## ✅ Kurulum Kontrol Listesi

- [ ] Flutter yüklü
- [ ] Proje klonlandı
- [ ] `flutter pub get` çalıştırıldı
- [ ] Web uygulaması başlatıldı
- [ ] Tarayıcıda açıldı

---

**🎉 Hazırsınız! Uygulamayı keşfetmeye başlayın.**

Sorunuz olursa: **info@ciritp.com**
