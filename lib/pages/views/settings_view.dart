import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Checkbox, CheckboxListTile;
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/pages/provider/patch_viewmodel_provider.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/pages/viewmodel/patch_viewmodel.dart';
import 'package:rapidssdt/pages/views/acpi_options.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:rapidssdt/utils/ssdttool/config.dart';
import 'package:rapidssdt/theme/theme_provider.dart';

class SettingsView extends StatelessWidget {
  final LanguageProvider? languageProvider;
  final ThemeProvider? themeProvider;
  
  const SettingsView({super.key, this.languageProvider, this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final patchViewModel = PatchViewModelProvider.of(context);
    final l10n = AppLocalizations.of(context);

    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(l10n?.preferences ?? l10nGlobal.ssdtMsg557),
        titleWidth: 200.0,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: MacosTheme.of(context).dividerColor ?? MacosColors.systemGrayColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appearance & Language',
                          style: MacosTheme.of(context).typography.headline,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text('Theme: '),
                            const SizedBox(width: 8),
                            MacosPopupButton<ThemeMode>(
                              value: themeProvider?.themeMode ?? ThemeMode.system,
                              onChanged: (ThemeMode? newValue) {
                                if (newValue != null) themeProvider?.setThemeMode(newValue);
                              },
                              items: const [
                                MacosPopupMenuItem(value: ThemeMode.system, child: Text('System')),
                                MacosPopupMenuItem(value: ThemeMode.light, child: Text('Light')),
                                MacosPopupMenuItem(value: ThemeMode.dark, child: Text('Dark')),
                              ],
                            ),
                            const SizedBox(width: 32),
                            const Text('Language: '),
                            const SizedBox(width: 8),
                            MacosPopupButton<String>(
                              value: languageProvider?.locale.languageCode ?? 'en',
                              onChanged: (String? newValue) {
                                if (newValue != null) languageProvider?.changeLanguage(Locale(newValue));
                              },
                              items: const [
                                MacosPopupMenuItem(value: 'en', child: Text('English')),
                                MacosPopupMenuItem(value: 'pt', child: Text('Português')),
                                MacosPopupMenuItem(value: 'zh', child: Text('中文')),
                                MacosPopupMenuItem(value: 'ja', child: Text('日本語')),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ValueListenableBuilder<AcpiConfig>(
                      valueListenable: patchViewModel.acpiConfig,
                      builder: (_, config, _) {
                        return AcpiOptions(
                          config: config,
                          onChanged: (newConfig) => patchViewModel.updateConfig(
                            newConfig,
                            onLog: (msg) => Log(msg),
                            onError: (msg) => Log.warning(msg),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
