import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/pages/views/ssdt_platform.dart';

class PlatformPresetsView extends StatelessWidget {
  const PlatformPresetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MacosScaffold(
      toolBar: ToolBar(
        title: Text(l10n?.platformPreset ?? l10nGlobal.ssdtMsg599),
        titleWidth: 200.0,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: SsdtPlatformWidget(),
            );
          },
        ),
      ],
    );
  }
}
