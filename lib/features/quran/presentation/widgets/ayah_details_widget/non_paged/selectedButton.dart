import 'package:flutter/material.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/constants/app_spacing.dart';
import 'package:quran_app/core/theme/app_theme.dart';

class SelectedButton extends StatefulWidget {
  const SelectedButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark
        ? (isTapped ? AppTheme.darkBorder : AppTheme.darkScaffold)
        : (isTapped ? AppColors.gray200 : Colors.white);

    final borderColor = isDark ? AppTheme.darkBorder : AppColors.gray200;
    final contentColor = isDark ? AppTheme.darkTextPrimary : AppColors.gray900;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            isTapped = !isTapped;
          });
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(AppSpacing.size12),
            border: Border.all(color: borderColor, width: isDark ? 1 : 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 18, color: contentColor),
              const SizedBox(width: 8),
              Text(
                widget.text,
                style: textTheme.bodyMedium?.copyWith(
                  color: contentColor,
                  fontSize: AppSpacing.size11,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
