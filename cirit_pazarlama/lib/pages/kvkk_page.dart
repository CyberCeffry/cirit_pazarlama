import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/app_footer.dart';

class KvkkPage extends StatelessWidget {
  const KvkkPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kişisel Verileri Koruma Kanunu (KVKK)',
              style: TextStyle(
                fontSize: AppFontSizes.xxl,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Son Güncelleme: 2024',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppFontSizes.sm,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            _buildSection(
              'Giriş',
              'Cirit Pazarlama ("Şirket", "biz", "bizim" veya "bize"), 6698 sayılı Kişisel Verileri Koruma Kanunu\'na ("KVKK") uygun olarak bu Gizlilik Politikası\'nı hazırlamıştır. Bu politika, web sitemizi ve uygulamalarımızı ziyaret ettiğinizde nasıl kişisel verilerinizi topladığımız, işlediğimiz, koruduğumuz ve kullandığımız hakkında bilgi sağlar.',
            ),

            _buildSection(
              '1. Toplanan Veriler',
              'Aşağıdaki kişisel verileri toplayabiliriz:\n'
                  '• Kimlik Bilgileri: Ad, soyad, e-posta adresi, telefon numarası\n'
                  '• Adres Bilgileri: Ev adresi, iş adresi, posta kodu\n'
                  '• Ödeme Bilgileri: Kredi kartı bilgileri, banka bilgileri\n'
                  '• Alışveriş Bilgileri: Satın aldığınız ürünler, sipariş tarihleri\n'
                  '• Teknik Veriler: IP adresi, tarayıcı türü, cihaz bilgileri\n'
                  '• Tercihler: Dil seçimi, tema seçimi, favori ürünler',
            ),

            _buildSection(
              '2. Verilerin Kullanım Amacı',
              'Kişisel verileriniz aşağıdaki amaçlarla kullanılır:\n'
                  '• Siparişlerinizi işlemek ve teslimatı sağlamak\n'
                  '• Müşteri desteği sağlamak\n'
                  '• Pazarlama ve promosyon amaçları\n'
                  '• Ürün ve hizmetlerimizi geliştirmek\n'
                  '• Yasal yükümlülükleri yerine getirmek\n'
                  '• Dolandırıcılık ve kötüye kullanımı önlemek',
            ),

            _buildSection(
              '3. Verilerin Korunması',
              'Kişisel verileriniz şifreleme, güvenli sunucular ve erişim kontrolleri ile korunur. Yalnızca yetkilendirilmiş personel verilerinize erişebilir. Hakkınız olan tüm veriler, talep üzerine 30 gün içinde silinecektir.',
            ),

            _buildSection(
              '4. Verilerin Paylaşılması',
              'Kişisel verileriniz sadece aşağıdakilerle paylaşılır:\n'
                  '• Kargo şirketleri (teslimat amacıyla)\n'
                  '• Ödeme işlemcileri (ödeme işlemi amacıyla)\n'
                  '• Yasal merciler (kanuni zorunluluk halinde)\n'
                  '• Hizmet sağlayıcılar (sistem yönetimi amacıyla)',
            ),

            _buildSection(
              '5. Çerezler (Cookies)',
              'Web sitesi ve uygulamalarımız çerez kullanır. Çerezler, deneyiminizi geliştirmek ve kullanım istatistikleri almak için kullanılır. Tarayıcı ayarlarından çerezleri kapatabilirsiniz.',
            ),

            _buildSection(
              '6. Sizin Haklarınız',
              'KVKK uyarınca aşağıdaki haklara sahipsiniz:\n'
                  '• Kişisel verilerinize erişim hakkı\n'
                  '• Verilerin düzeltilmesini talep etme hakkı\n'
                  '• Verilerin silinmesini talep etme hakkı\n'
                  '• Verilerin işlenmesini kısıtlamakta talep etme hakkı\n'
                  '• Verilerin taşınabilirliğini talep etme hakkı',
            ),

            _buildSection(
              '7. İletişim',
              'Gizlilik konularında sorularınız varsa, lütfen aşağıdaki iletişim bilgilerinden bizimle iletişime geçin:\n'
                  'E-posta: info@ciritp.com\n'
                  'Telefon: +90 (542) 525 25 25\n'
                  'Adres: Örnek Sokak No:123, İstanbul, Türkiye',
            ),

            const SizedBox(height: AppSpacing.lg),
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: AppFontSizes.lg,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          content,
          style: const TextStyle(
            fontSize: AppFontSizes.sm,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
