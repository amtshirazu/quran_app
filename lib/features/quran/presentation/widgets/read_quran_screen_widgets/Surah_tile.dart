import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/quran/presentation/state/providers.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/surah_verse_number_badge.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/surah_verses_badge.dart';

import '../../../domain/models/surah.dart';







class SurahTile extends ConsumerWidget {
  const SurahTile({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        ref.read(searchQueryProvider.notifier).state = "";
        ref.read(selectedSurahProvider.notifier).state = surah;
        context.push("/readAyah");
      },
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SurahVerseNumberBadge(surahNumber: surah.number),
              SizedBox(width: 16),

              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surah.nameEnglish,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.gray900,
                        ),
                      ),
                      Text(
                        surah.translation,
                        style: textTheme.bodyLarge?.copyWith(
                          color: AppColors.gray600,
                        ),
                      )
                    ],
                ),
              ),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.nameArabic,
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.gray900,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        SurahVersesBadge(totalAyahs: surah.totalAyahs),
                        SizedBox(width: 4,),
                        Icon(
                          LucideIcons.chevronRight,
                          color: AppColors.gray400,
                        ),
                      ],
                    ),
                  ]
              ),

            ],
          ),
        ),
      ),
    );
  }
}
