import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/quran/data/datasource/quran_local_datasource.dart';
import 'app/app.dart';
import 'features/quran/data/repository/quran_repository.dart';



void main() async {

  runApp(
      ProviderScope(
          child: QuranApp(),
      ),
  );
}

class QuranLocalDataSource {
}
