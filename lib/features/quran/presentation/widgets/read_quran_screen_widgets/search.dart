import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/quran/presentation/state/quran_providers.dart';





class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return TextField(
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state  = value;
      },
      decoration: InputDecoration(
        hintText: "Search surah...",
        hintStyle: TextStyle(
          color: AppColors.gray300,
          fontSize: 18,
        ),
        prefixIcon: Icon(
          LucideIcons.search,
          size: 30,
          color: AppColors.gray400,
        ),
        filled: true,
         fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
