

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/audio/presentation/widgets/reciters_selection_widgets/quran_info.dart';

import '../../../quran/presentation/widgets/bottom_navbar.dart';
import '../state/audio_providers.dart';
import '../widgets/reciters_selection_widgets/header_section.dart';
import '../widgets/reciter_audio_widgets/player_card.dart';
import '../widgets/reciter_audio_widgets/playlist.dart';
import '../widgets/reciter_audio_widgets/reciter_header.dart';
import '../widgets/reciters_selection_widgets/reciters_card_list.dart';
import '../widgets/reciters_selection_widgets/search.dart';


class ReciterAudioScreen extends ConsumerStatefulWidget {
  const ReciterAudioScreen({super.key});

  @override
  ConsumerState<ReciterAudioScreen> createState() =>ReciterAudioScreenState();
}

class ReciterAudioScreenState extends ConsumerState<ReciterAudioScreen> {

  @override
  Widget build(BuildContext context) {

    final selectedReciter = ref.watch(selectedReciterProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            ReciterHeader(
              reciter: selectedReciter!,
            ),

            Expanded(
              child: CustomScrollView(
                cacheExtent: 1000,
                slivers: [

                  SliverToBoxAdapter(
                    child: PlayerCard(),
                  ),



                  SliverToBoxAdapter(
                    child: const SizedBox(height: 20),
                  ),

                  SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Playlist",
                            style: TextStyle(fontWeight: FontWeight
                                .bold),
                          ),
                        ),
                      ),
                    ),

                  Playlist(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}