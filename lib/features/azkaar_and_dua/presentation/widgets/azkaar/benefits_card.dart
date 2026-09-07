import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/theme/app_theme.dart';

class BenefitsCard extends StatelessWidget {
  const BenefitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final benefits = [
      'Brings peace and tranquility to the heart',
      'Strengthens your connection with Allah',
      'Provides protection from harm',
      'Increases blessings in your life',
    ];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : const Color(0xFFFFF9C4).withAlpha(76),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppTheme.darkBorder : const Color(0xFFFFF176).withAlpha(128),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Benefits of Dhikr',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? AppTheme.darkTextPrimary : const Color(0xFF5D4037),
            ),
          ),
          const SizedBox(height: 12),
          ...benefits.map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(
                      color: AppColors.emerald600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      benefit,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? AppTheme.darkTextSecondary : Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
