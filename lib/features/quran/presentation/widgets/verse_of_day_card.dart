import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/constants/app_colors.dart';




class DailyVerseCard extends StatelessWidget {
  const DailyVerseCard({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 25,left: 15,right: 15),
      elevation: 6,
      clipBehavior: Clip.antiAlias,

      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.emerald500,
              AppColors.emerald600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    LucideIcons.heart,
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 10,),
                  Text("Verse of the Day",
                    style: textTheme.headlineLarge,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                "إِنَّ مَعَ الْعُسْرِ يُسْرًا",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "For indeed, with hardship will be ease.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.emerald50),
              ),

              const SizedBox(height: 8),

              const Text(
                "Surah Ash-Sharh (94:6)",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.emerald50),
              ),
            ],
          ),
        ),
      ),


    );
  }
}