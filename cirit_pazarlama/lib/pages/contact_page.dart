import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../services/email_service.dart';
import '../widgets/app_footer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage();

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await EmailService().sendContactFormEmail(
        senderEmail: _emailController.text,
        senderName: _nameController.text,
        message:
            'Konu: ${_subjectController.text}\n\n${_messageController.text}',
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Mesajınız başarıyla gönderildi! En kısa sürede size dönüş yapacağız.',
            ),
            backgroundColor: Colors.green,
          ),
        );
        _formKey.currentState!.reset();
      } else {
        throw Exception('Email gönderilemedi');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hata: ${e.toString()}'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.lg,
            ),
            color: AppColors.primary,
            child: const Column(
              children: [
                Text(
                  'Bize İletişime Geçin',
                  style: TextStyle(
                    fontSize: AppFontSizes.xxl,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Sorularınız veya önerileriniz için bizimle iletişime geçebilirsiniz',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: AppFontSizes.sm,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                // İletişim Bilgileri
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: Column(
                    children: [
                      _contactInfo(
                        icon: Icons.email,
                        title: 'E-posta',
                        value: 'info@ciritp.com',
                      ),
                      const Divider(),
                      _contactInfo(
                        icon: Icons.phone,
                        title: 'Telefon',
                        value: '+90 (542) 525 25 25',
                      ),
                      const Divider(),
                      _contactInfo(
                        icon: Icons.location_on,
                        title: 'Adres',
                        value: 'Örnek Sokak No:123, İstanbul, Türkiye',
                      ),
                      const Divider(),
                      _contactInfo(
                        icon: Icons.schedule,
                        title: 'Çalışma Saatleri',
                        value: 'Pazartesi - Cuma: 09:00 - 18:00',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Ad Soyad',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ad Soyad gerekli';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'E-posta',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'E-posta gerekli';
                          }
                          if (!value.contains('@')) {
                            return 'Geçerli e-posta girin';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextFormField(
                        controller: _subjectController,
                        decoration: const InputDecoration(
                          labelText: 'Konu',
                          prefixIcon: Icon(Icons.subject),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Konu gerekli';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextFormField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelText: 'Mesaj',
                          prefixIcon: Icon(Icons.message),
                        ),
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mesaj gerekli';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submitForm,
                          child: _isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Gönder'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _contactInfo({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: AppSpacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppFontSizes.sm,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppFontSizes.sm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
