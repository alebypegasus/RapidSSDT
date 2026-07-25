import 'package:flutter/material.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';

class GlobalLocalizations {
  static AppLocalizations? _instance;
  
  static void init(BuildContext context) {
    _instance = AppLocalizations.of(context);
  }
  
  static AppLocalizations get instance {
    if (_instance == null) {
      return lookupAppLocalizations(const Locale('en'));
    }
    return _instance!;
  }
}

AppLocalizations get l10nGlobal => GlobalLocalizations.instance;
