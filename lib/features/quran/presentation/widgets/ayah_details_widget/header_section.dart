import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/search.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../state/providers.dart';





class AyahHeaderSection extends ConsumerWidget {
  const AyahHeaderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final surahMetadata = ref.watch(selectedSurahProvider);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
      decoration: const BoxDecoration(
        color: AppColors.emerald600,
      ),

      child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.go("/surahs");
                  },
                  icon: Icon(
                    LucideIcons.arrowLeft,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                SizedBox(width: 16,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surahMetadata?.nameEnglish ?? "",
                      style: textTheme.titleLarge,
                    ),

                    Text(
                      surahMetadata?.translation ?? "",
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),

                Spacer(),

                IconButton(
                  onPressed: () {
                    context.go('/audio');
                  },
                  icon: Icon(
                    LucideIcons.play,
                    color: AppColors.gray200,
                    size: 24,
                  ),
                ),

              ],
            ),
      );
  }
}
