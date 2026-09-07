import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/database/database_helper.dart';
import 'package:quran_app/features/audio/data/reciters_list.dart';
import 'package:quran_app/features/audio/domain/models/Reciters.dart';
import 'package:quran_app/features/audio/presentation/state/repeat_states.dart';
import '../../../quran/domain/models/surah.dart';
import '../../../quran/presentation/state/quran_providers.dart';
import 'audio_service.dart';

final audioServiceProvider = Provider<QuranAudioService>((ref) {
  final service = QuranAudioService();

  ref.onDispose(() {
    service.dispose();
  });
  return service;
});

final audioStreamProvider = StreamProvider<PlayerState>((ref) {
  final streamService = ref.watch(audioServiceProvider);
  return streamService.player.playerStateStream;
});

final recitersListProvider = Provider<List<Reciter>>((ref) {
  return reciters;
});

final filteredRecitersProvider = Provider<List<Reciter>>((ref) {
  final reciters = ref.watch(recitersListProvider);
  final searchQuery = ref.watch(recitersSearchQueryProvider).toLowerCase();

  if (searchQuery.isEmpty) return reciters;

  final filteredReciters = reciters.where((reciter) {
    return reciter.name.toLowerCase().contains(searchQuery) ||
        reciter.country.toLowerCase().contains(searchQuery) ||
        reciter.arabicName.contains(searchQuery) ||
        reciter.style.toLowerCase().contains(searchQuery);
  }).toList();

  return filteredReciters;
});

final recitersSearchQueryProvider = StateProvider<String>((ref) => '');

final selectedReciterProvider = StateProvider<Reciter?>((ref) => null);

final selectedSurahIndexProvider = StateProvider<int?>((ref) => 0);

final selectedAudioSurahProvider = Provider<Surah?>((ref) {
  final index = ref.watch(selectedSurahIndexProvider);
  final surahsAsync = ref.watch(surahListProvider);

  if (surahsAsync is AsyncData<List<Surah>> && index != null && index >= 0) {
    final surahs = surahsAsync.value;
    if (index < surahs.length) {
      return surahs[index];
    }
  }

  return null;
});

final repeatModeProvider = StateProvider<RepeatStates>(
  (ref) => RepeatStates.off,
);

final volumeProvider = StateProvider<double>((ref) => 0.7);

class DefaultReciterNotifier extends StateNotifier<Reciter?> {
  DefaultReciterNotifier() : super(_initialReciter) {
    _loadSaved();
  }

  static final _initialReciter = reciters.firstWhere(
    (r) => r.id == "abu_bakr_shaatree",
    orElse: () => reciters.first,
  );

  Future<void> _loadSaved() async {
    try {
      final savedId =
          await DatabaseHelper.instance.getSetting('default_reciter_id');
      if (savedId != null && savedId.isNotEmpty) {
        final found = reciters.firstWhere(
          (r) => r.id == savedId,
          orElse: () => _initialReciter,
        );
        state = found;
      }
    } catch (_) {}
  }

  Future<void> setReciter(Reciter reciter) async {
    state = reciter;
    await DatabaseHelper.instance.setSetting('default_reciter_id', reciter.id);
  }
}

final defaultReciterProvider =
    StateNotifierProvider<DefaultReciterNotifier, Reciter?>((ref) {
  return DefaultReciterNotifier();
});
