import 'package:quran_app/app/app.dart';
import 'package:quran_app/features/quran/data/datasource/quran_local_datasource.dart';
import 'package:quran_app/features/quran/data/datasource/surah_local_datasource.dart';
import 'package:quran_app/features/quran/data/repository/quran_metadata.dart';
import '../../domain/models/ayah.dart';

class QuranRepository {
  final QuranLocalDatasource datasource;
  final SurahMetadataRepository surahMetadataRepository;

  QuranRepository({
    required this.datasource,
    required this.surahMetadataRepository,
  });

  Future<List<Ayah>> getSurahAyahs({required int surahNumber, required String script}) async {
    final data = await datasource.loadQuranJson("quran/scripts/$script.json");
    final filtered = data
        .where((element) => element["surah_number"] == surahNumber)
        .toList();
    return filtered.map((e) => Ayah.fromJson(e)).toList();
  }

}
