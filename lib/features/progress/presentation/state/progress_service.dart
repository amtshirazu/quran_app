import 'package:quran_app/core/database/database_helper.dart';
import '../../../quran/presentation/widgets/ayah_details_widget/paged/paged_surah_map.dart';
import 'package:quran/quran.dart' as quran;

class ProgressService {
  final dbHelper = DatabaseHelper.instance;
  static const int _minQuranPage = 1;
  static const int _maxQuranPage = 604;

  // ========================= TRACKING =========================

  Future<void> trackAyah(int surahId, int ayah) async {
    final db = await dbHelper.database;

    final now = DateTime.now().toIso8601String();

    await db.insert('reading_sessions', {
      'mode': 'ayah',
      'surah_id': surahId,
      'ayah': ayah,
      'page': null,
      'timestamp': now,
    });

    await _updateLastRead(surahId: surahId, ayah: ayah, mode: 'ayah');
  }

  Future<void> trackPage(int page) async {
    if (page < _minQuranPage || page > _maxQuranPage) return;

    final db = await dbHelper.database;

    final now = DateTime.now().toIso8601String();

    final activeSurahId = await resolveActiveSurah(
      mode: 'page',
      page: page,
    );

    await db.insert('reading_sessions', {
      'mode': 'page',
      'surah_id': activeSurahId,
      'ayah': null,
      'page': page,
      'timestamp': now,
    });

    await _updateLastRead(surahId: activeSurahId, page: page, mode: 'page');
  }

  // ========================= STREAK =========================

