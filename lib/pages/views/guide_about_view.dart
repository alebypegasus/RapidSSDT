import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show TabBarView, TabController;
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/pages/views/about_page.dart';
import 'package:rapidssdt/pages/views/markdown_page.dart';

class GuideAboutView extends StatefulWidget {
  final LanguageProvider? languageProvider;
  
  const GuideAboutView({super.key, this.languageProvider});

  @override
  State<GuideAboutView> createState() => _GuideAboutViewState();
}

class _GuideAboutViewState extends State<GuideAboutView> {
  late final MacosTabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = MacosTabController(
      initialIndex: 0,
      length: 2,
    );
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(l10n?.guide ?? l10nGlobal.ssdtMsg600),
        titleWidth: 200.0,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  MacosSegmentedControl(
                    controller: _tabController,
                    tabs: [
                      MacosTab(label: l10n?.guide ?? l10nGlobal.ssdtMsg600),
                      MacosTab(label: l10n?.about ?? l10nGlobal.ssdtMsg601),
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
      ],
    );
  }
}
