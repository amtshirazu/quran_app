import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/quran/presentation/state/quran_providers.dart';
import 'package:quran_app/features/quran/presentation/widgets/ayah_details_widget/header_section.dart';
import '../../../../core/constants/app_colors.dart';
import '../state/reading_mode.dart';
import '../widgets/ayah_details_widget/ayah_list.dart';
import '../widgets/ayah_details_widget/basmallah.dart';
import '../widgets/ayah_details_widget/mode_switcher.dart';
import '../widgets/ayah_details_widget/paged/paged_list.dart';
import '../widgets/ayah_details_widget/surah_navigation_card.dart';
import '../widgets/ayah_details_widget/surah_info.dart';





class SurahDetailScreen extends ConsumerStatefulWidget {
  const SurahDetailScreen({super.key});

  @override
  ConsumerState<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends ConsumerState<SurahDetailScreen> {

  @override
  Widget build(BuildContext context) {

    final readingMode = ref.watch(readingModeProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.emerald50, Colors.white],
          ),
        ),

        child: Column(
          children: [
            AyahHeaderSection(),
            SizedBox(height: 20,),

            Expanded(
              child: CustomScrollView(
                cacheExtent: 1000,
                slivers: [
                  SliverToBoxAdapter(
                    child:  SurahInfo(),
                  ),

                  SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ModeSwitcher(
                        mode: readingMode,
                        onChanged: (newMode) {
                          ref.read(readingModeProvider.notifier).state = newMode;
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),

                  SliverToBoxAdapter(child: Basmallah()),

                  SliverToBoxAdapter(
                    child: SizedBox(height: 5),
                  ),

                  if (readingMode == ReadingMode.translation) ...[
                    AyahList(),
                  ] else ...[
                      Consumer(
                          builder: (context, ref, child) {
                            final surah = ref.watch(selectedSurahProvider);
                            if (surah == null) return const SliverToBoxAdapter(child: SizedBox());

                            final pagesAsync = ref.watch(pagedListProvider(surah!.number));

                            return pagesAsync.when(
                              data: (pages) => PagedList(pages: pages),
                                loading: () => const SliverFillRemaining(
                                  hasScrollBody: false,
                                  child: Center(child: CircularProgressIndicator()),
                                ),
                                error: (err, stack) => SliverToBoxAdapter(
                                    child: Center(child: Text('Error: $err')),
                                ),
                            );
                          }
                      ),
                  ],
                  SurahNavigationCard(),
                ]
              ),
            ),

          ],
        ),
      ),

    );
  }
}

