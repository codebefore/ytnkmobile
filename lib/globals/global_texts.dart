import 'package:flutter/widgets.dart';
import 'package:ytnkio/globals/intl_texts/text_file_es.dart';
import 'package:ytnkio/globals/intl_texts/text_file_gb.dart';
import 'package:ytnkio/globals/intl_texts/text_file_tr.dart';
import 'package:ytnkio/globals/intl_texts/text_file.dart';

class GlobalTexts extends ChangeNotifier {
  static final Map<String, TextFile> _languages = {
    "en": TextFileGB(),
    "tr": TextFileTR(),
    "es": TextFileES(), 
  };

  static TextFile _current = TextFileGB();
  static TextFile get current => _current;

  static void changeLanguage(String language) {
    if (_languages.containsKey(language)) {
      _current = _languages[language]!;
      _instance.notifyListeners();
    }
  }

  static final GlobalTexts _instance = GlobalTexts();
  static GlobalTexts get instance => _instance;
}
