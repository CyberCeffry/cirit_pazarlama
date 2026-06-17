import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// Email servisi
class EmailService {
  static final EmailService _instance = EmailService._internal();

  factory EmailService() {
    return _instance;
  }

  EmailService._internal();

  // E-posta gönder (SMTP ayarları gerekli)
  Future<bool> sendEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    try {
      // SMTP ayarlarınızı buraya ekleyin
      // Örnek: Gmail, SendGrid, vb.

      // Bu örnekte simüle edilmiş
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      print('Email gönderi hatası: $e');
      return false;
    }
  }

  // Sipariş onayı e-postası
  Future<bool> sendOrderConfirmation({
    required String toEmail,
    required String customerName,
    required String orderId,
  }) async {
    final htmlBody =
        '''
    <h2>Siparişiniz Alındı!</h2>
    <p>Merhaba $customerName,</p>
    <p>Siparişiniz başarıyla oluşturulmuştur.</p>
    <p><strong>Sipariş No:</strong> $orderId</p>
    <p>Siparişinizin durumunu takip etmek için hesabınızı ziyaret edebilirsiniz.</p>
    <p>Teşekkürler!</p>
    ''';

    return sendEmail(
      toEmail: toEmail,
      subject: 'Sipariş Onayı - $orderId',
      body: htmlBody,
    );
  }

  // İletişim formu e-postası
  Future<bool> sendContactFormEmail({
    required String senderEmail,
    required String senderName,
    required String message,
  }) async {
    final htmlBody =
        '''
    <h2>Yeni İletişim Formu Mesajı</h2>
    <p><strong>Ad:</strong> $senderName</p>
    <p><strong>E-posta:</strong> $senderEmail</p>
    <p><strong>Mesaj:</strong></p>
    <p>$message</p>
    ''';

    return sendEmail(
      toEmail: 'info@example.com',
      subject: 'Yeni İletişim Formu Mesajı - $senderName',
      body: htmlBody,
    );
  }
}
