


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/audio/data/reciters_list.dart';
import 'package:quran_app/features/audio/domain/models/Reciters.dart';
import 'audio_service.dart';




final audioServiceProvider =
Provider<AudioService>((ref) {
  final service = AudioService();

  ref.onDispose(() {
    service.dispose();
  });
  return service;
});

final audioStreamProvider =
StreamProvider<PlayerState>((ref) {
  final streamService = ref.watch(audioServiceProvider);
  return streamService.player.playerStateStream;
});

final recitersListProvider =
    Provider<List<Reciter>>((ref) {
      return reciters;
    });

final filteredRecitersProvider =
    Provider<List<Reciter>>((ref) {
      final reciters = ref.watch(recitersListProvider);
      final searchQuery = ref.watch(recitersSearchQueryProvider).toLowerCase();

      if(searchQuery.isEmpty) return reciters;

      final filteredReciters = reciters.where((reciter) {
        return reciter.name.toLowerCase().contains(searchQuery) ||
            reciter.country.toLowerCase().contains(searchQuery) ||
            reciter.arabicName.contains(searchQuery) ||
            reciter.style.toLowerCase().contains(searchQuery);
      }).toList();

      return filteredReciters;
    });

final recitersSearchQueryProvider =
StateProvider<String>((ref) => '');


final selectedReciterProvider =
    StateProvider<Reciter?>((ref) => null);
