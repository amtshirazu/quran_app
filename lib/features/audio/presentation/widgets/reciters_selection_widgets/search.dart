import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/theme/app_theme.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';
import '../../state/audio_providers.dart';

class FeaturedRecitersCard extends ConsumerWidget {
  const FeaturedRecitersCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      elevation: isDark ? 0 : 1,
      color: isDark ? AppTheme.darkSurface : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isDark ? const BorderSide(color: AppTheme.darkBorder) : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Featured Reciters",
              style: TextStyle(
                fontSize: AppSpacing.size16,
                fontWeight: FontWeight.bold,
                color: isDark ? AppTheme.darkTextPrimary : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Choose from renowned Quran reciters from around the world",
              style: TextStyle(
                fontSize: AppSpacing.size12,
                color: isDark ? AppTheme.darkTextSecondary : Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                ref.read(recitersSearchQueryProvider.notifier).state = value;
              },
              style: TextStyle(
                color: isDark ? AppTheme.darkTextPrimary : Colors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: "Search by reciter name or country...",
                hintStyle: TextStyle(
                  fontSize: AppSpacing.size12,
                  color: isDark ? AppTheme.darkTextSecondary : Colors.grey,
                ),
                prefixIcon: Icon(
                  LucideIcons.search,
                  size: 20,
                  color: isDark ? AppTheme.darkTextSecondary : Colors.grey,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDark ? AppTheme.darkBorder : Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.emerald600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
