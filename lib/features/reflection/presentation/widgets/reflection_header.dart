import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/reflection/presentation/states/reflection_provider.dart';

class ReflectionHeader extends ConsumerWidget {
  const ReflectionHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the stats or list length for the "X reflections" subtitle
    final reflectionListAsync = ref.watch(reflectionsUIProvider);
    final count = reflectionListAsync.maybeWhen(
      data: (list) => list.length,
      orElse: () => 0,
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.deepGreen, AppColors.emerald600],
        ),
      ),
      child: Column(
        children: [
          // Top Row: Back, Title/Count, and New Button
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
                icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reflection Journal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$count reflections",
                      style: const TextStyle(
                        color: AppColors.emerald100,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              // "+ New" Button
              ElevatedButton.icon(
                onPressed: () => context.go('/surahs'),
                icon: const Icon(Icons.add, size: 18),
                label: const Text("New"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.emerald600,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Search Bar
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white30),
            ),
            child: TextField(
              onChanged: (value) {
                ref.read(reflectionSearchQueryProvider.notifier).state = value;
              },
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: "Search reflections...",
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  LucideIcons.search,
                  color: Colors.white70,
                  size: 18,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
