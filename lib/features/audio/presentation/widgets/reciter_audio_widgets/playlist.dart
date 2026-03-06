import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/quran/presentation/state/quran_providers.dart';

class Playlist extends ConsumerWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahsAsync = ref.watch(surahListProvider);

    return surahsAsync.when(
      loading: () => const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),

      error: (e, st) => SliverToBoxAdapter(
        child: Center(child: Text("Error: $e")),
      ),

      data: (surahs) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final surah = surahs[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),

                title: Text(surah.nameEnglish),

                subtitle: Text(
                  "${surah.translation} • ${surah.totalAyahs} verses",
                ),

                trailing: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(surah.nameArabic),
                ),

                onTap: () {},
              );
            },
            childCount: surahs.length,
          ),
        );
      },
    );
  }
}