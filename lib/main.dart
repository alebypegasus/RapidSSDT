//  main.dart 
//  Created by JeoJay127 
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/pages/provider/patch_viewmodel_provider.dart';
import 'package:rapidssdt/pages/viewmodel/patch_viewmodel.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:sp_util/sp_util.dart';
import 'package:rapidssdt/theme/theme_provider.dart';
import 'package:rapidssdt/pages/views/home_page.dart';
import 'package:rapidssdt/utils/app_info.dart';
import 'package:rapidssdt/utils/constant.dart';
import 'package:rapidssdt/utils/theme_util.dart';
import 'package:window_manager/window_manager.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:macos_window_utils/macos_window_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Sputil初始化
  await SpUtil.getInstance();
  LanguageProvider.init();
  await MacosWindowUtilsConfig().apply();

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
      titleBarStyle: TitleBarStyle.hidden,
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
  final ThemeProvider themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColorDark;
    return ListenableBuilder(
      listenable: Listenable.merge([languageProvider, themeProvider]),
      builder: (context, child) {
        return PatchViewModelProvider(
          patchViewModel: patchViewModel,
          child: MacosApp(
            title: Constant.appName,
            debugShowCheckedModeBanner: false,
            theme: MacosThemeData.light().copyWith(
              primaryColor: primaryColor,
            ),
            darkTheme: MacosThemeData.dark().copyWith(
              primaryColor: primaryColor,
            ),
            themeMode: themeProvider.themeMode,
            locale: languageProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              // Force exact locale from provider — prevents Flutter from auto-resolving
              // pt → pt_BR (which triggers a Flutter TextPainter rendering bug on macOS)
              return languageProvider.locale;
            },
            home: Builder(
              builder: (ctx) {
                GlobalLocalizations.init(ctx);
                return HomePage(
                  languageProvider: languageProvider,
                  themeProvider: themeProvider,
                );
              }
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    patchViewModel.dispose();
    languageProvider.dispose();
    themeProvider.dispose();
    Log.shutdownAll();
    super.dispose();
  }
}

