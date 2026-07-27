import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show TabBarView, TabController;
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/pages/views/about_page.dart';
import 'package:rapidssdt/pages/views/markdown_page.dart';
import 'package:rapidssdt/widgets/platform/app_scaffold.dart';
import 'package:rapidssdt/widgets/platform/app_segmented_control.dart';

class GuideAboutView extends StatefulWidget {
  final LanguageProvider? languageProvider;
  
  const GuideAboutView({super.key, this.languageProvider});

  @override
  State<GuideAboutView> createState() => _GuideAboutViewState();
}

class _GuideAboutViewState extends State<GuideAboutView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      title: l10n?.guide ?? l10nGlobal.ssdtMsg600,
      child: Builder(
        builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppSegmentedControl(
                    currentIndex: _currentIndex,
                    onValueChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    labels: [
                      l10n?.guide ?? l10nGlobal.ssdtMsg600,
                      l10n?.about ?? l10nGlobal.ssdtMsg601,
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: IndexedStack(
                      index: _currentIndex,
                      children: [
                        const MarkdownPage(mdPath: 'assets/guide/guide.md'),
                        AboutPage(languageProvider: widget.languageProvider),
                      ],
                    ),
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}
