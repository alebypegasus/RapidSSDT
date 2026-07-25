import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import 'dart:ui' as ui;

class LanguageProvider extends ChangeNotifier {
  static const String _spKey = 'app_language_code';
  static String currentLangCode = 'zh'; // Global variable for backend


  Locale _locale = const Locale('zh', 'CN');

  Locale get locale => _locale;

  static void init() {
    final savedCode = SpUtil.getString(_spKey);
    if (savedCode != null && savedCode.isNotEmpty) {
      if (savedCode.contains('_')) {
        currentLangCode = savedCode.split('_')[0];
      } else {
        currentLangCode = savedCode;
      }
    } else {
      final sysLocale = ui.PlatformDispatcher.instance.locale;
      if (['pt', 'en', 'zh', 'ja'].contains(sysLocale.languageCode)) {
        currentLangCode = sysLocale.languageCode;
      } else {
        currentLangCode = 'en';
      }
    }
  }

  LanguageProvider() {
    _loadSavedLocale();
  }

  void _loadSavedLocale() {
    final savedCode = SpUtil.getString(_spKey);
    if (savedCode != null && savedCode.isNotEmpty) {
      _locale = _parseLocale(savedCode);
    } else {
      // Use system locale
      final sysLocale = ui.PlatformDispatcher.instance.locale;
      if (['pt', 'en', 'zh', 'ja'].contains(sysLocale.languageCode)) {
        _locale = sysLocale;
      } else {
        _locale = const Locale('en', 'US'); // default to English instead of Chinese
      }
    }
    currentLangCode = _locale.languageCode;
    notifyListeners();
  }

  Future<void> changeLanguage(Locale newLocale) async {
    _locale = newLocale;
    currentLangCode = newLocale.languageCode;
    final code = '${newLocale.languageCode}_${newLocale.countryCode ?? ''}';
    await SpUtil.putString(_spKey, code);
    notifyListeners();
  }

  static Locale _parseLocale(String code) {
    if (code.contains('_')) {
      final parts = code.split('_');
      return Locale(parts[0], parts[1]);
    }
    return Locale(code);
  }

  static String getLanguageName(Locale locale) {
    final code = '${locale.languageCode}_${locale.countryCode ?? ''}';
    switch (code) {
      case 'pt_BR':
        return 'Português (Brasil)';
      case 'pt_PT':
        return 'Português (Portugal)';
      case 'en_US':
      case 'en':
        return 'English';
      case 'ja_JP':
      case 'ja':
        return '日本語';
      case 'zh_CN':
      case 'zh':
      default:
        return '简体中文';
    }
  }
}
