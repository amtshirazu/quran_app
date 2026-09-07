import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/theme/app_theme.dart';
import 'package:quran_app/features/quran/presentation/state/translation_provider.dart';
import 'package:quran_app/features/settings/presentation/state/display_settings_provider.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_row.dart';
import '../widgets/settings_section_title.dart';
import '../widgets/settings_stepper_row.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    final selectedTranslations = ref.watch(selectedTranslationsProvider);
    final String translationSubtitle = selectedTranslations.length > 1
        ? 'Multiple (${selectedTranslations.length})'
        : 'Sahih International';

    final quranScript = ref.watch(quranScriptProvider);
    final ayahTextSize = ref.watch(ayahTextSizeProvider);
    final translationTextSize = ref.watch(translationTextSizeProvider);
    final transliterationTextSize = ref.watch(transliterationTextSizeProvider);
    final referenceTextSize = ref.watch(referenceTextSizeProvider);
    final showAyahBefore = ref.watch(showAyahBeforeTranslationProvider);

    final fontName = quranScript == 'IndoPak' ? "Indo Park" : "Uthmanic";

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
                  onTap: () {},
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
                    value: showAyahBefore,
                    activeTrackColor: AppColors.emerald600,
                    onChanged: (val) {
                      ref.read(showAyahBeforeTranslationProvider.notifier).toggle(val);
                    },
                  ),
                ),
                SettingsStepperRow(
                  title: 'Ayah text size',
                  value: ayahTextSize,
                  onDecrement: () =>
                      ref.read(ayahTextSizeProvider.notifier).decrement(),
                  onIncrement: () =>
                      ref.read(ayahTextSizeProvider.notifier).increment(),
                  previewWidget: Text(
                    "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: fontName,
                      fontSize: ayahTextSize,
                      color: isDarkMode ? AppTheme.darkTextPrimary : AppColors.gray900,
                    ),
                  ),
                ),
                SettingsStepperRow(
                  title: 'Transliteration text size',
                  value: transliterationTextSize,
                  onDecrement: () =>
                      ref.read(transliterationTextSizeProvider.notifier).decrement(),
                  onIncrement: () =>
                      ref.read(transliterationTextSizeProvider.notifier).increment(),
                  previewWidget: Text(
                    "Rabbanaa afrigh 'alaynaa sabran wa thabbit aqdaamanaa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: transliterationTextSize,
                      fontStyle: FontStyle.italic,
                      color: isDarkMode ? AppTheme.darkTextSecondary : AppColors.gray700,
                    ),
                  ),
                ),
                SettingsStepperRow(
                  title: 'Translation text size',
                  value: translationTextSize,
                  onDecrement: () =>
                      ref.read(translationTextSizeProvider.notifier).decrement(),
                  onIncrement: () =>
                      ref.read(translationTextSizeProvider.notifier).increment(),
                  previewWidget: Text(
                    "Our Lord! Pour forth on us patience and make us victorious over the disbelieving people.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: translationTextSize,
                      color: isDarkMode ? AppTheme.darkTextPrimary : AppColors.gray900,
                    ),
                  ),
                ),
                SettingsStepperRow(
                  title: 'Reference text size',
                  value: referenceTextSize,
                  showDivider: false,
                  onDecrement: () =>
                      ref.read(referenceTextSizeProvider.notifier).decrement(),
                  onIncrement: () =>
                      ref.read(referenceTextSizeProvider.notifier).increment(),
                  previewWidget: Text(
                    "Quran 2:250 • Al-Bukhari, Muslim",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: referenceTextSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.emerald600,
                    ),
                  ),
                ),
              ],
            ),

            /// 4. QURAN SCRIPT
            const SettingsSectionTitle(title: 'Quran Script'),
            SettingsCard(
              children: [
                SettingsRow(
                  title: 'IndoPak',
                  trailing: quranScript == 'IndoPak'
                      ? const Icon(Icons.check_circle, color: AppColors.emerald600, size: 20)
                      : const SizedBox.shrink(),
                  onTap: () {
                    ref.read(quranScriptProvider.notifier).setScript('IndoPak');
                  },
                ),
                SettingsRow(
                  title: 'Uthmanic',
                  showDivider: false,
                  trailing: quranScript == 'Uthmanic'
                      ? const Icon(Icons.check_circle, color: AppColors.emerald600, size: 20)
                      : const SizedBox.shrink(),
                  onTap: () {
                    ref.read(quranScriptProvider.notifier).setScript('Uthmanic');
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
                  icon: LucideIcons.messageSquare,
                  title: 'Feedback / Chat',
                  subtitle: "Let's share your thoughts with us",
                  trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                  onTap: () {},
                ),
                SettingsRow(
                  icon: LucideIcons.star,
                  title: 'Rate Us',
                  subtitle: 'Your feedback will help millions of users worldwide',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.gray400, size: 20),
                  onTap: () {},
                ),
                SettingsRow(
                  icon: LucideIcons.share2,
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
