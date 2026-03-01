import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../../core/constants/app_colors.dart';
import 'quick_acces_tile.dart';


class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Access",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.gray700,
            ),
          ),
          const SizedBox(height: 8), // spacing between title and row
          Row(
            children: const [
              Expanded(
                child: QuickAccessCard(
                  bgColor: AppColors.emerald100,
                  fgColor: AppColors.emerald600,
                  icon: LucideIcons.book,
                  label: "Last Read",
                  sublabel: "Al-Baqarah",
                ),
              ),
              SizedBox(width: 8), // gap between cards
              Expanded(
                child: QuickAccessCard(
                  bgColor: AppColors.blue100,
                  fgColor: AppColors.blue600,
                  icon: LucideIcons.bookOpen,
                  label: "Today",
                  sublabel: "Al-Kahf",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}