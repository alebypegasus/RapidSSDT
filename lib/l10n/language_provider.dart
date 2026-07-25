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
      // Use system locale language code only (avoid pt_BR which has Flutter rendering bugs)
      final sysLocale = ui.PlatformDispatcher.instance.locale;
      if (['pt', 'en', 'zh', 'ja'].contains(sysLocale.languageCode)) {
        _locale = Locale(sysLocale.languageCode); // Only language code, not country
      } else {
        _locale = const Locale('en'); // default to English
      }
    }
    currentLangCode = _locale.languageCode;
    notifyListeners();
  }

  Future<void> changeLanguage(Locale newLocale) async {
    _locale = newLocale;
    currentLangCode = newLocale.languageCode;
    final code = newLocale.countryCode != null && newLocale.countryCode!.isNotEmpty 
        ? '${newLocale.languageCode}_${newLocale.countryCode}'
        : newLocale.languageCode;
    await SpUtil.putString(_spKey, code);
    notifyListeners();
  }

  static Locale _parseLocale(String code) {
    if (code.contains('_')) {
      final parts = code.split('_');
      final langCode = parts[0];
      // Normalize pt_BR and pt_PT to just pt to avoid Flutter TextPainter rendering bug
      if (langCode == 'pt') return const Locale('pt');
      if (parts[1].isNotEmpty) {
        return Locale(langCode, parts[1]);
      }
      return Locale(langCode);
    }
    return Locale(code);
  }

  static String getLanguageName(Locale locale) {
    final code = locale.countryCode != null && locale.countryCode!.isNotEmpty
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
    switch (code) {
      case 'pt_BR':
        return 'Português (Brasil)';
      case 'pt_PT':
        return 'Português (Portugal)';
      case 'pt':
        return 'Português';
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
