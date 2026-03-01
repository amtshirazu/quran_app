import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/home_widgets/next_prayer_card.dart';
import '../../../../../core/constants/app_colors.dart';
import 'greeting_row.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
      decoration: const BoxDecoration(
        color: AppColors.emerald600,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      child: Column(
        children: const [
          GreetingRow(),
          SizedBox(height: 20),
          NextPrayerCard(),
        ],
      ),
    );
  }
}