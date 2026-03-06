import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../domain/models/Reciters.dart';






class ReciterHeader extends StatelessWidget {
  const ReciterHeader({
    super.key,
    required this.reciter,
  });

  final Reciter reciter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                  LucideIcons.arrowLeft,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mishary Alafasy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "مشاري العفاسي",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray400,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
