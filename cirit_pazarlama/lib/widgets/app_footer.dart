import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppFooter extends StatelessWidget {
  const AppFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textPrimary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        children: [
          // Linkler
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _FooterLink(label: 'Hakkımızda', onTap: () {}),
              _FooterLink(label: 'İletişim', onTap: () {}),
              _FooterLink(label: 'KVKK', onTap: () {}),
              _FooterLink(label: 'Şartlar', onTap: () {}),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // Sosyal Medya
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.language),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.email),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          const Divider(color: Colors.white30),
          // Copyright
          Center(
            child: Text(
              '© 2024 ${AppConstants.appName}. Tüm hakları saklıdır.',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: AppFontSizes.xs,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
