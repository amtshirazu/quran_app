import '../../domain/models/translation.dart';
import '../datasource/quran_local_datasource.dart';




class TranslationRepository {
  final QuranLocalDatasource datasource;

  TranslationRepository(this.datasource);

  Future<List<Translation>> getSurahTranslations({
    required int surahNumber,
    required String translationFile,
  }) async {
    final data = await datasource
        .loadQuranJson("quran/translations/$translationFile.json");

    final filtered = data
        .where((element) => element["surah_number"] == surahNumber)
        .toList();

    return filtered.map((e) => Translation.fromJson(e)).toList();
  }
}