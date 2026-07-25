//  markdown_page.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/pages/views/markdown_viewer.dart';

class MarkdownPage extends StatelessWidget {
  final String mdPath;
  final String? title;
  final EdgeInsets padding;
  final bool showAppBar;

  const MarkdownPage({
    super.key,
    required this.mdPath,
    this.title,
    this.padding = const EdgeInsets.all(16),
    this.showAppBar = false,
  });

  Future<String> _loadLocalizedMarkdown(BuildContext context) async {
    final locale = Localizations.localeOf(context);
    final langCode = locale.languageCode;

    if (mdPath.contains('assets/guide/guide')) {
      final localizedPath = 'assets/guide/guide_$langCode.md';
      try {
        return await rootBundle.loadString(localizedPath);
      } catch (_) {
        // Fallback para arquivo padrão
      }
    }
    return await rootBundle.loadString(mdPath);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      color: Colors.transparent,
      child: FutureBuilder<String>(
        future: _loadLocalizedMarkdown(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Failed to load document: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return MarkdownViewer(data: snapshot.data!);
          }
        },
      ),
    );
  }
}
