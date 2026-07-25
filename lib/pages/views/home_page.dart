import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Checkbox, CheckboxListTile;
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/theme/theme_provider.dart';

import 'dashboard_view.dart';
import 'builder_view.dart';
import 'settings_view.dart';
import 'guide_about_view.dart';
import 'platform_presets_view.dart';

class HomePage extends StatefulWidget {
  final LanguageProvider? languageProvider;
  final ThemeProvider? themeProvider;
  const HomePage({super.key, this.languageProvider, this.themeProvider});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 220,
        maxWidth: 240,
        builder: (context, scrollController) {
          return SidebarItems(
            key: ValueKey(l10n?.localeName ?? 'en'),
            currentIndex: pageIndex,
            onChanged: (index) {
              setState(() => pageIndex = index);
            },
            items: [
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.home),
                label: const Text('Dashboard', locale: Locale('en')),
              ),
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.hammer),
                label: const Text('SSDT Builder', locale: Locale('en')),
              ),
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.desktopcomputer),
                label: Text(l10n?.platformPreset ?? l10nGlobal.ssdtMsg599, locale: const Locale('en')),
              ),
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.settings),
                label: Text(l10n?.preferences ?? l10nGlobal.ssdtMsg557, locale: const Locale('en')),
              ),
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.book),
                label: Text(l10n?.guide ?? l10nGlobal.ssdtMsg600, locale: const Locale('en')),
              ),
            ],
          );
        },
      ),
      child: ContentArea(
        builder: (context, scrollController) {
          return Material(
            type: MaterialType.transparency,
            child: DefaultTextStyle(
              style: MacosTheme.of(context).typography.body,
              child: IndexedStack(
                index: pageIndex,
                children: [
                  DashboardView(languageProvider: widget.languageProvider),
                  const BuilderView(),
                  const PlatformPresetsView(),
                  SettingsView(
                    languageProvider: widget.languageProvider,
                    themeProvider: widget.themeProvider,
                  ),
                  GuideAboutView(languageProvider: widget.languageProvider),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
