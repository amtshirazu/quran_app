class PagedAyah {
  final int surah;
  final int ayah;
  final double x;
  final double y;
  final String polygon;
  final int page;

  PagedAyah({
    required this.surah,
    required this.ayah,
    required this.x,
    required this.y,
    required this.polygon,
    required this.page,
  });

  factory PagedAyah.fromJson(Map<String, dynamic> json) {
    return PagedAyah(
      surah: json['surahNumber'],
      ayah: json['ayahNumber'],
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      polygon: json['polygon'],
      page: json['page_number'],
    );
  }
}