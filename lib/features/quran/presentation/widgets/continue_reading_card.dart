import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';




class ContinueReadingCard extends StatelessWidget {
  const ContinueReadingCard({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      color: Colors.white,
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  LucideIcons.bookOpen,
                  color: AppColors.emerald600,
                  size: 24,
                ),

                SizedBox(width: 10,),

                Text(
                  "Continue Reading",
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.gray900,
                  ),
                ),

                Spacer(),

                Icon(
                  LucideIcons.chevronRight,
                  color: AppColors.gray600,
                  size: 24,
                )
              ],
            ),

            SizedBox(height: 8),

            Text(
              "Al-Baqarah • Verse 156",
              style: TextStyle(color: AppColors.gray600),
            ),

            SizedBox(height: 12),

            LinearProgressIndicator(
              value: 0.54,
              backgroundColor: AppColors.gray200,
              valueColor: AlwaysStoppedAnimation(
                AppColors.emerald600,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "54% completed",
              style: TextStyle(color: AppColors.gray600),
            ),
          ],
        ),
      ),
    );
  }
}