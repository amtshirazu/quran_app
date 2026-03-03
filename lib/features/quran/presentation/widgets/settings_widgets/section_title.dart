import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';


class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: textTheme.titleMedium?.copyWith(
          color: AppColors.gray700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}