import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/state/reading_mode.dart';

import '../../../../core/constants/app_spacing.dart';





class ModeSwitcher extends StatelessWidget {
  const ModeSwitcher({
    super.key,
    required this.mode,
    required this.onChanged
  });

  final ReadingMode mode;
  final Function(ReadingMode) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSpacing.medium),
      padding: EdgeInsets.all(AppSpacing.smallest),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          buildButton("Translation", ReadingMode.translation),
          buildButton("Translation", ReadingMode.translation),
        ],
      ),
    );
  }

  Widget buildButton(String text, ReadingMode translation) {

    return GestureDetector(
      onTap: () => onChanged(translation),
      child: Container(
        padding: EdgeInsets.symmetric(vertical : 12),
        decoration: BoxDecoration(
          color: mode == translation ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: mode == translation ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      )
    );
  }
}
