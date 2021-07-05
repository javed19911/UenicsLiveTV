import 'package:flutter/material.dart';

import 'lanuages/LanguageHi.dart';
import 'lanuages/LanguageMr.dart';
import 'lanuages/language.dart';
import 'lanuages/language_kn.dart';
import 'lanuages/lanuage_en.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<Language> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi', 'mr', 'kn'].contains(locale.languageCode);
  }

  @override
  Future<Language> load(Locale locale) {
    return _load(locale);
  }

  static Future<Language> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'hi':
        return LanguageHi();
      case 'en':
        return LanguageEn();
      case 'mr':
        return LanguageMr();
      case 'kn':
        return LanguageKn();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Language> old) {
    return false;
  }
}
