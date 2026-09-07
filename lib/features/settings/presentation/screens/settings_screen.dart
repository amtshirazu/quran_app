import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/features/quran/presentation/state/translation_provider.dart';
import 'package:quran_app/features/settings/presentation/state/theme_provider.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_row.dart';
import '../widgets/settings_section_title.dart';
import '../widgets/settings_slider_row.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _ayahBeforeTranslation = true;
  bool _dyslexiaFont = false;
  double _ayahTextSize = 15;
  double _translationTextSize = 15;
  String _selectedScript = 'Uthmanic';

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    final selectedTranslations = ref.watch(selectedTranslationsProvider);
    final String translationSubtitle = selectedTranslations.length > 1
        ? 'Multiple (${selectedTranslations.length})'
        : 'Sahih International';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SettingsHeader(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1. READING
            const SettingsSectionTitle(title: 'Reading'),
            SettingsCard(
              children: [
                SettingsRow(
                  icon: LucideIcons.bookOpen,
                  title: 'Translation',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        translationSubtitle,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : AppColors.gray600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                    ],
                  ),
                  onTap: () {
                    context.push('/translations');
                  },
                ),
                SettingsRow(
                  icon: LucideIcons.moon,
                  title: 'Dark mode',
                  subtitle: 'App theme switches instantly to a dark palette for night reading',
                  showDivider: false,
                  trailing: Switch(
                    value: isDarkMode,
                    activeTrackColor: AppColors.emerald600,
                    onChanged: (val) {
                      ref.read(themeModeProvider.notifier).toggleDarkMode(val);
                    },
                  ),
                ),
              ],
            ),

            /// 2. AUDIO
            const SettingsSectionTitle(title: 'Audio'),
            SettingsCard(
              children: [
                SettingsRow(
                  icon: LucideIcons.volume2,
                  title: 'Default Reciter',
                  showDivider: false,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Alafasy (Select...)',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : AppColors.gray600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                    ],
                  ),
                  onTap: () {
                    // Open Reciter Selector
                  },
                ),
              ],
            ),

            /// 3. DISPLAY
            const SettingsSectionTitle(title: 'Display'),
            SettingsCard(
              children: [
                SettingsRow(
                  title: 'Ayah before translation',
                  subtitle: 'Show Arabic above the translation',
                  trailing: Switch(
                    value: _ayahBeforeTranslation,
                    activeTrackColor: AppColors.emerald600,
                    onChanged: (val) {
                      setState(() => _ayahBeforeTranslation = val);
                    },
                  ),
                ),
                SettingsRow(
                  title: 'Dyslexia friendly font',
                  subtitle: 'Easier-to-read translation font',
                  trailing: Switch(
                    value: _dyslexiaFont,
                    activeTrackColor: AppColors.emerald600,
                    onChanged: (val) {
                      setState(() => _dyslexiaFont = val);
                    },
                  ),
                ),
                SettingsSliderRow(
                  title: 'Ayah text size',
                  value: _ayahTextSize,
                  onChanged: (val) {
                    setState(() => _ayahTextSize = val);
                  },
                ),
                SettingsSliderRow(
                  title: 'Translation text size',
                  value: _translationTextSize,
                  showDivider: false,
                  onChanged: (val) {
                    setState(() => _translationTextSize = val);
                  },
                ),
              ],
            ),

            /// 4. QURAN SCRIPT
            const SettingsSectionTitle(title: 'Quran Script'),
            SettingsCard(
              children: [
                SettingsRow(
                  title: 'IndoPak',
                  trailing: _selectedScript == 'IndoPak'
                      ? const Icon(Icons.check_circle, color: AppColors.emerald600, size: 20)
                      : const SizedBox.shrink(),
                  onTap: () {
                    setState(() => _selectedScript = 'IndoPak');
                  },
                ),
                SettingsRow(
                  title: 'Uthmanic',
                  showDivider: false,
                  trailing: _selectedScript == 'Uthmanic'
                      ? const Icon(Icons.check_circle, color: AppColors.emerald600, size: 20)
                      : const SizedBox.shrink(),
                  onTap: () {
                    setState(() => _selectedScript = 'Uthmanic');
                  },
                ),
              ],
            ),

            /// 5. GENERAL
            const SettingsSectionTitle(title: 'General'),
            SettingsCard(
              children: [
                SettingsRow(
                  icon: LucideIcons.globe,
                  title: 'Language',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : AppColors.gray600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                    ],
                  ),
                  onTap: () {},
                ),
                SettingsRow(
                  icon: LucideIcons.download,
                  title: 'Downloads',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '184 MB',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : AppColors.gray600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                    ],
                  ),
                  onTap: () {},
                ),
                SettingsRow(
                  icon: LucideIcons.info,
                  title: 'About',
                  showDivider: false,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'v2.1.0',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white70 : AppColors.gray600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),

            /// 6. OTHER
            const SettingsSectionTitle(title: 'Other'),
            SettingsCard(
              children: [
                SettingsRow(
                  iconWidget: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF25D366),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      LucideIcons.messageCircle,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  title: 'Feedback / Chat',
                  subtitle: "Let's share your thoughts with us",
                  trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                  onTap: () {},
                ),
                SettingsRow(
                  iconWidget: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF59E0B),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      LucideIcons.star,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  title: 'Rate Us',
                  subtitle: 'Your feedback will help millions of users worldwide',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                  onTap: () {},
                ),
                SettingsRow(
                  iconWidget: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3B82F6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      LucideIcons.share2,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  title: 'Share App',
                  subtitle: 'Invite & Share 5 Friends to Remove Ads',
                  showDivider: false,
                  trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
