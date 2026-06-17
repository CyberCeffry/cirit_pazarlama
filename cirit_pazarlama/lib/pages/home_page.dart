import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/index.dart';
import '../widgets/index.dart';
import '../constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Cirit Pazarlama',
                  style: TextStyle(
                    fontSize: AppFontSizes.xxl,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'En iyi ürünleri, en uygun fiyatlarla bulun',
                  style: TextStyle(
                    fontSize: AppFontSizes.lg,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                ElevatedButton(
                  onPressed: () {
                    // Ürünler sayfasına git
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  child: const Text('Alışverişe Başla'),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Öne Çıkan Ürünler
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Öne Çıkan Ürünler',
                  style: TextStyle(
                    fontSize: AppFontSizes.xl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Consumer<ProductProvider>(
                  builder: (context, provider, _) {
                    final featured = provider.getFeaturedProducts();
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600
                            ? 3
                            : 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: AppSpacing.md,
                        mainAxisSpacing: AppSpacing.md,
                      ),
                      itemCount: featured.length,
                      itemBuilder: (context, index) {
                        final product = featured[index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            // Ürün detayına git
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Kategoriler
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kategoriler',
                  style: TextStyle(
                    fontSize: AppFontSizes.xl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Consumer<ProductProvider>(
                  builder: (context, provider, _) {
                    final categories = provider.getCategories();
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                          ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppRadius.lg),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                fontSize: AppFontSizes.md,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Footer
          const AppFooter(),
        ],
      ),
    );
  }
}
