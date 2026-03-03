import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_widgets/settings_row.dart';

import '../../../../../core/constants/app_colors.dart';



class ReciterRow extends ConsumerStatefulWidget {
  const ReciterRow({super.key});

  @override
  ConsumerState<ReciterRow> createState() => _ReciterRowState();
}

class _ReciterRowState extends ConsumerState<ReciterRow> {
  final List<String> reciters = [
    "Mishary",
    "Saad",
    "Abdul Basit",
    "Maher",
    "Ali Jaber"
  ];

  String selectedReciter = "Mishary";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SettingsRow(
      icon: LucideIcons.volume2,
      label: "Default Reciter",
      trailing: DropdownButton<String>(
        value: selectedReciter,
        underline: const SizedBox(),
        style: textTheme.bodyMedium?.copyWith(
          color: AppColors.gray600,
        ),
        icon: const Icon(LucideIcons.chevronDown, color: Colors.grey, size: 18),
        items: reciters.map((reciter) {
          return DropdownMenuItem(
            value: reciter,
            child: Text(reciter),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              selectedReciter = value;
            });
          }
        },
      ),
      onTap: null,
    );
  }
}