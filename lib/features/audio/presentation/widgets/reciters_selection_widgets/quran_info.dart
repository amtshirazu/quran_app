import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/constants/app_colors.dart';

class QuranAudioInfoCard extends StatelessWidget {
  const QuranAudioInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      elevation: 3,
      color: AppColors.gray300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Icon(
                    LucideIcons.bookOpen,
                    color: AppColors.emerald600,
                    size: 20,
                  ),
                ]
              ),

            const SizedBox(width: 8),

            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "About Quran Audio",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Listen to the complete Quran recited by world-renowned reciters. "
                          "Each reciter brings their unique style and melodious voice to the sacred text. "
                          "Audio files are streamed from Islamic Network's public API.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}