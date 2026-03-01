import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/Surah_tile.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/quick_access.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/surah_list.dart';
import 'package:quran_app/features/quran/presentation/widgets/read_quran_screen_widgets/surah_verse_number_badge.dart';
import '../../../../core/constants/app_colors.dart';
import '../state/providers.dart';
import '../widgets/read_quran_screen_widgets/header_section.dart';
import '../widgets/read_quran_screen_widgets/surah_verses_badge.dart';

class ReadQuranScreen extends ConsumerWidget {
  const ReadQuranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
            ReadHeaderSection(),
            SizedBox(height: 20,),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  _quickAccess(),
                  SurahList(),
                ] ,
                ),
            ),
          ],
        ),
        ),
    );
  }
}

SliverList _quickAccess() {
  return SliverList(
      delegate: SliverChildListDelegate(
        [
          QuickAccess(),
        ]
      ),
  );
}



