import 'dart:io';
import 'package:flutter/foundation.dart';

class PlatformUtils {
  static bool get isMacOS {
    if (kIsWeb) return false;
    return Platform.isMacOS;
  }

  static bool get isWindows {
    if (kIsWeb) return false;
    return Platform.isWindows;
  }

  static bool get isLinux {
    if (kIsWeb) return false;
    return Platform.isLinux;
  }
}
