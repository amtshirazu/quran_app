import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/core/widgets/Loading.dart';
import 'package:quran_app/features/quran/presentation/state/quran_providers.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/Surah_tile.dart';
import '../../../../../core/constants/app_colors.dart';

class SurahList extends ConsumerWidget {
  const SurahList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahAsync = ref.watch(surahListProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final textTheme = Theme.of(context).textTheme;

    return surahAsync.when(
      loading: () => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: LoadingWidget(),
        ),
      ),

      error: (err, stack) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Text('Error: $err')),
        ),
      ),

      data: (surahs) {

        final filteredSurahs = surahs.where((surahs) {
          final query = searchQuery.toLowerCase();
          return surahs.nameArabic.toLowerCase().contains(query) ||
              surahs.nameEnglish.toLowerCase().contains(query);
        }).toList();

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: Text(
                  "ALL SURAHS",
                  style: textTheme.titleMedium?.copyWith(
                    color: AppColors.gray700,
                  ),
                ),
              );
            }

            final surah = filteredSurahs[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, ),
              child: SurahTile(
                surah: surah,
              ),
            );
          },
            childCount: filteredSurahs.length + 1,
          ),
        );
      },
    );
  }
}
