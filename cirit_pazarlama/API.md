# Cirit Pazarlama API Dokumentasyonu

## 📌 API Endpoints

### Ürünler API

#### Tüm Ürünleri Getir

```
GET /api/products
```

**Query Parameters:**

- `page` (int): Sayfa numarası (varsayılan: 1)
- `limit` (int): Sayfa başına ürün sayısı (varsayılan: 10)
- `category` (string): Kategori filtrelemesi
- `search` (string): Arama terimi
- `sort` (string): Sıralama (price, rating, date)

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "product-1",
      "name": "Ürün Adı",
      "description": "Ürün açıklaması",
      "price": 299.99,
      "discountPrice": 199.99,
      "category": "Elektronik",
      "imageUrl": "https://...",
      "stock": 50,
      "rating": 4.5,
      "reviewCount": 24,
      "isFeatured": true
    }
  ],
  "total": 100,
  "page": 1
}
```

#### Ürün Detayı Getir

```
GET /api/products/{id}
```

**Response:**

```json
{
  "success": true,
  "data": {
    "id": "product-1",
    "name": "Ürün Adı",
    "description": "Ürün açıklaması",
    "price": 299.99,
    "discountPrice": 199.99,
    "category": "Elektronik",
    "imageUrl": "https://...",
    "images": ["https://...", "https://..."],
    "stock": 50,
    "rating": 4.5,
    "reviewCount": 24,
    "isFeatured": true
  }
}
```

### Kategoriler API

#### Tüm Kategorileri Getir

```
GET /api/categories
```

**Response:**

```json
{
  "success": true,
  "data": ["Elektronik", "Giyim", "Ev", "Kitap"]
}
```

### Kullanıcı API

#### Giriş Yap

```
POST /api/auth/login
```

**Request Body:**

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**

```json
{
  "success": true,
  "token": "jwt_token_here",
  "user": {
    "id": "user-1",
    "email": "user@example.com",
    "fullName": "John Doe",
    "phone": "+90 555 123 4567",
    "address": "Sokak No:123",
    "city": "İstanbul",
    "country": "Türkiye"
  }
}
```

#### Kayıt Ol

```
POST /api/auth/register
```

**Request Body:**

```json
{
  "email": "newuser@example.com",
  "fullName": "John Doe",
  "password": "password123"
}
```

**Response:**

```json
{
  "success": true,
  "message": "Kayıt başarılı",
  "user": {
    "id": "user-1",
    "email": "newuser@example.com",
    "fullName": "John Doe"
  }
}
```

#### Profil Güncelle

```
PUT /api/users/{userId}
```

**Headers:**

```
Authorization: Bearer {token}
```

**Request Body:**

```json
{
  "fullName": "John Doe",
  "phone": "+90 555 123 4567",
  "address": "Yeni Sokak No:456",
  "city": "Ankara"
}
```

### Sipariş API

#### Sipariş Oluştur

```
POST /api/orders
```

**Headers:**

```
Authorization: Bearer {token}
```

**Request Body:**

```json
{
  "items": [
    {
      "productId": "product-1",
      "quantity": 2
    }
  ],
  "shippingAddress": "Sokak No:123",
  "shippingCity": "İstanbul",
  "shippingCountry": "Türkiye",
  "shippingPostalCode": "34000",
  "paymentMethod": "credit_card",
  "notes": "Ek notlar (opsiyonel)"
}
```

**Response:**

```json
{
  "success": true,
  "order": {
    "id": "order-1",
    "userId": "user-1",
    "items": [...],
    "subtotal": 400.00,
    "shippingCost": 29.99,
    "tax": 72.00,
    "total": 501.99,
    "status": "pending",
    "createdAt": "2024-06-17T10:30:00Z"
  }
}
```

#### Siparişleri Getir

```
GET /api/orders
```

**Headers:**

```
Authorization: Bearer {token}
```

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "order-1",
      "items": [...],
      "total": 501.99,
      "status": "delivered",
      "createdAt": "2024-06-17T10:30:00Z"
    }
  ]
}
```

#### Sipariş Detayı

```
GET /api/orders/{orderId}
```

**Headers:**

```
Authorization: Bearer {token}
```

**Response:**

```json
{
  "success": true,
  "order": {
    "id": "order-1",
    "userId": "user-1",
    "items": [...],
    "subtotal": 400.00,
    "shippingCost": 29.99,
    "tax": 72.00,
    "total": 501.99,
    "status": "shipped",
    "shippingAddress": "Sokak No:123",
    "trackingNumber": "TRACK-123456",
    "createdAt": "2024-06-17T10:30:00Z",
    "deliveryDate": null
  }
}
```

