import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Checkbox, CheckboxListTile;
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/pages/model/patch_state.dart';
import 'package:rapidssdt/pages/viewmodel/patch_viewmodel.dart';
import 'package:rapidssdt/pages/provider/patch_viewmodel_provider.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:rapidssdt/utils/log/logwidet.dart';
import 'package:rapidssdt/widgets/choose_file.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/widgets/platform/app_scaffold.dart';
import 'package:rapidssdt/widgets/platform/app_button.dart';
import 'package:rapidssdt/widgets/platform/app_dialog.dart';

class DashboardView extends StatelessWidget {
  final LanguageProvider? languageProvider;
  
  const DashboardView({super.key, this.languageProvider});

  @override
  Widget build(BuildContext context) {
    final patchViewModel = PatchViewModelProvider.of(context);
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      title: 'Dashboard',
      child: Builder(
        builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildFileSection(context, patchViewModel, l10n),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _buildLogPanel(context, patchViewModel, l10n),
                  ),
                ],
              ),
            );
        },
      ),
    );
  }

  Widget _buildFileSection(BuildContext context, PatchViewModel patchViewModel, AppLocalizations? l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            spacing: 10,
            children: [
              AppButton(
                controlSize: ControlSize.large,
                onPressed: () async {
                  await patchViewModel.dumpTablesAndLoadPatches(
                    onError: (msg) => Log.error(msg),
                    onRequestSudoPassword: () async {
                      return await AppDialog.show<String>(
                        context: context,
                        icon: const Icon(CupertinoIcons.lock),
                        title: const Text('Admin Privileges Required'),
                        content: const Text('Please enter your system password to continue.'),
                        primaryButton: AppButton(
                          controlSize: ControlSize.large,
                          onPressed: () => Navigator.pop(context, password),
                          child: const Text('OK'),
                        ),
                        secondaryButton: AppButton(
                          controlSize: ControlSize.large,
                          secondary: true,
                          onPressed: () => Navigator.pop(context, null),
                          child: const Text('Cancel'),
                        ),
                      );
                    },
                  );
                },
                child: Text(l10n?.dumpAcpi ?? l10nGlobal.ssdtMsg591),
              ),
              Expanded(
                child: ValueListenableBuilder<PatchState>(
                  valueListenable: patchViewModel.state,
                  builder: (context, state, _) {
                    return ChooseFileWidget(
                      onChanged: (newDir) => patchViewModel.acpiConfig.value.copyWith(
                        outputDirectory: newDir,
                      ),
                      initialPath: state.outputDir,
                      hintText: state.outputDir,
                      buttons: [
                        ChooseFileButton(text: l10n?.selectOutputPath ?? l10nGlobal.ssdtMsg592, mode: OpenMode.directory),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          ValueListenableBuilder<PatchState>(
            valueListenable: patchViewModel.state,
            builder: (context, state, _) {
              return ChooseFileWidget(
                onChanged: (selectedPath) => patchViewModel.loadTables(
                  selectedPath: selectedPath,
                  onError: (msg) => Log.error(msg),
                ),
                initialPath: state.tablePath,
                hintText: l10n?.selectAcpisFolder ?? l10nGlobal.ssdtMsg593,
                buttons: [
                  ChooseFileButton(
                    text: 'DSDT',
                    mode: OpenMode.file,
                    allowedExtensions: ['aml', 'dat'],
                  ),
                  ChooseFileButton(text: l10n?.selectAcpisFolder ?? l10nGlobal.ssdtMsg594, mode: OpenMode.directory),
                ],
              );
            },
          ),
          Row(
            spacing: 10,
            children: [
              AppButton(
                controlSize: ControlSize.large,
                onPressed: () async => await patchViewModel.mergePlist(onError: (msg) => Log.error(msg)),
                child: Text(l10n?.mergeConfig ?? l10nGlobal.ssdtMsg595),
              ),
              Expanded(
                child: _buildFilePicker(
                  patchViewModel: patchViewModel,
                  buttonText: l10n?.selectConfig ?? l10nGlobal.ssdtMsg596,
                  mode: OpenMode.file,
                  getPath: () => patchViewModel.state.value.configPath,
                  setPath: (newPath) => patchViewModel.updateConfigPath(newPath),
                  hint: l10n?.hintConfig ?? l10nGlobal.ssdtMsg597,
                  extensions: ['plist'],
                  onChanged: (newPath) {
                    patchViewModel.getPlistType(
                      newPath,
                      onSuccess: (msg) => Log(msg),
                      onError: (msg) => Log.error(msg),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilePicker({
    required PatchViewModel patchViewModel,
    required String buttonText,
    required OpenMode mode,
    required String? Function() getPath,
    required void Function(String?) setPath,
    String? hint,
    List<String>? extensions,
    Function(String)? onChanged,
  }) {
    hint ??= l10nGlobal.ssdtMsg590;
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        final path = getPath();
        return ChooseFileWidget(
          onChanged: (newPath) {
            setPath(newPath);
            onChanged?.call(newPath!);
          },
          initialPath: path,
          hintText: path ?? hint,
          buttons: [
            ChooseFileButton(
              text: buttonText,
              mode: mode,
              allowedExtensions: extensions,
            ),
          ],
        );
      },
    );
  }

  Widget _buildLogPanel(BuildContext context, PatchViewModel patchViewModel, AppLocalizations? l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n?.log ?? l10nGlobal.ssdtMsg585, style: const TextStyle(fontWeight: FontWeight.bold)),
            ValueListenableBuilder<PatchState>(
              valueListenable: patchViewModel.state,
              builder: (context, state, _) {
                return Row(
                  spacing: 10,
                  children: [
                    AppButton(
                      controlSize: ControlSize.regular,
                      secondary: true,
                      onPressed: Log.clearAll,
                      child: Text(l10n?.clearLog ?? l10nGlobal.ssdtMsg586),
                    ),
                    AppButton(
                      controlSize: ControlSize.regular,
                      secondary: true,
                      onPressed: () async {
                        Log.exportToDirectory(
                          targetDirectory: patchViewModel.desktopDirectory,
                          onSuccess: (log) => Log(log),
                          onError: (error) => Log.error(error),
                        );
                      },
                      child: Text(l10n?.exportLog ?? l10nGlobal.ssdtMsg587),
                    ),
                    AppButton(
                      controlSize: ControlSize.regular,
                      onPressed: () => patchViewModel.runPatch(
                        state.selectedAction,
                        prebuilt: state.selectedCategory == l10nGlobal.ssdtMsg588,
                        onError: (error) => Log.warning(error),
                      ),
                      child: Text(l10n?.executePatch ?? l10nGlobal.ssdtMsg589),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const LogWidget(showChannelTag: false, allChannel: true),
          ),
        ),
      ],
    );
  }
}
