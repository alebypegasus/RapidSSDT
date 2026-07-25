//  main.dart 
//  Created by JeoJay127 
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/pages/provider/patch_viewmodel_provider.dart';
import 'package:rapidssdt/pages/viewmodel/patch_viewmodel.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:sp_util/sp_util.dart';
import 'package:rapidssdt/pages/views/acpi_page.dart';
import 'package:rapidssdt/utils/app_info.dart';
import 'package:rapidssdt/utils/constant.dart';
import 'package:rapidssdt/utils/theme_util.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Sputil初始化
  await SpUtil.getInstance();
  LanguageProvider.init();
  await windowManager.ensureInitialized();

  ///获取AppVersion
  final appVersion = await AppInfo.version;
  // 设置窗口样式和背景颜色
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      title: '${Constant.appName}-v$appVersion(${Constant.copyright})',
      minimumSize: const Size(800, 600),
      center: false,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setPreventClose(false);
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PatchViewModel patchViewModel = PatchViewModel();
  final LanguageProvider languageProvider = LanguageProvider();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColorDark;
    return ListenableBuilder(
      listenable: languageProvider,
      builder: (context, child) {
        return PatchViewModelProvider(
          patchViewModel: patchViewModel,
          child: MaterialApp(
            title: Constant.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeUtil.appTheme(primary: primaryColor),
            darkTheme: ThemeUtil.appTheme(isDarkMode: true, primary: primaryColor),
            themeMode: ThemeMode.system,
            locale: languageProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: AcpiPage(languageProvider: languageProvider),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    patchViewModel.dispose();
    languageProvider.dispose();
    Log.shutdownAll();
    super.dispose();
  }
}

