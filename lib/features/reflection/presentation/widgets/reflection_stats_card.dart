import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/theme/app_theme.dart';
import 'package:quran_app/features/reflection/presentation/states/reflection_provider.dart';

class ReflectionStatsCard extends ConsumerWidget {
  const ReflectionStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(reflectionStatsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : null,
        gradient: isDark
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.deepGreen, AppColors.emerald600],
              ),
        borderRadius: BorderRadius.circular(20),
        border: isDark ? Border.all(color: AppTheme.darkBorder) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Reflection Stats",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(stats['total'].toString(), "Total"),
              _buildStatItem(stats['thisWeek'].toString(), "This Week"),
              _buildStatItem(stats['surahs'].toString(), "Surahs"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.emerald100, fontSize: 12),
        ),
      ],
    );
  }
}
