import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/progress/presentation/state/profile_progress_provider.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';

class GreetingRow extends ConsumerWidget {
  const GreetingRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "As-Salamu Alaykum",
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSpacing.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "May peace be upon you",
              style: TextStyle(
                color: AppColors.emerald100,
                fontSize: AppSpacing.size14,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            ref.invalidate(profileProgressProvider);
            context.go('/profile');
          },
          child: Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(51),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white30, width: 1.5),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.person, color: Colors.white, size: 36),
          ),
        ),
      ],
    );
  }
}
