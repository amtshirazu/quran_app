import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('lib/assets/quran/scripts/uthmani.json');
  final content = await file.readAsString();
  final data = json.decode(content);

  final verses = data['verses'];

  final cleaned = verses.map((v) {
    final verseKey = v['verse_key'].split(':');
    return {
      "surah_number": int.parse(verseKey[0]),
      "ayah_number": int.parse(verseKey[1]),
      "text": v['text_uthmani'] ?? v['text_indopak'] ?? v['text'] ?? v['text_uthmani_tajweed']
    };
  }).toList();

  final output = File('uthmani_converted.json');
  await output.writeAsString(json.encode(cleaned));

  print("Conversion complete.");
}