  Future<void> updateStreak() async {
    final db = await dbHelper.database;

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final result = await db.query('streak', limit: 1);

    if (result.isEmpty) {
      await db.insert('streak', {
        'id': 1,
        'last_read_date': todayDate.toIso8601String(),
        'current_streak': 1,
      });
      return;
    }

    final data = result.first;

    final lastReadDateStr = data['last_read_date'] as String?;
    int currentStreak = (data['current_streak'] as int?) ?? 0;

    if (lastReadDateStr == null) return;

    final lastReadDate = DateTime.parse(lastReadDateStr).toLocal();
    final lastDate = DateTime(
      lastReadDate.year,
      lastReadDate.month,
      lastReadDate.day,
    );

    final difference = todayDate.difference(lastDate).inDays;

    if (difference == 1) {
      currentStreak += 1;
    } else if (difference > 1) {
      currentStreak = 1;
    } else {
      return; // same day
    }

    await db.update(
      'streak',
      {
        'last_read_date': todayDate.toIso8601String(),
        'current_streak': currentStreak,
      },
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<int?> getCurrentStreak() async {
    final db = await dbHelper.database;

    final result = await db.query('streak', limit: 1);

    if (result.isEmpty) return 0;

    return (result.first['current_streak'] as int?) ?? 0;
  }

  // ========================= LAST READ =========================

  Future<void> _updateLastRead({
    int? surahId,
    int? ayah,
    int? page,
    required String mode,
  }) async {
    final db = await dbHelper.database;

    // Resolve active surah for page/ayah mode
    final activeSurah = await resolveActiveSurah(
      mode: mode,
      surahId: surahId,
      page: page,
    );

    final resolvedSurahId = activeSurah ?? surahId;

    if (resolvedSurahId != null) {
      // Check if last_read contains entries for a DIFFERENT surah
      final existingRows = await db.query(
        'last_read',
        columns: ['surah_id'],
        where: 'surah_id IS NOT NULL',
        limit: 1,
      );

      if (existingRows.isNotEmpty) {
        final existingSurahId = existingRows.first['surah_id'] as int?;
        if (existingSurahId != null && existingSurahId != resolvedSurahId) {
          // Surah changed! Clear last_read for the new Surah session
          await db.delete('last_read');
        }
      }
    }

    final now = DateTime.now().toIso8601String();

    await db.insert('last_read', {
      'surah_id': resolvedSurahId,
      'ayah': ayah,
      'page': page,
      'mode': mode,
      'updated_at': now,
    });
  }

  /// Clears last_read table when opening or switching to a new Surah
  Future<void> clearLastRead() async {
    final db = await dbHelper.database;
    await db.delete('last_read');
  }

  Future<Map<String, dynamic>?> getLastRead() async {
    final db = await dbHelper.database;

    final result = await db.query(
      'last_read',
      orderBy: 'updated_at DESC, id DESC',
      limit: 1,
    );

    if (result.isEmpty) return null;

    return result.first;
  }

  Future<double?> getSurahProgress({
    required int surahId,
    required int totalAyahs,
  }) async {
    final result = await _calculateSingleSurahProgress(surahId, totalAyahs);
    return result;
  }

  Future<double?> _calculateSingleSurahProgress(
    int surahId,
    int totalAyahs,
  ) async {
    final db = await dbHelper.database;
    final rows = await db.query(
      'last_read',
      where: 'surah_id = ?',
      whereArgs: [surahId],
    );
    if (rows.isEmpty) return 0.0;

    final Set<int> uniqueAyahs = {};

    for (final row in rows) {
      final mode = row['mode'];

      if (mode == 'ayah') {
        final ayah = row['ayah'] as int?;
        if (ayah != null) uniqueAyahs.add(ayah);
      } else if (mode == 'page') {
        final page = row['page'] as int?;
        if (page != null && page >= 1 && page <= 604) {
          final pageData = quran.getPageData(page).cast<Map<String, dynamic>>();
          for (final verse in pageData) {
            if (verse['surah'] == surahId) {
              uniqueAyahs.add(verse['ayah']);
            }
          }
        }
      }
    }

    return totalAyahs == 0
        ? 0.0
        : (uniqueAyahs.length / totalAyahs).clamp(0.0, 1.0);
  }

  Future<int?> resolveActiveSurah({
    required String mode,
    int? surahId,
    int? page,
  }) async {
    if (mode == 'ayah') return surahId;

    if (mode != 'page' || page == null) return null;

    final pageData = quran.getPageData(page).cast<Map<String, dynamic>>();

    if (pageData.isEmpty) return null;

    final surahsOnPage = pageData
        .map((e) => (e['surah'] ?? e['surah_number']) as int)
        .toSet()
        .toList();

    if (surahsOnPage.length == 1) {
      return surahsOnPage.first;
    }

    final firstVerse = pageData.first;
    final firstVerseSurah =
        (firstVerse['surah'] ?? firstVerse['surah_number']) as int?;
    final firstVerseNumber =
        (firstVerse['ayah'] ?? firstVerse['start']) as int?;

    if (firstVerseNumber == 1) {
      return firstVerseSurah;
    }

    try {
      final firstNewSurahOnPage = pageData.firstWhere(
        (verse) => (verse['ayah'] ?? verse['start']) == 1,
      );
      return (firstNewSurahOnPage['surah'] ??
          firstNewSurahOnPage['surah_number']) as int?;
    } catch (_) {
      return firstVerseSurah;
    }
  }

  // ========================= STATS =========================

  Future<int?> getSurahsCompleted(List<dynamic> surahs) async {
    int completedSurahs = 0;

    for (final surah in surahs) {
      final progress = await _calculateSurahsProgress(
        surahId: surah.number,
        totalAyahs: surah.totalAyahs,
      );

      if (progress! >= 1.0) {
        completedSurahs++;
      }
    }

    return completedSurahs;
  }

  Future<double?> _calculateSurahsProgress({
    required int surahId,
    required int totalAyahs,
  }) async {
    final db = await dbHelper.database;
    final Set<int> uniqueAyahs = {};

    final ayahResult = await db.rawQuery(
      "SELECT DISTINCT ayah FROM reading_sessions WHERE mode = 'ayah' AND surah_id = ?",
      [surahId],
    );

    for (final row in ayahResult) {
      final ayah = row['ayah'] as int?;
      if (ayah != null) uniqueAyahs.add(ayah);
    }

    final range = surahPageRanges[surahId];
    if (range != null) {
      final pageResult = await db.rawQuery(
        "SELECT DISTINCT page FROM reading_sessions WHERE mode = 'page' AND page BETWEEN ? AND ?",
        [range.start, range.end],
      );

      for (final row in pageResult) {
        final page = row['page'] as int?;
        if (page != null && page >= 1 && page <= 604) {
          final pageData = quran.getPageData(page).cast<Map<String, dynamic>>();
          for (final verse in pageData) {
            if (verse['surah'] == surahId) {
              uniqueAyahs.add(verse['ayah']);
            }
          }
        }
      }
    }

    return totalAyahs == 0
        ? 0
        : (uniqueAyahs.length / totalAyahs).clamp(0.0, 1.0);
  }

  Future<double> getQuranProgress() async {
    final totalReadAyahs = await getTotalVersesRead();

    const totalAyahs = 6236;

    return (totalReadAyahs / totalAyahs).clamp(0.0, 1.0);
  }

  Future<int> getTotalVersesRead() async {
    final db = await dbHelper.database;
    final Set<String> uniqueAyahs = {};

    final ayahResult = await db.rawQuery(
      "SELECT DISTINCT surah_id, ayah FROM reading_sessions WHERE mode = 'ayah'",
    );

    for (final row in ayahResult) {
      final surah = row['surah_id'];
      final ayah = row['ayah'];
      if (surah != null && ayah != null) {
        uniqueAyahs.add('$surah-$ayah');
      }
    }

    final pageResult = await db.rawQuery(
      "SELECT DISTINCT page FROM reading_sessions WHERE mode = 'page'",
    );

    for (final row in pageResult) {
      final page = row['page'] as int?;
      if (page != null && page >= 1 && page <= 604) {
        final pageData = quran.getPageData(page).cast<Map<String, dynamic>>();
        for (final verse in pageData) {
          uniqueAyahs.add('${verse['surah']}-${verse['ayah']}');
        }
      }
    }

    return uniqueAyahs.length;
  }

  Future<DateTime?> getFirstReadingDate() async {
    final db = await dbHelper.database;

    final result = await db.rawQuery('''
    SELECT timestamp
    FROM reading_sessions
    ORDER BY timestamp ASC
    LIMIT 1
  ''');

    if (result.isEmpty) return null;

    final raw = result.first['timestamp'] as String?;
    if (raw == null) return null;

    return DateTime.tryParse(raw);
  }

  Future<void> clearAllReadingHistory() async {
    final db = await dbHelper.database;

    await db.delete('reading_sessions');
    await db.delete('last_read');
  }
}
