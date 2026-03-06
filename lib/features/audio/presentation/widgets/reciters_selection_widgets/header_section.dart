import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/constants/app_colors.dart';

class QuranAudioHeader extends ConsumerWidget {
  final int recitersCount;

  const QuranAudioHeader({super.key, required this.recitersCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        height: 140,
        decoration: const BoxDecoration(
          color: AppColors.emerald600,
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
      
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                LucideIcons.bookOpen,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Quran Audio",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Listen to beautiful recitations",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    softWrap: true,
                  ),
                ],
              ),
            ),
      
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.star, size: 14, color: Colors.green),
                  const SizedBox(width: 10),
                  Text(
                    "$recitersCount Reciters",
                    style: const TextStyle(
                      color: AppColors.emerald600,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
