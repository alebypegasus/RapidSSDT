import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/widgets/platform/platform_utils.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const AppScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isMacOS) {
      return MacosScaffold(
        toolBar: ToolBar(
          title: Text(title),
          titleWidth: 200.0,
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return child;
            },
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      body: child,
    );
  }
}
