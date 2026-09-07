import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/theme/app_theme.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/states/azkaar_provider.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/widgets/azkaar/categories_list.dart';
import 'package:quran_app/features/azkaar_and_dua/presentation/widgets/azkaar/prophetic_tip_card.dart';

class AzkarCategoriesScreen extends ConsumerWidget {
  const AzkarCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: isDark ? AppTheme.darkScaffold : AppColors.emerald600,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.white, size: 22),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Azkar Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Daily remembrance from the Sunnah',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      body: categoriesAsync.when(
        data: (categories) => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: categories.length + 1,
          itemBuilder: (context, index) {
            if (index == categories.length) {
              return const PropheticTipCard();
            }
            return CategoryListCard(category: categories[index]);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.emerald600)),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
