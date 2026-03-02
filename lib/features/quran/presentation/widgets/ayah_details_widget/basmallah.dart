import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/app_colors.dart';


class Basmallah extends StatelessWidget {
  const Basmallah({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
            style: textTheme.titleLarge?.copyWith(
              color: AppColors.gray900,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'In the name of Allah, the Most Gracious, the Most Merciful',
            style: textTheme.titleSmall?.copyWith(
              color: AppColors.gray600,
            ),
          ),
        ],
      ),
    );
  }
}
