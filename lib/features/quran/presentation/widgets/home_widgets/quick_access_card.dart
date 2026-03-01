import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/constants/app_colors.dart';





class QuickAccessCard extends StatelessWidget {
  const QuickAccessCard({
    super.key,
    required this.icon,
    required this.text,
    required this.bgColor,
    required this.fgColor,
  });

  final IconData icon;
  final String text;
  final Color bgColor;
  final Color fgColor;

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,

        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: fgColor,
                  size: 24,
                ),
              ),

              SizedBox(height: 12),

              Text(
                text,
                style: textTheme.headlineLarge?.copyWith(
                  color: AppColors.gray900,
                ),
              )
            ],
          ),
        ),
      );
  }
}
