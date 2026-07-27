//  repo_sevice.dart
//  Created by JeoJay127
//
import 'package:rapidssdt/utils/update/repo_config.dart';
import 'package:rapidssdt/utils/update/repo_checker.dart';
import 'package:rapidssdt/utils/update/repo_context.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';

class RepoService {
  RepoService._({
    required this.checker,
    Duration minInterval = const Duration(seconds: 10),
  }) : _minInterval = minInterval;

  static RepoService? _instance;

  static RepoService get instance =>
      _instance ??= RepoService._(checker: RepoChecker());

  final RepoChecker checker;
  final Duration _minInterval;

  bool _isChecking = false;
  DateTime? _lastCheckTime;
  bool _lastResultHadUpdate = false;

  Future<void> checkLatestRelease({
    required String currentVersion,
    RepoConfig config = RepoConfig.defaultConfig,
    bool silent = true,
    void Function(RepoContext ctx, String info)? onUpdateFound,
    void Function(String info)? onInfo,
    void Function(String error)? onError,
  }) async {
    final now = DateTime.now();
    if (_isChecking) {
      if (!silent) {
        onInfo?.call(l10nGlobal.msg_913130);
      }
      return;
    }

    if (_lastCheckTime != null &&
        !_lastResultHadUpdate &&
        now.difference(_lastCheckTime!) < _minInterval) {
      if (!silent) {
        onInfo?.call(l10nGlobal.msg_519f7d);
      }
      return;
    }

    _isChecking = true;

    try {
      final release = await checker.checkLatestRelease(
        config: config,
        currentVersion: currentVersion,
      );

      _lastCheckTime = now;
      _lastResultHadUpdate = release != null;

      if (release == null) {
        if (!silent) {
          onInfo?.call(l10nGlobal.msg_7916a3((currentVersion).toString()));
        }
        return;
      }

      final ctx = RepoContext(repoConfig: config, release: release);

      onUpdateFound?.call(ctx, l10nGlobal.msg_efa09d((release.tag).toString()));
      return;
    } catch (e) {
      if (!silent) {
        onError?.call(l10nGlobal.msg_431e1c);
      }
      rethrow;
    } finally {
      _isChecking = false;
    }
  }

  Future<void> checkReleases({
    RepoConfig config = RepoConfig.defaultConfig,
    bool silent = true,
    void Function(List? releases)? onReleaseFound,
    void Function(String info)? onInfo,
    void Function(String error)? onError,
  }) async {
    try {
      final releaseList = await checker.checkReleases(config: config);
      if (releaseList == null) {
        if (!silent) {
          onError?.call(l10nGlobal.msg_6bdac9);
        }
        return;
      }
      if (releaseList.isEmpty) {
        if (!silent) {
          onInfo?.call(l10nGlobal.msg_1377cf);
        }
        return;
      }
      onReleaseFound?.call(releaseList);
    } catch (e) {
      if (!silent) {
        onError?.call(l10nGlobal.msg_96612f((e).toString()));
      }
      rethrow;
    }
  }
}
