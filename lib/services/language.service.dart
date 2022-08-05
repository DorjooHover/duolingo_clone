import 'dart:convert';

import 'package:frontend/models/language.model.dart';
import 'package:http/http.dart' as http;

final url = Uri.parse('http://192.168.1.12:3000/languages/views');
Future<List<LanguageModel>> fetchLanguages() async {
  final response = await http.get(url);

  List<LanguageModel> _languages = [];

  if (response.statusCode == 200) {
    var languages = jsonDecode(response.body);
    for (var jsondata in languages) {
      _languages.add(LanguageModel.fromJson(jsondata));
    }

    return _languages;
  } else {
    throw Exception('Failed to load languages');
  }
}
