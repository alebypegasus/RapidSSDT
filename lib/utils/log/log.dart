//  log.dart
//  Created by JeoJay127
//
import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/utils/log/log_translations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';

/// 日志级别
enum LogLevel { debug, info, warning, error }

/// 日志操作类型
enum _LogOperationType { add, clear }

/// 日志操作
class _LogOperation {
  final _LogOperationType type;
  final String? logLine;
  final LogLevel? level;
  final String? message;

  _LogOperation({required this.type, this.logLine, this.level, this.message});
}

/// 日志配置
class LogConfig {
  bool enableLevelFilter;
  LogLevel minLevel;
  int maxLines; // 内存保留最大行
  bool enablePrint;
  int maxFileSizeKB;
  // UI显示相关
  bool includeLogTimestampForUI;
  bool includeLogLevelForUI;

  int flushIntervalMs; // 文件缓冲写入间隔
  int flushBatchSize; // 文件缓冲批次大小

  LogConfig({
    this.enableLevelFilter = false,
    this.minLevel = LogLevel.debug,
    this.maxLines = 2000,
    this.enablePrint = true,
    this.maxFileSizeKB = 1024,
    this.flushIntervalMs = 200,
    this.flushBatchSize = 20,
    this.includeLogTimestampForUI = false,
    this.includeLogLevelForUI = false,
  });

  bool isLevelAllowed(LogLevel level) {
    if (!enableLevelFilter) return true;
    return level.index >= minLevel.index;
  }
}

typedef LogChannelCreatedCallback = void Function(Log log);

/// 日志管理器
class Log {
  static final Map<String, Log> _channels = {};
  static const String defaultChannel = 'default';
  static final separator = Platform.pathSeparator;
  final String channel;
  final LogLevel defaultLevel;
  final LogConfig config;

  final List<String> _logs = [];
  List<String> get logs => List.unmodifiable(_logs);

  late File _logFile;
  late Future<void> _initialized;

  final Queue<_LogOperation> _operationQueue = Queue();
  bool _isProcessing = false;
  bool _disposed = false;
  // --- UI 使用的实时流 ---
  final StreamController<String> _logStreamController =
      StreamController.broadcast();
  Stream<String> get logStream => _logStreamController.stream;

  // --- 全局流,所有 channel 合并 ---
  static final StreamController<String> _globalLogStreamController =
      StreamController.broadcast();
  static Stream<String> get logStreamAll => _globalLogStreamController.stream;

  /// 获取/创建日志通道
  static LogChannelCreatedCallback? onChannelCreated;

  final List<String> _buffer = [];
  Timer? _flushTimer;

  static Map<String, Log> get channels => _channels;

  Log._(this.channel, this.defaultLevel, this.config) {
    _initialized = _initFile();
  }

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;

    _flushTimer?.cancel();
    _flushTimer = null;

    await _processQueue();
    await _flushBuffer();

