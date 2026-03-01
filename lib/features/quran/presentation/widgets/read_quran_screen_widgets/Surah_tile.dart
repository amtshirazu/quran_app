import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/surah_verse_number_badge.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/surah_verses_badge.dart';







class SurahTile extends StatelessWidget {
  const SurahTile({
    super.key,
    required this.surahNumber,
    required this.transliteration,
    required this.nameArabic,
    required this.totalAyahs,
    required this.translation,
  });

  final int surahNumber;
  final int totalAyahs;
  final String translation;
  final String transliteration;
  final String nameArabic;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SurahVerseNumberBadge(surahNumber: surahNumber),
              SizedBox(width: 16),

              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transliteration,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.gray900,
                        ),
                      ),
                      Text(
                        translation,
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
                      nameArabic,
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.gray900,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        SurahVersesBadge(totalAyahs: totalAyahs),
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
