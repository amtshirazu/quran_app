import 'dart:convert';
import 'package:flutter/services.dart';

class TranslationLocalDatasource {

  Future<List<dynamic>> loadTranslationJson(String path) async {
    final String response = await rootBundle.loadString("assets/$path");
    return jsonDecode(response);
  }

}