    await _logStreamController.close();
    _channels.remove(channel);
  }

  /// 初始化默认通道
  factory Log(
    String? message, {
    String? channel,
    LogLevel level = LogLevel.info,
    LogConfig? config,
  }) {
    return Log.width(
      message: message != null ? _translate(message) : null,
      channel: channel,
      level: level,
      config: config,
    );
  }

  factory Log.width({
    String? channel,
    LogLevel level = LogLevel.info,
    LogConfig? config,
    String? message,
  }) {
    final ch = channel ?? defaultChannel;
    if (_channels.containsKey(ch)) {
      final log = _channels[ch]!;
      if (message != null) log.add(message, level: level);
      return log;
    } else {
      final log = Log._(ch, level, config ?? LogConfig());
      _channels[ch] = log;
      onChannelCreated?.call(log);
      if (message != null) log.add(message, level: level);
      return log;
    }
  }

  /// 导出日志到桌面
  static Future<void> exportToDirectory({
    required String targetDirectory,
    String? channel,
    Function(String)? onSuccess,
    Function(String)? onError,
  }) async {
    final log = _channels[channel ?? defaultChannel];
    if (log == null) {
      onError?.call(l10nGlobal.msg_7ca0c6((channel ?? defaultChannel).toString()));
      return;
    }

    final logFile = log._logFile;
    if (await logFile.exists()) {
      try {
        final fileName = logFile.uri.pathSegments.last;
        await logFile.copy('$targetDirectory$separator$fileName');
        onSuccess?.call(l10nGlobal.msg_7d9632((targetDirectory).toString(), (separator).toString(), (fileName).toString()));
      } catch (e) {
        onError?.call(l10nGlobal.msg_06576e((e).toString()));
      }
    } else {
      onError?.call(l10nGlobal.msg_312576((logFile.path).toString()));
    }
  }

  Future<void> _initFile() async {
    final dir = await getApplicationSupportDirectory();
    try {
      _logFile = File('${dir.path}${separator}log${separator}log_$channel.txt');
      if (!await _logFile.exists()) await _logFile.create(recursive: true);
      await _rotateLogIfNeeded();
    } catch (e) {
      throw Exception(l10nGlobal.msg_41eede((e).toString()));
    }
  }

  Future<void> _rotateLogIfNeeded() async {
    if (await _logFile.exists()) {
      final length = await _logFile.length();
      if (length > config.maxFileSizeKB * 1024) {
        final ts = DateTime.now().millisecondsSinceEpoch;
        await _logFile.rename('${_logFile.path}.$ts');
        _logFile = File(_logFile.path);
        await _logFile.create();
      }
    } else {
      await _logFile.create(recursive: true);
    }
  }

  Future<void> add(String message, {LogLevel? level}) async {
    final effectiveLevel = level ?? defaultLevel;
    if (!config.isLevelAllowed(effectiveLevel)) return;

    final ts = DateTime.now().toLocal();
    final levelStr = effectiveLevel.toString().split('.').last.toUpperCase();
    final logLine = '$ts [$levelStr] $message';

    _operationQueue.add(
      _LogOperation(
        type: _LogOperationType.add,
        logLine: logLine,
        level: effectiveLevel,
        message: message,
      ),
    );
    _processQueue();
  }

  Future<void> _processQueue() async {
    if (_isProcessing || _operationQueue.isEmpty) return;
    _isProcessing = true;
    try {
      while (_operationQueue.isNotEmpty) {
        final op = _operationQueue.removeFirst();
        if (op.type == _LogOperationType.add) {
          await _performAdd(op);
        } else if (op.type == _LogOperationType.clear) {
          await _performClear();
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _performAdd(_LogOperation op) async {
    await _initialized;
    await _rotateLogIfNeeded();

    final logLine = op.logLine!;

    _logs.add(logLine);
    while (_logs.length > config.maxLines) {
      _logs.removeAt(0);
    }

    _logStreamController.add(logLine);
    _globalLogStreamController.add('[$channel] $logLine');

    if (config.enablePrint) debugPrint(logLine);

    _buffer.add(logLine);
    if (_buffer.length >= config.flushBatchSize) {
      await _flushBuffer();
    } else {
      _flushTimer ??= Timer(
        Duration(milliseconds: config.flushIntervalMs),
        () async {
          if (_disposed) return;
          await _flushBuffer();
        },
      );
    }
  }

  Future<void> _performClear() async {
    _logs.clear();
    _buffer.clear();
    _globalLogStreamController.add('[$channel] [CLEARED]');
    _logStreamController.add('[$channel] [CLEARED]');
    if (await _logFile.exists()) {
      await _logFile.writeAsString('');
    }
  }

  Future<void> _flushBuffer() async {
    if (_disposed || _buffer.isEmpty) return;
    final lines = '${_buffer.join('\n')}\n';
    _buffer.clear();
    await _logFile.writeAsString(lines, mode: FileMode.append);
    _flushTimer?.cancel();
    _flushTimer = null;
  }

  Future<void> _clear() async {
    _operationQueue.add(_LogOperation(type: _LogOperationType.clear));
    _processQueue();
  }

  static String _translate(String msg) {
    final lang = LanguageProvider.currentLangCode;
    if (lang == 'zh') return msg;

    Map<String, String>? map;
    if (lang == 'pt') {
      map = LogTranslations.pt;
    } else {
      map = LogTranslations.en;
    }

    if (map != null) {
      map.forEach((k, v) {
        if (msg.contains(k)) {
          msg = msg.replaceAll(k, v);
        }
      });
    }
    return msg;
  }

  static Future<void> info(String msg, {String? channel}) =>
      Log.width(channel: channel).add(_translate(msg), level: LogLevel.info);
  static Future<void> debug(String msg, {String? channel}) =>
      Log.width(channel: channel).add(_translate(msg), level: LogLevel.debug);
  static Future<void> warning(String msg, {String? channel}) =>
      Log.width(channel: channel).add(_translate(msg), level: LogLevel.warning);
  static Future<void> error(String msg, {String? channel}) =>
      Log.width(channel: channel).add(_translate(msg), level: LogLevel.error);

  /// 清除指定日志通道的日志
  static Future<void> clear({String? channel}) async {
    final log = _channels[channel ?? defaultChannel];
    if (log != null) await log._clear();
  }

  /// 清除所有日志通道的日志
  static Future<void> clearAll() async {
    for (final log in _channels.values) {
      await log._clear();
    }
  }

  /// 关闭所有日志通道
  static Future<void> shutdownAll() async {
    for (final log in _channels.values) {
      await log.dispose();
    }
    // 关闭全局日志流
    await _globalLogStreamController.close();
  }
}