### İncelemeler API

#### Ürün İncelemelerini Getir

```
GET /api/products/{productId}/reviews
```

**Query Parameters:**

- `page` (int): Sayfa numarası
- `limit` (int): Sayfa başına inceleme sayısı
- `sort` (string): rating_high, rating_low, recent

**Response:**

```json
{
  "success": true,
  "data": [
    {
      "id": "review-1",
      "productId": "product-1",
      "userId": "user-1",
      "userName": "John Doe",
      "rating": 5,
      "title": "Harika ürün!",
      "comment": "Çok memnun kaldım, hızlı gönderim.",
      "images": ["https://..."],
      "likes": 25,
      "createdAt": "2024-06-10T15:30:00Z"
    }
  ],
  "total": 10,
  "average_rating": 4.6
}
```

#### İnceleme Yazı

```
POST /api/products/{productId}/reviews
```

**Headers:**

```
Authorization: Bearer {token}
```

**Request Body:**

```json
{
  "rating": 5,
  "title": "Harika ürün!",
  "comment": "Çok memnun kaldım, hızlı gönderim."
}
```

### Ödeme API

#### Ödeme İşlemi Başlat

```
POST /api/payments/create
```

**Headers:**

```
Authorization: Bearer {token}
```

**Request Body:**

```json
{
  "orderId": "order-1",
  "amount": 501.99,
  "currency": "TRY",
  "paymentMethod": "credit_card"
}
```

**Response:**

```json
{
  "success": true,
  "paymentId": "pay-1",
  "clientSecret": "secret_here",
  "status": "requires_payment_method"
}
```

## 🔐 Kimlik Doğrulama

### JWT Token Kullanımı

Tüm korumalı endpoint'ler için `Authorization` header'ı gereklidir:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### Token Yenileme

```
POST /api/auth/refresh
```

**Request Body:**

```json
{
  "refreshToken": "refresh_token_here"
}
```

## 📊 Hata Yanıtları

### Başarısız İstek

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Doğrulama hatası",
    "details": {
      "email": "E-posta geçerli değil"
    }
  }
}
```

### Hata Kodları

| Kod | Açıklama                     |
| --- | ---------------------------- |
| 400 | Bad Request                  |
| 401 | Unauthorized (Giriş gerekli) |
| 403 | Forbidden (İzin yok)         |
| 404 | Not Found (Bulunamadı)       |
| 409 | Conflict (Çakışma)           |
| 500 | Internal Server Error        |

## 🔄 Pagination

Tüm liste endpoint'leri pagination destekler:

```
GET /api/products?page=2&limit=20
```

**Response Format:**

```json
{
  "success": true,
  "data": [...],
  "pagination": {
    "page": 2,
    "limit": 20,
    "total": 100,
    "totalPages": 5,
    "hasNextPage": true,
    "hasPrevPage": true
  }
}
```

## 🔍 Filtreleme & Arama

### Filtreleme Örneği

```
GET /api/products?category=Elektronik&minPrice=100&maxPrice=500
```

### Arama Örneği

```
GET /api/products?search=laptop&sort=price_asc
```

## 📈 Rate Limiting

API rate limiting uygulanıyor:

- **Request Limit**: Dakikada 60 istek
- **Delay**: 1 saniye

## 🧪 Test Endpoint'leri

### Sağlık Kontrolü

```
GET /api/health
```

**Response:**

```json
{
  "status": "ok",
  "timestamp": "2024-06-17T15:30:00Z"
}
```

## 📝 Webhook Events

### Sipariş Güncellemesi

```
POST {webhook_url}
```

**Body:**

```json
{
  "event": "order.updated",
  "orderId": "order-1",
  "status": "shipped",
  "timestamp": "2024-06-17T15:30:00Z"
}
```

### Ödeme Tamamlandı

```
POST {webhook_url}
```

**Body:**

```json
{
  "event": "payment.completed",
  "paymentId": "pay-1",
  "orderId": "order-1",
  "amount": 501.99,
  "timestamp": "2024-06-17T15:30:00Z"
}
```

## 📞 Destek

API ile ilgili sorunlar için:

- **Email**: api-support@ciritp.com
- **Documentation**: https://docs.ciritp.com
- **Status Page**: https://status.ciritp.com

---

**Son Güncelleme**: 17 Haziran 2024
**API Versiyonu**: 1.0.0
