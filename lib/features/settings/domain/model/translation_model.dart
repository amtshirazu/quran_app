class TranslationModel {
  final String dbFileName;
  final String name;
  final String language;
  final bool isDefault;

  const TranslationModel({
    required this.dbFileName,
    required this.name,
    required this.language,
    this.isDefault = false,
  });
}

/// List of all local bundled translations
const List<TranslationModel> kAllTranslations = [
  TranslationModel(
    dbFileName: 'sahih-international.db',
    name: 'Sahih International',
    language: 'English',
    isDefault: true,
  ),
  TranslationModel(
    dbFileName: 'haleem.db',
    name: 'Abdel Haleem',
    language: 'English',
  ),
  TranslationModel(
    dbFileName: 'pickthall.db',
    name: 'Pickthall',
    language: 'English',
  ),
  TranslationModel(
    dbFileName: 'yusufali.db',
    name: 'Yusuf Ali',
    language: 'English',
  ),
  TranslationModel(
    dbFileName: 'al-maududi.db',
    name: 'Tafheem-ul-Quran (Maududi)',
    language: 'English',
  ),
  TranslationModel(
    dbFileName: 'diyanet.db',
    name: 'Diyanet Meali',
    language: 'Türkçe',
  ),
  TranslationModel(
    dbFileName: 'hamidullah.db',
    name: 'Muhammad Hamidullah',
    language: 'Français',
  ),
];
