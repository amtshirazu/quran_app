import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TranslationDatabaseService {
  static final Map<String, Database> _dbCache = {};

  final String? dbFileName;

  TranslationDatabaseService({this.dbFileName});

  Future<Database> get database async {
    return _getDatabase(dbFileName ?? 'sahih-international.db');
  }

  Future<Database> _getDatabase(String fileName) async {
    if (_dbCache.containsKey(fileName)) {
      return _dbCache[fileName]!;
    }

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    final exists = await databaseExists(path);

    if (!exists) {
      try {
        final assetPath = 'assets/database/translations/$fileName';

        await Directory(dirname(path)).create(recursive: true);

        // Copy from assets
        ByteData data = await rootBundle.load(assetPath);
        List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes,
          data.lengthInBytes,
        );

        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        throw Exception("Error copying database $fileName from assets: $e");
      }
    }

    final db = await openDatabase(path, readOnly: true);
    _dbCache[fileName] = db;
    return db;
  }

  Future<String> getTranslationFromDb({
    required String fileName,
    required int surah,
    required int verse,
  }) async {
    try {
      final db = await _getDatabase(fileName);

      final List<Map<String, dynamic>> maps = await db.query(
        'translation',
        columns: ['text'],
        where: 'sura = ? AND ayah = ?',
        whereArgs: [surah, verse],
      );

      if (maps.isNotEmpty) {
        return maps.first['text'] as String;
      }
      return "Translation not found";
    } catch (_) {
      return "Translation unavailable";
    }
  }

  Future<String> getTranslation(int surah, int verse) async {
    return getTranslationFromDb(
      fileName: dbFileName ?? 'sahih-international.db',
      surah: surah,
      verse: verse,
    );
  }
}
