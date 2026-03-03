import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';




class SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget trailing;
  final VoidCallback? onTap;
  final bool borderBottom;

  const SettingsRow({
    super.key,
    required this.icon,
    required this.label,
    required this.trailing,
    this.onTap,
    this.borderBottom = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: borderBottom
            ? const BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: AppColors.gray400,
                width: 1.5,
            ),
          ),
        )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                    icon,
                    color: AppColors.gray600,
                    size: 20
                ),
                const SizedBox(width: 12),
                Text(
                    label,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray900,
                    ),
                ),
              ],
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}