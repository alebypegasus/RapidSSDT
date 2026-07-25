//  about_page.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/pages/views/update_check.dart';
import 'package:rapidssdt/widgets/inkwell_widget.dart';
import 'package:rapidssdt/widgets/link_button.dart';
import 'package:rapidssdt/utils/app_info.dart';
import 'package:rapidssdt/utils/constant.dart';

class AboutPage extends StatefulWidget {
  final LanguageProvider? languageProvider;
  const AboutPage({super.key, this.languageProvider});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    version = await AppInfo.version;
    buildNumber = await AppInfo.buildNumber;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final langProvider = widget.languageProvider;

    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            spacing: 12,
            children: [
              Image.asset('assets/images/icon.png', width: 100, height: 100),
              Text(
                Constant.appName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: MacosTheme.of(context).typography.body.color,
                ),
              ),

              Text(
                'v$version (Build $buildNumber)',
                style: TextStyle(fontSize: 11, color: MacosTheme.of(context).typography.caption1.color),
              ),

              Text(Constant.copyright, style: TextStyle(fontSize: 11, color: MacosTheme.of(context).typography.caption1.color)),

              if (langProvider != null) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${l10n?.language ?? "Language"}: ',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: MacosTheme.of(context).typography.body.color),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildLangButton(context, langProvider, const Locale('en'), 'English'),
                        _buildLangButton(context, langProvider, const Locale('pt'), 'Português'),
                        _buildLangButton(context, langProvider, const Locale('zh'), '中文'),
                        _buildLangButton(context, langProvider, const Locale('ja'), '日本語'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],

              InkWellWidget.common(
                width: 120,
                backgroundColor: Colors.indigo,
                onTap: () {
                  UpdateDialog.checkLatestRelease(context, silent: false);
                },
                child: Text(
                  l10n?.checkUpdate ?? '检测更新',
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
              CustomLinkButton(
                url: 'https://github.com/JeoJay127/RapidSSDT',
                buttonText: 'GitHub Repository',
                icon: Icons.link_sharp,
              ),
              Divider(color: MacosTheme.of(context).dividerColor),
              CustomLinkButton(
                url: 'https://github.com/JeoJay127/RapidEFI-Tool/releases',
                buttonText:
                    'RapidEFI Tool - Hackintosh OpenCore Automated Configuration Tool',
                imagePath: 'assets/images/Icon-App-60x60.png',
                iconSize: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangButton(BuildContext context, LanguageProvider langProvider, Locale locale, String label) {
    final isSelected = langProvider.locale.languageCode == locale.languageCode;
    return InkWellWidget(
      width: 100,
      height: 32,
      radius: 16,
      backgroundColor: isSelected ? Colors.indigo : Colors.grey.withOpacity(0.2),
      onTap: () => langProvider.changeLanguage(locale),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : (MacosTheme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black87),
          ),
        ),
      ),
    );
  }
}

