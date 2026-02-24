import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/quran/data/datasource/quran_local_datasource.dart';
import 'app/app.dart';
import 'features/quran/data/repository/quran_repository.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final repo = QuranRepository(QuranLocalDataSource() as QuranLocalDatasource);

  final ayahs = await repo.getSurahAyahs(
    surahNumber: 1,
    script: 'uthmani_converted',
  );

  print("Total ayahs: ${ayahs.length}");
  print("First ayah: ${ayahs.first.text}");
  print("Last ayah: ${ayahs.last.text}");

  runApp(
      ProviderScope(
          child: QuranApp(),
      ),
  );
}

class QuranLocalDataSource {
}
