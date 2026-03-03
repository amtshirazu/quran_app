import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_widgets/reciter_row.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_widgets/section_title.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_widgets/settings_card.dart';
import 'package:quran_app/features/quran/presentation/widgets/settings_widgets/settings_row.dart';
import '../../../../core/constants/app_colors.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.emerald50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              color: AppColors.emerald600,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
                    onPressed: () => context.go("/"),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SectionTitle(title: "READING"),
                  SettingsCard(
                    children: [
                      SettingsRow(
                        icon: LucideIcons.book,
                        label: "Translation",
                        trailing: Row(
                          children: [
                            Text(
                              "English",
                              style:textTheme.bodyMedium?.copyWith(
                                color: AppColors.gray600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(LucideIcons.chevronRight, color: Colors.grey, size: 18),
                          ],
                        ),
                        onTap: () {},
                        borderBottom: true,
                      ),
                      SettingsRow(
                        icon: LucideIcons.moon,
                        label: "Dark Mode",
                        trailing: Switch(value: false, onChanged: (_) {

                        }),
                      ),
                    ],
                  ),

                  const SectionTitle(title: "AUDIO"),
                  SettingsCard(
                    children: [
                      ReciterRow(),
                    ],
                  ),

                  const SectionTitle(title: "NOTIFICATIONS"),
                  SettingsCard(
                    children: [
                      SettingsRow(
                        icon: LucideIcons.bell,
                        label: "Prayer Reminders",
                        trailing: Switch(value: true, onChanged: (_) {}),
                        borderBottom: true,
                      ),
                      SettingsRow(
                        icon: LucideIcons.bell,
                        label: "Daily Verse",
                        trailing: Switch(value: true, onChanged: (_) {}),
                      ),
                    ],
                  ),

                  const SectionTitle(title: "GENERAL"),
                  SettingsCard(
                    children: [
                      SettingsRow(
                        icon: LucideIcons.globe,
                        label: "Language",
                        trailing: Row(
                          children: [
                            Text(
                                "English",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.gray600,
                                ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(LucideIcons.chevronRight, color: Colors.grey, size: 18),
                          ],
                        ),
                        borderBottom: true,
                      ),
                      SettingsRow(
                        icon: LucideIcons.download,
                        label: "Downloads",
                        trailing: const Icon(LucideIcons.chevronRight, color: Colors.grey, size: 18),
                        borderBottom: true,
                      ),
                      SettingsRow(
                        icon: LucideIcons.info,
                        label: "About",
                        trailing: const Icon(LucideIcons.chevronRight, color: Colors.grey, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

