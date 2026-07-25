import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In zh, this message translates to:
  /// **'RapidSSDT'**
  String get appName;

  /// No description provided for @dumpAcpi.
  ///
  /// In zh, this message translates to:
  /// **'提取ACPI'**
  String get dumpAcpi;

  /// No description provided for @selectAcpisFolder.
  ///
  /// In zh, this message translates to:
  /// **'选择ACPIs'**
  String get selectAcpisFolder;

  /// No description provided for @generateSsdt.
  ///
  /// In zh, this message translates to:
  /// **'生成SSDT'**
  String get generateSsdt;

  /// No description provided for @clearConfig.
  ///
  /// In zh, this message translates to:
  /// **'清空配置'**
  String get clearConfig;

  /// No description provided for @selectDmar.
  ///
  /// In zh, this message translates to:
  /// **'选择DMAR'**
  String get selectDmar;

  /// No description provided for @hintDmar.
  ///
  /// In zh, this message translates to:
  /// **'请选择需要定制的DMAR表'**
  String get hintDmar;

  /// No description provided for @selectApic.
  ///
  /// In zh, this message translates to:
  /// **'选择APIC'**
  String get selectApic;

  /// No description provided for @hintApic.
  ///
  /// In zh, this message translates to:
  /// **'请选择需要定制的APIC表'**
  String get hintApic;

  /// No description provided for @selectFacp.
  ///
  /// In zh, this message translates to:
  /// **'选择FACP'**
  String get selectFacp;

  /// No description provided for @hintFacp.
  ///
  /// In zh, this message translates to:
  /// **'请选择FACP表'**
  String get hintFacp;

  /// No description provided for @selectOutputPath.
  ///
  /// In zh, this message translates to:
  /// **'选择输出路径'**
  String get selectOutputPath;

  /// No description provided for @oneClickSelect.
  ///
  /// In zh, this message translates to:
  /// **'一键选择'**
  String get oneClickSelect;

  /// No description provided for @clearSelection.
  ///
  /// In zh, this message translates to:
  /// **'清除选择'**
  String get clearSelection;

  /// No description provided for @about.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get about;

  /// No description provided for @checkUpdate.
  ///
  /// In zh, this message translates to:
  /// **'检查更新'**
  String get checkUpdate;

  /// No description provided for @guide.
  ///
  /// In zh, this message translates to:
  /// **'指南'**
  String get guide;

  /// No description provided for @platformPreset.
  ///
  /// In zh, this message translates to:
  /// **'平台预设'**
  String get platformPreset;

  /// No description provided for @customAcpiOptions.
  ///
  /// In zh, this message translates to:
  /// **'自定义ACPI选项'**
  String get customAcpiOptions;

  /// No description provided for @legacyIrqConflict.
  ///
  /// In zh, this message translates to:
  /// **'HPET IRQ冲突'**
  String get legacyIrqConflict;

  /// No description provided for @keepOriginalIrq.
  ///
  /// In zh, this message translates to:
  /// **'保留原始IRQ'**
  String get keepOriginalIrq;

  /// No description provided for @gpuSpoofModel.
  ///
  /// In zh, this message translates to:
  /// **'仿冒显卡型号'**
  String get gpuSpoofModel;

  /// No description provided for @pciPath.
  ///
  /// In zh, this message translates to:
  /// **'PCI设备路径'**
  String get pciPath;

  /// No description provided for @spoofGpuId.
  ///
  /// In zh, this message translates to:
  /// **'仿冒GPU ID'**
  String get spoofGpuId;

  /// No description provided for @disablePciDevices.
  ///
  /// In zh, this message translates to:
  /// **'屏蔽PCI设备'**
  String get disablePciDevices;

  /// No description provided for @brightnessPatch.
  ///
  /// In zh, this message translates to:
  /// **'屏幕背光补丁(PNLF)'**
  String get brightnessPatch;

  /// No description provided for @usbxPowerProperties.
  ///
  /// In zh, this message translates to:
  /// **'USB电源属性(USBX)'**
  String get usbxPowerProperties;

  /// No description provided for @xosiWindowsVersion.
  ///
  /// In zh, this message translates to:
  /// **'XOSI伪装Windows版本'**
  String get xosiWindowsVersion;

  /// No description provided for @language.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get language;

  /// No description provided for @languagePortugueseBR.
  ///
  /// In zh, this message translates to:
  /// **'Português (Brasil)'**
  String get languagePortugueseBR;

  /// No description provided for @languagePortuguesePT.
  ///
  /// In zh, this message translates to:
  /// **'Português (Portugal)'**
  String get languagePortuguesePT;

  /// No description provided for @languageEnglish.
  ///
  /// In zh, this message translates to:
  /// **'英语'**
  String get languageEnglish;

  /// No description provided for @languageChinese.
  ///
  /// In zh, this message translates to:
  /// **'中文'**
  String get languageChinese;

  /// No description provided for @languageJapanese.
  ///
  /// In zh, this message translates to:
  /// **'日本語'**
  String get languageJapanese;

  /// No description provided for @newVersionFound.
  ///
  /// In zh, this message translates to:
  /// **'发现新版本'**
  String get newVersionFound;

  /// No description provided for @versionNumber.
  ///
  /// In zh, this message translates to:
  /// **'版本号：'**
  String get versionNumber;

  /// No description provided for @releaseTime.
  ///
  /// In zh, this message translates to:
  /// **'发布时间：'**
  String get releaseTime;

  /// No description provided for @visitGithub.
  ///
  /// In zh, this message translates to:
  /// **'访问 GitHub'**
  String get visitGithub;

  /// No description provided for @downloadNow.
  ///
  /// In zh, this message translates to:
  /// **'立即下载'**
  String get downloadNow;

  /// No description provided for @close.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get close;

  /// No description provided for @log.
  ///
  /// In zh, this message translates to:
  /// **'日志'**
  String get log;

  /// No description provided for @clearLog.
  ///
  /// In zh, this message translates to:
  /// **'清除日志'**
  String get clearLog;

  /// No description provided for @exportLog.
  ///
  /// In zh, this message translates to:
  /// **'导出日志'**
  String get exportLog;

  /// No description provided for @executePatch.
  ///
  /// In zh, this message translates to:
  /// **'执行补丁'**
  String get executePatch;

  /// No description provided for @mergeConfig.
  ///
  /// In zh, this message translates to:
  /// **'合并config'**
  String get mergeConfig;

  /// No description provided for @selectConfig.
  ///
  /// In zh, this message translates to:
  /// **'选择config'**
  String get selectConfig;

  /// No description provided for @hintConfig.
  ///
  /// In zh, this message translates to:
  /// **'请选择config.plist文件'**
  String get hintConfig;

  /// No description provided for @selectPatch.
  ///
  /// In zh, this message translates to:
  /// **'选择补丁'**
  String get selectPatch;

  /// No description provided for @generatingSsdt.
  ///
  /// In zh, this message translates to:
  /// **'正在生成SSDT，请勿重复操作!'**
  String get generatingSsdt;

  /// No description provided for @noSsdtSelected.
  ///
  /// In zh, this message translates to:
  /// **'未选择任何 SSDT'**
  String get noSsdtSelected;

  /// No description provided for @platformInfo.
  ///
  /// In zh, this message translates to:
  /// **'平台信息:'**
  String get platformInfo;

  /// No description provided for @prebuiltSsdt.
  ///
  /// In zh, this message translates to:
  /// **'预制SSDT'**
  String get prebuiltSsdt;

  /// No description provided for @customSsdt.
  ///
  /// In zh, this message translates to:
  /// **'定制SSDT'**
  String get customSsdt;

  /// No description provided for @cpuType.
  ///
  /// In zh, this message translates to:
  /// **'CPU类型:'**
  String get cpuType;

  /// No description provided for @platformType.
  ///
  /// In zh, this message translates to:
  /// **'平台类型:'**
  String get platformType;

  /// No description provided for @platformDesktop.
  ///
  /// In zh, this message translates to:
  /// **'台式机'**
  String get platformDesktop;

  /// No description provided for @platformLaptop.
  ///
  /// In zh, this message translates to:
  /// **'笔记本'**
  String get platformLaptop;

  /// No description provided for @platformNuc.
  ///
  /// In zh, this message translates to:
  /// **'迷你主机'**
  String get platformNuc;

  /// No description provided for @platformServer.
  ///
  /// In zh, this message translates to:
  /// **'服务器'**
  String get platformServer;

  /// No description provided for @checkAll.
  ///
  /// In zh, this message translates to:
  /// **'勾选所有'**
  String get checkAll;

  /// No description provided for @coreOfficialRec.
  ///
  /// In zh, this message translates to:
  /// **'核心(官方推荐)'**
  String get coreOfficialRec;

  /// No description provided for @recommendedFixes.
  ///
  /// In zh, this message translates to:
  /// **'推荐(功能修复)'**
  String get recommendedFixes;

  /// No description provided for @optionalEnhancements.
  ///
  /// In zh, this message translates to:
  /// **'可选(功能完善)'**
  String get optionalEnhancements;

  /// No description provided for @builtin.
  ///
  /// In zh, this message translates to:
  /// **'内置'**
  String get builtin;

  /// No description provided for @remote.
  ///
  /// In zh, this message translates to:
  /// **'远程'**
  String get remote;

  /// No description provided for @newIasl.
  ///
  /// In zh, this message translates to:
  /// **'新版iasl'**
  String get newIasl;

  /// No description provided for @oldIasl.
  ///
  /// In zh, this message translates to:
  /// **'旧版iasl-legacy'**
  String get oldIasl;

  /// No description provided for @yes.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get no;

  /// No description provided for @preferences.
  ///
  /// In zh, this message translates to:
  /// **'偏好设置'**
  String get preferences;

  /// No description provided for @iaslMode.
  ///
  /// In zh, this message translates to:
  /// **'iasl模式'**
  String get iaslMode;

  /// No description provided for @iaslCompileType.
  ///
  /// In zh, this message translates to:
  /// **'iasl编译类型'**
  String get iaslCompileType;

  /// No description provided for @deleteDsl.
  ///
  /// In zh, this message translates to:
  /// **'删除反编译.dsl文件'**
  String get deleteDsl;

  /// No description provided for @forceCompile.
  ///
  /// In zh, this message translates to:
  /// **'强制编译'**
  String get forceCompile;

  /// No description provided for @overwriteEFI.
  ///
  /// In zh, this message translates to:
  /// **'是否覆盖目标EFI'**
  String get overwriteEFI;

  /// No description provided for @acpiMatchMode.
  ///
  /// In zh, this message translates to:
  /// **'ACPI匹配模式'**
  String get acpiMatchMode;

  /// No description provided for @deviceAcpiPath.
  ///
  /// In zh, this message translates to:
  /// **'设备ACPI路径:'**
  String get deviceAcpiPath;

  /// No description provided for @disableMethod.
  ///
  /// In zh, this message translates to:
  /// **'禁用方式:'**
  String get disableMethod;

  /// No description provided for @methodOFF.
  ///
  /// In zh, this message translates to:
  /// **'OFF方法'**
  String get methodOFF;

  /// No description provided for @methodPS3.
  ///
  /// In zh, this message translates to:
  /// **'PS3方法'**
  String get methodPS3;

  /// No description provided for @methodIOName.
  ///
  /// In zh, this message translates to:
  /// **'IOName方法'**
  String get methodIOName;

  /// No description provided for @deviceType.
  ///
  /// In zh, this message translates to:
  /// **'设备类型:'**
  String get deviceType;

  /// No description provided for @gpuGraphic.
  ///
  /// In zh, this message translates to:
  /// **'GPU显卡'**
  String get gpuGraphic;

  /// No description provided for @nvmeSsd.
  ///
  /// In zh, this message translates to:
  /// **'NVMe固态硬盘'**
  String get nvmeSsd;

  /// No description provided for @otherPcie.
  ///
  /// In zh, this message translates to:
  /// **'其他PCIe'**
  String get otherPcie;

  /// No description provided for @validDevicePathFormat.
  ///
  /// In zh, this message translates to:
  /// **'符合要求的设备路径应具有以下格式之一:'**
  String get validDevicePathFormat;

  /// No description provided for @pciBridgePath.
  ///
  /// In zh, this message translates to:
  /// **'PCI桥接路径:'**
  String get pciBridgePath;

  /// No description provided for @add.
  ///
  /// In zh, this message translates to:
  /// **'添加'**
  String get add;

  /// No description provided for @addedPciList.
  ///
  /// In zh, this message translates to:
  /// **'已添加PCI列表:'**
  String get addedPciList;

  /// No description provided for @delete.
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get delete;

  /// No description provided for @usbxPatch.
  ///
  /// In zh, this message translates to:
  /// **'USBX 补丁:'**
  String get usbxPatch;

  /// No description provided for @selectXosiTarget.
  ///
  /// In zh, this message translates to:
  /// **'选择XOSI的目标系统'**
  String get selectXosiTarget;

  /// No description provided for @autoDetectOsid.
  ///
  /// In zh, this message translates to:
  /// **'不选择则会根据DSDT自动探测OSID版本'**
  String get autoDetectOsid;

  /// No description provided for @osidSelection.
  ///
  /// In zh, this message translates to:
  /// **'OSID选择:'**
  String get osidSelection;

  /// No description provided for @hpetChoiceC.
  ///
  /// In zh, this message translates to:
  /// **'C: 仅来自 * 设备冲突IRQ（0,2,8,11）'**
  String get hpetChoiceC;

  /// No description provided for @hpetChoiceL.
  ///
  /// In zh, this message translates to:
  /// **'L: 仅来自 * 设备使用的IRQ'**
  String get hpetChoiceL;

  /// No description provided for @hpetChoiceO.
  ///
  /// In zh, this message translates to:
  /// **'O: 来自所有设备冲突IRQ（0,2,8,11）'**
  String get hpetChoiceO;

  /// No description provided for @currentLegacyIrqs.
  ///
  /// In zh, this message translates to:
  /// **'当前 Legacy IRQs:'**
  String get currentLegacyIrqs;

  /// No description provided for @customIrqsDesc.
  ///
  /// In zh, this message translates to:
  /// **'自定义IRQs,设备之间用空格分隔，IRQ之间用逗号分隔,例如: RTC:0 IPIC:2 TMR:8,11'**
  String get customIrqsDesc;

  /// No description provided for @customIrqs.
  ///
  /// In zh, this message translates to:
  /// **'自定义IRQs:'**
  String get customIrqs;

  /// No description provided for @customIrqsExample.
  ///
  /// In zh, this message translates to:
  /// **'示例: RTC:0 IPIC:2 TMR:8,11'**
  String get customIrqsExample;

  /// No description provided for @customIrqFormatError.
  ///
  /// In zh, this message translates to:
  /// **'自定义 IRQ 列表格式错误'**
  String get customIrqFormatError;

  /// No description provided for @selectGpuToSpoof.
  ///
  /// In zh, this message translates to:
  /// **'选择需要仿冒的显卡设备'**
  String get selectGpuToSpoof;

  /// No description provided for @unknownGpuModel.
  ///
  /// In zh, this message translates to:
  /// **'未知显卡型号'**
  String get unknownGpuModel;

  /// No description provided for @fakeGpuIdDatabase.
  ///
  /// In zh, this message translates to:
  /// **'仿冒显卡ID数据库:'**
  String get fakeGpuIdDatabase;

  /// No description provided for @fakeGpuId.
  ///
  /// In zh, this message translates to:
  /// **'仿冒显卡ID:'**
  String get fakeGpuId;

  /// No description provided for @example73BF.
  ///
  /// In zh, this message translates to:
  /// **'例如: 73BF'**
  String get example73BF;

  /// No description provided for @require4HexChars.
  ///
  /// In zh, this message translates to:
  /// **'需要4位十六进制字符'**
  String get require4HexChars;

  /// No description provided for @fakeGpuName.
  ///
  /// In zh, this message translates to:
  /// **'仿冒显卡名称:'**
  String get fakeGpuName;

  /// No description provided for @optionalGpuName.
  ///
  /// In zh, this message translates to:
  /// **'选填项,显卡名称'**
  String get optionalGpuName;

  /// No description provided for @fillAcpiPath.
  ///
  /// In zh, this message translates to:
  /// **'填写ACPI路径'**
  String get fillAcpiPath;

  /// No description provided for @fillPciPath.
  ///
  /// In zh, this message translates to:
  /// **'填写PCI路径'**
  String get fillPciPath;

  /// No description provided for @invalidAcpiPath.
  ///
  /// In zh, this message translates to:
  /// **'无效ACPI路径'**
  String get invalidAcpiPath;

  /// No description provided for @invalidPciPath.
  ///
  /// In zh, this message translates to:
  /// **'无效PCI路径'**
  String get invalidPciPath;

  /// No description provided for @imeiNotSpoofed.
  ///
  /// In zh, this message translates to:
  /// **'未启用仿冒IMEI, '**
  String get imeiNotSpoofed;

  /// No description provided for @imeiSpoofedValue.
  ///
  /// In zh, this message translates to:
  /// **'启用仿冒IMEI: '**
  String get imeiSpoofedValue;

  /// No description provided for @applicableTo.
  ///
  /// In zh, this message translates to:
  /// **'适用于'**
  String get applicableTo;

  /// No description provided for @sandyBridge7Series.
  ///
  /// In zh, this message translates to:
  /// **'搭配 7 系列芯片组的 Sandy Bridge CPU'**
  String get sandyBridge7Series;

  /// No description provided for @ivyBridge6Series.
  ///
  /// In zh, this message translates to:
  /// **'搭配 6 系列芯片组的 Ivy Bridge CPU'**
  String get ivyBridge6Series;

  /// No description provided for @devicePropertiesDeviceId.
  ///
  /// In zh, this message translates to:
  /// **'需要使用 DeviceProperties 设置device-id'**
  String get devicePropertiesDeviceId;

  /// No description provided for @imeiPatch.
  ///
  /// In zh, this message translates to:
  /// **'IMEI 补丁:'**
  String get imeiPatch;

  /// No description provided for @selectPnlfUid.
  ///
  /// In zh, this message translates to:
  /// **'为PNLF选择UID'**
  String get selectPnlfUid;

  /// No description provided for @suggestIgpuPath.
  ///
  /// In zh, this message translates to:
  /// **'当选择UID=14时,建议补充IGPU ACPI路径'**
  String get suggestIgpuPath;

  /// No description provided for @uidType.
  ///
  /// In zh, this message translates to:
  /// **'UID类型:'**
  String get uidType;

  /// No description provided for @requiredField.
  ///
  /// In zh, this message translates to:
  /// **'必填项'**
  String get requiredField;

  /// No description provided for @invalidUid.
  ///
  /// In zh, this message translates to:
  /// **'UID值无效'**
  String get invalidUid;

  /// No description provided for @supplementIgpuRegisters.
  ///
  /// In zh, this message translates to:
  /// **'是否补充IGPU寄存器信息'**
  String get supplementIgpuRegisters;

  /// No description provided for @suggestIgpuRegisters.
  ///
  /// In zh, this message translates to:
  /// **'当选择UID=14时,建议开启。如果不开启,可能会遇到最大亮度受限或其他问题'**
  String get suggestIgpuRegisters;

  /// No description provided for @remark_ssdtHPET.
  ///
  /// In zh, this message translates to:
  /// **'消除IRQ冲突,通常用于声卡修复'**
  String get remark_ssdtHPET;

  /// No description provided for @note_ssdtHPET.
  ///
  /// In zh, this message translates to:
  /// **'•\tHPET(High Precision Event Timer,高精度事件计时器)是用于系统定时的硬件模块。\n•\t在 macOS 下,一些主板的 HPET 设备可能会导致 IRQ(中断请求)冲突，进而影响音频设备的正常工作,导致系统不稳定、甚至无法启动。\n•\t该补丁通过调整 HPET 相关的 ACPI 设备定义，避免 IRQ 冲突，确保 macOS 能够正确使用 HPET 计时器，修复声卡问题,提高系统稳定性等。'**
  String get note_ssdtHPET;

  /// No description provided for @remark_ssdtECUSBXDesktop.
  ///
  /// In zh, this message translates to:
  /// **'仿冒EC并注入USB电源属性(适用于Intel 6代及以上台式机)'**
  String get remark_ssdtECUSBXDesktop;

  /// No description provided for @note_ssdtECUSBXDesktop.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于Intel 6代及以上台式机\n•\t该补丁会禁用系统原有 EC 设备,然后创建一个虚拟的 EC 设备，以“欺骗” macOS 认为存在一个兼容的 EC，从而解决因 EC 设备缺失导致的启动问题。 \n•\t添加必要的USB电源属性以修复潜在的问题。等同于合并: SSDT-EC-DESKTOP.aml + SSDT-USBX.aml'**
  String get note_ssdtECUSBXDesktop;

  /// No description provided for @remark_ssdtECUSBXLaptop.
  ///
  /// In zh, this message translates to:
  /// **'仅仿冒EC,不影响现有EC，同时注入USB电源属性(适用于Intel 6代及以上笔记本）'**
  String get remark_ssdtECUSBXLaptop;

  /// No description provided for @note_ssdtECUSBXLaptop.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于Intel 6代及以上笔记本\n•\t适用于笔记本,它不会删除或修改现有的 EC,而是单独创建一个新的虚拟 EC，避免破坏原始 EC 设备，防止可能导致笔记本电源管理、键盘背光等功能异常。\n•\t添加必要的USB电源属性以修复潜在的问题。等同于合并: SSDT-EC-LAPTOP.aml + SSDT-USBX.aml'**
  String get note_ssdtECUSBXLaptop;

  /// No description provided for @remark_ssdtECDesktop.
  ///
  /// In zh, this message translates to:
  /// **'仿冒EC(适用于Intel 5代及以下台式机)'**
  String get remark_ssdtECDesktop;

  /// No description provided for @note_ssdtECDesktop.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于Intel 5代及以下台式机\n•\t该补丁会禁用系统原有 EC 设备,然后创建一个虚拟的 EC 设备，以“欺骗” macOS 认为存在一个兼容的 EC，从而解决因 EC 设备缺失导致的启动问题。'**
  String get note_ssdtECDesktop;

  /// No description provided for @remark_ssdtECLaptop.
  ///
  /// In zh, this message translates to:
  /// **'仅仿冒EC,不影响现有EC(适用于Intel 5代及以下笔记本）'**
  String get remark_ssdtECLaptop;

  /// No description provided for @note_ssdtECLaptop.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于Intel 5代及以下笔记本\n•\t它不会删除或修改现有的 EC,而是单独创建一个新的虚拟 EC，避免破坏原始 EC 设备，防止可能导致笔记本电源管理、键盘背光等功能异常。'**
  String get note_ssdtECLaptop;

  /// No description provided for @remark_ssdtUSBX.
  ///
  /// In zh, this message translates to:
  /// **'USB电源属性修正(适用于Intel 6代及更新平台)'**
  String get remark_ssdtUSBX;

  /// No description provided for @note_ssdtUSBX.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于Intel Skylake 6代及以上, 服务器Haswell-E 4代及以上，AMD Ryzen等平台\n•\t从 Intel Skylake 及更新的处理器开始，macOS 需要特定的 USB 电源属性，以确保 USB 设备能够正确供电和识别。\n•\t该补丁修正 USB 端口的电源管理，使其符合 macOS 要求，解决 USB 设备识别异常、供电不足、无法热插拔等问题。\n•\t对于笔记本: SSDT-EC-LAPTOP.aml + SSDT-USBX.aml 两者合并等同于 SSDT-EC-USBX-LAPTOP.aml\n•\t对于台式机: SSDT-EC-DESKTOP.aml + SSDT-USBX.aml 两者合并等同于 SSDT-EC-USBX-DESKTOP.aml'**
  String get note_ssdtUSBX;

  /// No description provided for @remark_ssdtPLUG.
  ///
  /// In zh, this message translates to:
  /// **'CPU核心识别,启用频率调节与节能修正'**
  String get remark_ssdtPLUG;

  /// No description provided for @note_ssdtPLUG.
  ///
  /// In zh, this message translates to:
  /// **'•\tSSDT-PLUG 适用于Intel Haswell 4代 ~ 11代, 服务器Haswell-E 4代及以上平台 (定制SSDT-PLUG时,工具自动检测生成!)\n•\tSSDT-PLUG-ALT 适用于Intel Alder Lake 12代及以上,以及AMD Ryzen平台 (定制SSDT-PLUG时,工具自动检测生成并更名为SSDT-PLUG-ALT!)\n•\tmacOS 依赖 CPU 电源管理插件（PluginType）来调节 CPU 频率，提高能效和续航。\n•\t该补丁会修改 CPU 定义，使 macOS 认为它是 Apple 设备所需的 plugin-type = 1 处理器，从而正确加载 CPU 变频管理，提高性能和功耗控制。'**
  String get note_ssdtPLUG;

  /// No description provided for @remark_ssdtPMC.
  ///
  /// In zh, this message translates to:
  /// **'启用NVRAM支持(通常适用于Intel原生300系列主板)'**
  String get remark_ssdtPMC;

  /// No description provided for @note_ssdtPMC.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于Intel Coffee Lake 8代 ~ 9代平台\n•\t原生 300 系列主板（如 Z370、B360）在 macOS 下可能无法正确使用 NVRAM，导致部分功能（如 iMessage、音量记忆、引导参数等）无法保存。\n•\t该补丁启用主板的 PMC（Power Management Controller，电源管理控制器），让 macOS 正常使用原生 NVRAM，而无需额外的 EmuVariableUEFI 驱动。'**
  String get note_ssdtPMC;

  /// No description provided for @remark_ssdtPNLF.
  ///
  /// In zh, this message translates to:
  /// **'添加PNLF设备以提供背光支持(仅适用于笔记本和一体机)'**
  String get remark_ssdtPNLF;

  /// No description provided for @note_ssdtPNLF.
  ///
  /// In zh, this message translates to:
  /// **'•\tmacOS 需要 PNLF 设备（Panel Brightness）才能正确控制笔记本屏幕的亮度。\n•\t该补丁会在 ACPI 中创建一个 PNLF 设备,使 macOS 能够调节屏幕亮度，并在系统偏好设置中显示亮度控制选项。\n•\t适用于笔记本和部分一体机,解决亮度调节不可用的问题。\n•\tUID = 14, 适用于: Intel第1代Arrandale,第2代Sandy Bridge,第3代Ivy Bridge \n  注意:有些机器使用UID: 14 会遇到最大亮度受限或其他问题.为了解决这些问题,必须设置正确的 iGPU（集成显卡）的设备路径，并且可能需要补充IGPU寄存器信息\n•\tUID = 15, 适用于: Intel第4代Haswell,第5代Broadwell\n•\tUID = 16, 适用于: Intel第6代Skylake,第7代Kaby Lake, 某些第4代Haswell\n•\tUID = 17, 适用于: 自定义亮度,通常用于一些非标准设备或特殊需求的 Hackintosh（黑苹果）设置\n•\tUID = 18, 适用于: 自定义亮度,通常用于一些非标准设备或特殊需求的 Hackintosh（黑苹果）设置\n•\tUID = 19, 适用于: Intel第8代CoffeeLake及以上,10代以下,以及AMD笔记本\n•\tUID = 99, 适用于: 其他（需要自定义 applbkl-name / applbkl-data 设备属性）,可能根本无法正常工作'**
  String get note_ssdtPNLF;

  /// No description provided for @remark_ssdtALS0.
  ///
  /// In zh, this message translates to:
  /// **'提供屏幕背光调节所需的传感器支持(仅适用于笔记本和一体机)'**
  String get remark_ssdtALS0;

  /// No description provided for @note_ssdtALS0.
  ///
  /// In zh, this message translates to:
  /// **'•\t用于模拟和启用 Apple 原生传感器(光线传感器 Ambient Light Sensor,简称ALS)功能,以实现自动调节屏幕亮度\n•\t如果你的设备真的有ALS(如某些高端笔记本),并且存在问题,可以尝试添加SSDT-ALS0来修正自动亮度调节功能,否则不建议添加\n•\t适用范围：仅限一体机 (AIO) 和笔记本电脑'**
  String get note_ssdtALS0;

  /// No description provided for @remark_ssdtXOSI.
  ///
  /// In zh, this message translates to:
  /// **'macOS伪装成Windows,解锁被屏蔽的设备(如I2C触摸板)'**
  String get remark_ssdtXOSI;

  /// No description provided for @note_ssdtXOSI.
  ///
  /// In zh, this message translates to:
  /// **'•\t_OSI（Operating System Interface）是 ACPI 的一个方法，允许操作系统报告自己支持哪些功能。\n•\t一些主板固件可能会根据 _OSI 返回值来决定是否启用某些设备，而 macOS 可能不被识别，从而导致功能缺失。\n•\t该补丁会“欺骗”固件，使其认为 macOS 也是 Windows，从而激活隐藏的功能，如：I2C 触摸板、电池管理等。'**
  String get note_ssdtXOSI;

  /// No description provided for @remark_ssdtRHUB.
  ///
  /// In zh, this message translates to:
  /// **'USB端口重置与修正'**
  String get remark_ssdtRHUB;

  /// No description provided for @note_ssdtRHUB.
  ///
  /// In zh, this message translates to:
  /// **'•\t某些OEM违反了ACPI规范，这导致在启动macOS时出现问题。为了解决这个问题，需要关闭RHUB设备，并强制macOS手动重建端口。\n•\t该补丁在 macOS 启动时重置 USB 控制器(包括EHC1,EHC2等USB设备屏蔽和更名),使得所有 USB 端口可以正确识别,并配合 USB 映射（如:UTBMap.kext）使用,以确保 USB 设备正常工作。\n• 通常适用于桌面端400系主板(华硕等)以及移动端IceLake平台(戴尔,联想等)。'**
  String get note_ssdtRHUB;

  /// No description provided for @remark_ssdtBridge.
  ///
  /// In zh, this message translates to:
  /// **'为缺失的 PCI 设备路径创建桥接'**
  String get remark_ssdtBridge;

  /// No description provided for @note_ssdtBridge.
  ///
  /// In zh, this message translates to:
  /// **'•\t一些主板或设备的 PCI 设备路径可能在 macOS 下无法正确识别，导致设备无法正常工作，例如: 显卡、声卡、无线网卡等。\n•\t该补丁会为这些设备创建正确的 PCI 桥接，确保 macOS 能够正确识别并使用这些 PCI 设备。'**
  String get note_ssdtBridge;

  /// No description provided for @remark_ssdtDMAR.
  ///
  /// In zh, this message translates to:
  /// **'移除DMAR保留内存区域,修复系统启动问题,网卡兼容性问题'**
  String get remark_ssdtDMAR;

  /// No description provided for @note_ssdtDMAR.
  ///
  /// In zh, this message translates to:
  /// **'•\tDMAR（DMA Remapping Table）是 Intel VT-d 虚拟化技术的一部分，用于 IOMMU（输入输出内存管理单元）支持。\n•\t该补丁会移除 DMAR 表中导致问题的保留内存区域，从而避免 macOS 误读 DMAR 导致系统无法启动。\n•\t为 VT-d 兼容性提供支持，让 VT-d 在 macOS Big Sur 及更新版本中正常工作，尤其是涉及使用 DriverKit 驱动的硬件。\n•\tmacOS 支持 VT-d，但某些主板或 BIOS 提供的 DMAR 表存在兼容性问题，可能导致 macOS 在解析 ACPI DMAR 表时内核崩溃、卡启动、系统不稳定等问题(卡在 AppleACPICPU、IOPCI、AppleVTD 相关日志位置)。\n•\t支持的硬件范围： I225 网卡、Aquantia 网卡、部分 WiFi 设备等。\n•\t需在固件中 Drop 掉原有 DMAR 表，才能加载修补后的表。\n•\t适用 CPU： 任何支持 VT-d 技术的处理器。'**
  String get note_ssdtDMAR;

  /// No description provided for @remark_ssdtAPIC.
  ///
  /// In zh, this message translates to:
  /// **'修正APIC表,解决CPU内核panic问题(适用于HEDT服务器平台)'**
  String get remark_ssdtAPIC;

  /// No description provided for @note_ssdtAPIC.
  ///
  /// In zh, this message translates to:
  /// **'•\t修复或重写 APIC 表中的 Processor ID,确保 macOS 能正确识别 CPU 核心数量和编号,避免内核 panic 或核心识别错误。\n•\t需在固件中 Drop 掉原有 APIC 表，才能加载修补后的表。\n•\t适用于X58, X79, X99, X299 等 Intel 服务器(HEDT)平台。'**
  String get note_ssdtAPIC;

  /// No description provided for @remark_ssdtSBUSMCHC.
  ///
  /// In zh, this message translates to:
  /// **'添加系统总线SMBus支持'**
  String get remark_ssdtSBUSMCHC;

  /// No description provided for @note_ssdtSBUSMCHC.
  ///
  /// In zh, this message translates to:
  /// **'•\tmacOS 需要 SMBus（System Management Bus） 设备才能正确运行某些服务，如：\n  I2C 触摸板，电池管理，光感自动亮度调节，某些 Wi-Fi / 蓝牙设备\n•\tSSDT-SBUS-MCHC 通过在 ACPI 中添加 SBUS（系统管理总线）和 MCHC（内存控制器）设备，使 macOS 认为这是一个原生的 Apple 设备，确保相关功能正常工作。\n•\t如果设备 I2C 触摸板、电池信息、自动亮度调节无法使用，可以尝试启用该补丁。'**
  String get note_ssdtSBUSMCHC;

  /// No description provided for @remark_ssdtIMEI.
  ///
  /// In zh, this message translates to:
  /// **'修复核显加速失败问题(通常适用于Ivy Bridge和 Sandy Bridge)'**
  String get remark_ssdtIMEI;

  /// No description provided for @note_ssdtIMEI.
  ///
  /// In zh, this message translates to:
  /// **'•\tIntel Management Engine(简称IMEI)是用于连接管理引擎的硬件接口,只有在旧平台(Sandy/Ivy)和某些主板缺少 MEI/IMEI/HECI 设备时才需要\n•\t适用于Intel第3代Ivy Bridge处理器,6系主板混合时(例如：i3 3225处理器，H61主板),核显加速问题\n•\t适用于Intel第2代Sandy Bridge处理器,7系主板混合时(例如：i5 2500k处理器，B75主板),核显加速问题\n•\tIntel第3代Ivy Bridge处理器搭配7系主板,以及Intel第2代Sandy Bridge处理器搭配6系主板,不需要此SSDT!\n• Intel第4代Haswell及更新平台,通常能正确实现 MEI/IMEI/HECI 设备,不需要此SSDT!'**
  String get note_ssdtIMEI;

  /// No description provided for @remark_ssdtFixShutdown.
  ///
  /// In zh, this message translates to:
  /// **'修复关机变重启或关机不断电问题'**
  String get remark_ssdtFixShutdown;

  /// No description provided for @note_ssdtFixShutdown.
  ///
  /// In zh, this message translates to:
  /// **'•\t修复某些主板在macOS执行关机（S5）时，有时不会完全关闭 USB 控制器电源导致无法正常关机问题(关机变重启或关机不断电)\n•\t需要搭配 ACPI 重命名补丁： _PTS -> ZPTS'**
  String get note_ssdtFixShutdown;

  /// No description provided for @remark_checkSystemState.
  ///
  /// In zh, this message translates to:
  /// **'检查当前系统状态,主要查看是否支持S3睡眠(非定制SSDT)'**
  String get remark_checkSystemState;

  /// No description provided for @note_checkSystemState.
  ///
  /// In zh, this message translates to:
  /// **'•\t检查当前机器是否为AOAC机器(非定制SSDT)\n•\t检查当前BIOS设置中系统状态,主要查看是否支持S3睡眠(非定制SSDT)\n•\t注意:非AOAC机器才兼容S3睡眠,AOAC机器与S3睡眠冲突,不支持S3睡眠!\n•\t如果非AOAC机器(AOAC机器不支持S3睡眠,不用往下看)检查结果显示系统状态不支持S3睡眠,可能存在如下几种情况:\n  1. 主板固件支持S3睡眠,但是BIOS设置中未开启S3睡眠,开启后可支持S3睡眠\n  2. 主板固件物理未阉割 S3,只是 DSDT 未定义 _S3 方法,补全 _S3 方法有概率修复 S3 睡眠问题\n  3. 主板固件物理阉割 S3,完全不支持S3睡眠,就算补全 _S3 方法,也无法修复 S3 睡眠问题'**
  String get note_checkSystemState;

  /// No description provided for @remark_checkAOAC.
  ///
  /// In zh, this message translates to:
  /// **'检查当前是否为AOAC机器(非定制SSDT)'**
  String get remark_checkAOAC;

  /// No description provided for @note_checkAOAC.
  ///
  /// In zh, this message translates to:
  /// **'•\t根据FACP.aml检查当前是否为AOAC机器(非定制SSDT)\n•\t注意:非AOAC机器才兼容S3睡眠,AOAC机器与S3睡眠冲突,不支持S3睡眠!AOAC机器常见于笔记本\n•\tAOAC机器一旦进入S3睡眠,可能出现：睡眠后无法被唤醒，呈现死机状态，只能强制关机。建议禁用S3睡眠。\n•\tAOAC机器建议考虑如下解决方案:\n  1. 解锁BIOS,禁用AOAC(通常很难办到,但是最稳定)\n  2. 禁用S3睡眠 (在BIOS中禁用S3睡眠,或者SSDT-S3-DISABLE禁用S3睡眠)\n  3. 关闭独显供电电源\n  4. 使用 NVMeFix.kext 开启 SSD 的 APST\n  5. 启用 ASPM（BIOS 高级选项启用ASPM,SSDT 补丁启用 L1）'**
  String get note_checkAOAC;

  /// No description provided for @remark_ssdtGPRW.
  ///
  /// In zh, this message translates to:
  /// **'修复由于USB控制器导致睡眠即醒问题'**
  String get remark_ssdtGPRW;

  /// No description provided for @note_ssdtGPRW.
  ///
  /// In zh, this message translates to:
  /// **'•\t将GPRW重命名为XPRW,修复即时唤醒问题(注意:可能导致USB键盘无法唤醒设备,可以通过电源键唤醒)\n•\tSSDT-GPRW比较常用,因为绝大多数平台都是GPRW方法,极少数平台提供并使用UPRW方法\n•\t适用于Skylake及更新平台'**
  String get note_ssdtGPRW;

  /// No description provided for @remark_ssdtUPRW.
  ///
  /// In zh, this message translates to:
  /// **'修复由于USB控制器导致睡眠即醒问题'**
  String get remark_ssdtUPRW;

  /// No description provided for @note_ssdtUPRW.
  ///
  /// In zh, this message translates to:
  /// **'•\t将GPRW重命名为XPRW,修复即时唤醒问题(注意:可能导致USB键盘无法唤醒设备,可以通过电源键唤醒)\n•\t很少用到SSDT-UPRW,因为绝大多数平台都是GPRW方法,极少数平台提供并使用UPRW方法\n•\t适用于Skylake及更新平台'**
  String get note_ssdtUPRW;

  /// No description provided for @remark_ssdtLID.
  ///
  /// In zh, this message translates to:
  /// **'修复睡眠按键睡眠问题(适用于笔记本)'**
  String get remark_ssdtLID;

  /// No description provided for @note_ssdtLID.
  ///
  /// In zh, this message translates to:
  /// **'•\t某些电脑通过睡眠按键SLPB（PNP0C0E） 进入睡眠时,由于 ACPI 传递错误参数,导致 macOS 误认为是关机,可能导致:直接重启,睡眠后崩溃,或者睡眠成功但系统状态损坏\n•\t在按下睡眠键时伪装“盖子合上”，把危险的 PNP0C0E 睡眠强制转换成安全稳定的 PNP0C0D 睡眠\n•\t通常适用于笔记本电脑'**
  String get note_ssdtLID;

  /// No description provided for @remark_ssdtWakeScreen.
  ///
  /// In zh, this message translates to:
  /// **'修复唤醒后需按任意键亮屏问题'**
  String get remark_ssdtWakeScreen;

  /// No description provided for @note_ssdtWakeScreen.
  ///
  /// In zh, this message translates to:
  /// **'•\t修复某些机器唤醒后需按任意键才能亮屏的问题'**
  String get note_ssdtWakeScreen;

  /// No description provided for @remark_ssdtLED.
  ///
  /// In zh, this message translates to:
  /// **'修复唤醒后电源键呼吸灯异常问题(适用于联想笔记本)'**
  String get remark_ssdtLED;

  /// No description provided for @note_ssdtLED.
  ///
  /// In zh, this message translates to:
  /// **'•\t修复某些联想笔记本唤醒后 A 面呼吸灯和电源键呼吸灯未恢复正常的问题\n•\t修复某些联想笔记本上唤醒后 F4 麦克风指示灯状态不正常的问题\n•\t主要适用于联想系列笔记本,其他品牌笔记本通常不适用'**
  String get note_ssdtLED;

  /// No description provided for @remark_ssdtS3Disable.
  ///
  /// In zh, this message translates to:
  /// **'禁用系统 S3 睡眠状态(修复S3睡眠唤醒崩溃,重启或关机问题)'**
  String get remark_ssdtS3Disable;

  /// No description provided for @note_ssdtS3Disable.
  ///
  /// In zh, this message translates to:
  /// **'•\t仅禁用macOS系统下 S3 睡眠状态,避免macOS系统唤醒时出现系统崩溃、重启或关机\n•\t禁用后,仅macOS不再支持S3睡眠(点击睡眠按钮或者显示器进入节能模式,屏幕关闭,但是主机仍然会运行,风扇也不会停止运转)\n•\t禁用macOS系统下 S3 睡眠状态后,不再需要修改macOS任何系统设置,可以不用关闭节能模式(在此之前,你可能需要修改系统设置->不活跃时关闭显示器->永不)\n•\t适用场景:在没有修复睡眠问题时,macOS系统设置里节能模式开启(\"不活跃时关闭显示器->10分钟\"),系统进入睡眠状态后,当唤醒macOS系统,可能出现系统崩溃、重启或关机.此时可以禁用S3睡眠状态,即可修复该问题.\n•\t需要搭配 ACPI 重命名补丁： _S3 -> XS3'**
  String get note_ssdtS3Disable;

  /// No description provided for @remark_ssdtFACP.
  ///
  /// In zh, this message translates to:
  /// **'热重启修改为冷重启,修复部分硬件不可用的问题'**
  String get remark_ssdtFACP;

  /// No description provided for @note_ssdtFACP.
  ///
  /// In zh, this message translates to:
  /// **'•\t热重启修改为冷重启，修复部分平台从Windows重启到macOS后,导致部分硬件不可用的问题。(比如：声卡,WiFi,蓝牙)\n•\t注意: 没有SSDT-FACP.aml生成! 只生成ACPI - Patch补丁!'**
  String get note_ssdtFACP;

  /// No description provided for @remark_ssdtGPUSPOOF.
  ///
  /// In zh, this message translates to:
  /// **'仿冒显卡'**
  String get remark_ssdtGPUSPOOF;

  /// No description provided for @note_ssdtGPUSPOOF.
  ///
  /// In zh, this message translates to:
  /// **'•\t仅适用于AMD 显卡,SSDT-GPU-SPOOF 通过修改 macOS 读取的设备 ID，让 macOS 误以为该显卡是支持的型号，从而启用加速功能。\n•\t常见需要仿冒的显卡型号：\n  • AMD Radeon RX 550 Lexa 核心  \n  • AMD Radeon RX 6650XT, RX 6950XT等'**
  String get note_ssdtGPUSPOOF;

  /// No description provided for @remark_ssdtPCIDISABLE.
  ///
  /// In zh, this message translates to:
  /// **'屏蔽PCI设备,包括不支持的显卡、NVMe固态硬盘等'**
  String get remark_ssdtPCIDISABLE;

  /// No description provided for @note_ssdtPCIDISABLE.
  ///
  /// In zh, this message translates to:
  /// **'•\t常见3种方法(OFF,PS3,IOName都可以屏蔽),屏蔽不支持的PCIe 设备,包括不支持的显卡、NVMe固态硬盘、无线网卡等,方法优先顺序: OFF > PS3 > IOName\n•\tSSDT-GPU-DISABLE-OFF (适用于笔记本,台式机一般不提供OFF方法)通过在 ACPI 层面禁用独立显卡,可以做到macOS 系统完全检测不到独显,独显处于停止供电状态,从而节省功耗并降低温度。\n•\tSSDT-GPU-DISABLE-PS3 (适用于笔记本,台式机一般不提供PS3方法) 通过在 ACPI 层面禁用独立显卡,可以做到macOS 系统独显在S3 睡眠状态下停止供电,从而节省功耗并降低温度。\n•\tSSDT-GPU-DISABLE-IOName (适用于所有平台) 修改显卡设备ID,macOS 系统仍然会检测到显卡,只是不加载对应显卡驱动,显卡处于未驱动状态,因此存在一定功耗。\n•\t笔记本原始ACPI表不存在OFF,PS3方法时,对应的SSDT-GPU-DISABLE-OFF,SSDT-GPU-DISABLE-PS3方法屏蔽会失败,建议退而求其次,使用IOName方法屏蔽PCI设备'**
  String get note_ssdtPCIDISABLE;

  /// No description provided for @remark_ssdtRMNE.
  ///
  /// In zh, this message translates to:
  /// **'仿冒有线网卡设备(适用于没有有线网卡的笔记本)'**
  String get remark_ssdtRMNE;

  /// No description provided for @note_ssdtRMNE.
  ///
  /// In zh, this message translates to:
  /// **'•\t为Hackintosh系统提供NullEthernet仿冒虚拟网卡，用于解决 iMessage、Facetime、iCloud 等 Apple 服务对内建网络设备的依赖'**
  String get note_ssdtRMNE;

  /// No description provided for @remark_ssdtGPI0.
  ///
  /// In zh, this message translates to:
  /// **'修复笔记本I2C触摸板问题(适用于笔记本)'**
  String get remark_ssdtGPI0;

  /// No description provided for @note_ssdtGPI0.
  ///
  /// In zh, this message translates to:
  /// **'•\t通过修复ACPI硬件节点挂载,确保在macOS系统启用该设备,修复部分I2C触控板无法正常识别问题\n•\tSSDT-GPI0 解决驱动挂载硬件设备问题,SSDT-XOSI 主要用于修复 BIOS/ACPI 初始化逻辑与操作系统识别不兼容的问题(某些时候可以修复触控板问题)'**
  String get note_ssdtGPI0;

  /// No description provided for @remark_ssdtCPUR.
  ///
  /// In zh, this message translates to:
  /// **'B850,B650,B550,A520芯片组的CPU重命名(仅适用于Ryzen平台)'**
  String get remark_ssdtCPUR;

  /// No description provided for @note_ssdtCPUR.
  ///
  /// In zh, this message translates to:
  /// **'•\t适用于B850,B650,B550,A520芯片组的CPU重命名,修复AMD平台无法识别CPU导致的崩溃问题(预制SSDT补丁时才推荐使用)\n•\t定制SSDT补丁时,建议使用定制的SSDT-PLUG即可!(AMD Ryzen平台,在定制SSDT时,自动更名为SSDT-PLUG-ALT)'**
  String get note_ssdtCPUR;

  /// No description provided for @remark_ssdtPLUGALT.
  ///
  /// In zh, this message translates to:
  /// **'修复电源管理(适用于Intel 12代及以上，部分AMD Ryzen等平台)'**
  String get remark_ssdtPLUGALT;

  /// No description provided for @note_ssdtPLUGALT.
  ///
  /// In zh, this message translates to:
  /// **'•\tmacOS 依赖 CPU 电源管理插件（PluginType）来调节 CPU 频率，提高能效和续航。\n•\t该补丁会修改 CPU 定义，使 macOS 认为它是 Apple 设备所需的 plugin-type = 1 处理器，从而正确加载 CPU 变频管理，提高性能和功耗控制。\n•\t适用于Intel Alder Lake 12代及以上,以及部分AMD Ryzen平台'**
  String get note_ssdtPLUGALT;

  /// No description provided for @remark_ssdtAWAC.
  ///
  /// In zh, this message translates to:
  /// **'禁用AWAC(现代计时器)(适用于Intel Coffee Lake 8代及以上)'**
  String get remark_ssdtAWAC;

  /// No description provided for @note_ssdtAWAC.
  ///
  /// In zh, this message translates to:
  /// **'•\t禁用AWAC(现代计时器),同时启用或仿冒传统RTC\n•\t适用于Intel Coffee Lake 8代及以上'**
  String get note_ssdtAWAC;

  /// No description provided for @remark_ssdtUNC.
  ///
  /// In zh, this message translates to:
  /// **'所有原生X99(C612)主板和大多数原生X79(C602)主板需要'**
  String get remark_ssdtUNC;

  /// No description provided for @note_ssdtUNC.
  ///
  /// In zh, this message translates to:
  /// **'•\t此 SSDT 适用于所有 X99 主板以及多数 X79 主板，主要功能是禁用 ACPI 中未使用的设备，从而防止 IOPCIFamily 引起内核崩溃（kernel panic）。\n•\t适用主板： 所有原生X99(C612)主板和大多数原生X79(C602)主板。'**
  String get note_ssdtUNC;

  /// No description provided for @remark_ssdtRTC0RANGE.
  ///
  /// In zh, this message translates to:
  /// **'启用或仿冒传统RTC计时器,并修复RTC范围(适用于所有原生X99(C612)和X299主板)'**
  String get remark_ssdtRTC0RANGE;

  /// No description provided for @note_ssdtRTC0RANGE.
  ///
  /// In zh, this message translates to:
  /// **'•\t启用或仿冒传统RTC计时器,并修复RTC范围。\n• 解决开机时间不正确、RTC 相关错误、睡眠唤醒问题等。\n•\t此 SSDT 适用于所有 X99(C612) 主板以及X299 主板'**
  String get note_ssdtRTC0RANGE;

  /// No description provided for @remark_ssdtDTGP.
  ///
  /// In zh, this message translates to:
  /// **'添加DTGP支持'**
  String get remark_ssdtDTGP;

  /// No description provided for @note_ssdtDTGP.
  ///
  /// In zh, this message translates to:
  /// **'•\t注入硬件设备属性,修复部分显卡,声卡,雷电卡等ACPI问题(没有 DTGP 方法支持时，这些属性注入可能会失败或不起作用！)'**
  String get note_ssdtDTGP;

  /// No description provided for @remark_ssdtDMAC.
  ///
  /// In zh, this message translates to:
  /// **'仿冒一个标准DMA控制器'**
  String get remark_ssdtDMAC;

  /// No description provided for @note_ssdtDMAC.
  ///
  /// In zh, this message translates to:
  /// **'•\t仿冒一个标准 DMA Controller（直接内存访问控制器）的虚拟设备控制器（PNP0200）, 补全 ACPI 资源表,让 macOS 正常识别 LPC 总线设备和 DMA 功能\n•\tHEDT/服务器平台通常不需要\n•\t添加缺失的部件,这只是一种完善方案,非必要!'**
  String get note_ssdtDMAC;

  /// No description provided for @remark_ssdtPWRB.
  ///
  /// In zh, this message translates to:
  /// **'仿冒一个标准PWRB控制器'**
  String get remark_ssdtPWRB;

  /// No description provided for @note_ssdtPWRB.
  ///
  /// In zh, this message translates to:
  /// **'•\t仿冒一个标准 Power Button（PNP0C0C）设备,让 macOS 正常识别系统电源按钮、支持睡眠和唤醒\n•\t部分 BIOS/主板 ACPI 树里没有 PNP0C0C,macOS 无法正确处理电源按钮,可能导致无法睡眠、无法唤醒、菜单栏电源按钮不可用\n•\t添加缺失的部件,这只是一种完善方案,非必要!'**
  String get note_ssdtPWRB;

  /// No description provided for @remark_ssdtSLPB.
  ///
  /// In zh, this message translates to:
  /// **'仿冒一个标准SLPB控制器'**
  String get remark_ssdtSLPB;

  /// No description provided for @note_ssdtSLPB.
  ///
  /// In zh, this message translates to:
  /// **'•\t仿冒一个标准 Sleep Button（PNP0C0E）设备，让 macOS 正确识别系统睡眠按钮，实现睡眠和唤醒功能\n•\t部分 BIOS/主板 ACPI 树里没有 PNP0C0E,macOS 无法正确处理睡眠按钮,可能导致无法睡眠、无法唤醒、菜单栏睡眠按钮不可用\n•\tPNP0C0E睡眠修正方法时,需要此部件!\n•\t添加缺失的部件,这只是一种完善方案,非必要!'**
  String get note_ssdtSLPB;

  /// No description provided for @remark_ssdtMEM2.
  ///
  /// In zh, this message translates to:
  /// **'仿冒一个IGPU所需的MEM2设备'**
  String get remark_ssdtMEM2;

  /// No description provided for @note_ssdtMEM2.
  ///
  /// In zh, this message translates to:
  /// **'•\t添加 IGPU 所需的 MEM2 ACPI 设备,修复 IGPU 相关问题\n•\t补充核显内存映射，避免驱动初始化失败\n•\t适用范围: Haswell ~ Kaby Lake，仅核显系统。通常仅独显不需要此SSDT!'**
  String get note_ssdtMEM2;

  /// No description provided for @corePatches.
  ///
  /// In zh, this message translates to:
  /// **'核心补丁'**
  String get corePatches;

  /// No description provided for @corePatchesRemark.
  ///
  /// In zh, this message translates to:
  /// **'系统正常启动和电源管理必需的基础补丁'**
  String get corePatchesRemark;

  /// No description provided for @functionPatches.
  ///
  /// In zh, this message translates to:
  /// **'功能补丁'**
  String get functionPatches;

  /// No description provided for @functionPatchesRemark.
  ///
  /// In zh, this message translates to:
  /// **'提供额外功能或修复特性问题的补丁'**
  String get functionPatchesRemark;

  /// No description provided for @devicePatches.
  ///
  /// In zh, this message translates to:
  /// **'设备补丁'**
  String get devicePatches;

  /// No description provided for @devicePatchesRemark.
  ///
  /// In zh, this message translates to:
  /// **'针对显卡硬件的补丁'**
  String get devicePatchesRemark;

  /// No description provided for @specialPatches.
  ///
  /// In zh, this message translates to:
  /// **'专用补丁'**
  String get specialPatches;

  /// No description provided for @specialPatchesRemark.
  ///
  /// In zh, this message translates to:
  /// **'仅在特定主板或架构需要的补丁'**
  String get specialPatchesRemark;

  /// No description provided for @sleepPatches.
  ///
  /// In zh, this message translates to:
  /// **'睡眠补丁'**
  String get sleepPatches;

  /// No description provided for @sleepPatchesRemark.
  ///
  /// In zh, this message translates to:
  /// **'非必需，用于修复睡眠问题'**
  String get sleepPatchesRemark;

  /// No description provided for @auxiliaryPatches.
  ///
  /// In zh, this message translates to:
  /// **'辅助补丁'**
  String get auxiliaryPatches;

  /// No description provided for @auxiliaryPatchesRemark.
  ///
  /// In zh, this message translates to:
  /// **'非必需，但可以补全ACPI结构或增强兼容性'**
  String get auxiliaryPatchesRemark;

  /// No description provided for @prebuiltPatches.
  ///
  /// In zh, this message translates to:
  /// **'预制补丁'**
  String get prebuiltPatches;

  /// No description provided for @languagePortuguese.
  ///
  /// In zh, this message translates to:
  /// **'葡萄牙语'**
  String get languagePortuguese;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'pt', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
