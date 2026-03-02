import 'dart:convert';
import 'package:flutter/services.dart';

class QuranLocalDatasource {

  Future<List<dynamic>> loadQuranJson(String path) async {
    final String response = await rootBundle.loadString(path);
    return jsonDecode(response);
  }

}
