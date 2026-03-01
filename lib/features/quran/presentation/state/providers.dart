import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/quran/data/datasource/surah_local_datasource.dart';
import 'package:quran_app/features/quran/data/repository/quran_metadata.dart';

final surahRepositoryProvider =
Provider<SurahMetadataRepository>((ref) {
  return SurahMetadataRepository(
    surahs: SurahLocalDatasource(),
  );
});

final surahListProvider =
FutureProvider((ref) async {
  final repo = ref.watch(surahRepositoryProvider);

  try {
    final data = await repo.getSurahMetadata();
    print("✅ Loaded ${data.length} surahs");
    return data;
  } catch (e, st) {
    print("❌ ERROR loading surahs: $e");
    print(st);
    rethrow; // IMPORTANT: let Riverpod show error state
  }
});