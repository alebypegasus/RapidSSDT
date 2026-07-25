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

  /// No description provided for @ssdtMsg500.
  ///
  /// In zh, this message translates to:
  /// **'Device ACPI path:'**
  String get ssdtMsg500;

  /// No description provided for @ssdtMsg501.
  ///
  /// In zh, this message translates to:
  /// **'Select the graphics card device to be counterfeited'**
  String get ssdtMsg501;

  /// No description provided for @ssdtMsg502.
  ///
  /// In zh, this message translates to:
  /// **'Unknown graphics card model'**
  String get ssdtMsg502;

  /// No description provided for @ssdtMsg503.
  ///
  /// In zh, this message translates to:
  /// **'Counterfeit graphics card ID database:'**
  String get ssdtMsg503;

  /// No description provided for @ssdtMsg504.
  ///
  /// In zh, this message translates to:
  /// **'{arg0}'**
  String ssdtMsg504(String arg0);

  /// No description provided for @ssdtMsg505.
  ///
  /// In zh, this message translates to:
  /// **'For example: 73BF'**
  String get ssdtMsg505;

  /// No description provided for @ssdtMsg506.
  ///
  /// In zh, this message translates to:
  /// **'Requires 4 hexadecimal characters'**
  String get ssdtMsg506;

  /// No description provided for @ssdtMsg507.
  ///
  /// In zh, this message translates to:
  /// **'{arg0}'**
  String ssdtMsg507(String arg0);

  /// No description provided for @ssdtMsg508.
  ///
  /// In zh, this message translates to:
  /// **'Optional, graphics card name'**
  String get ssdtMsg508;

  /// No description provided for @ssdtMsg509.
  ///
  /// In zh, this message translates to:
  /// **'Counterfeit graphics card ID:'**
  String get ssdtMsg509;

  /// No description provided for @ssdtMsg510.
  ///
  /// In zh, this message translates to:
  /// **'Counterfeit graphics card name:'**
  String get ssdtMsg510;

  /// No description provided for @ssdtMsg511.
  ///
  /// In zh, this message translates to:
  /// **'Whether to delete the source .dsl file: {arg0}'**
  String ssdtMsg511(String arg0);

  /// No description provided for @ssdtMsg512.
  ///
  /// In zh, this message translates to:
  /// **'Whether to force compilation: {arg0}'**
  String ssdtMsg512(String arg0);

  /// No description provided for @ssdtMsg513.
  ///
  /// In zh, this message translates to:
  /// **'Whether to overwrite the target EFI: {arg0}'**
  String ssdtMsg513(String arg0);

  /// No description provided for @ssdtMsg514.
  ///
  /// In zh, this message translates to:
  /// **'Match pattern: {arg0}'**
  String ssdtMsg514(String arg0);

  /// No description provided for @ssdtMsg515.
  ///
  /// In zh, this message translates to:
  /// **'Failed to load HPET data: {arg0}'**
  String ssdtMsg515(String arg0);

  /// No description provided for @ssdtMsg516.
  ///
  /// In zh, this message translates to:
  /// **'Failed to initialize HPET data: {arg0}'**
  String ssdtMsg516(String arg0);

  /// No description provided for @ssdtMsg517.
  ///
  /// In zh, this message translates to:
  /// **'Failed to initialize ACPI path: {arg0}'**
  String ssdtMsg517(String arg0);

  /// No description provided for @ssdtMsg518.
  ///
  /// In zh, this message translates to:
  /// **'No patch notes'**
  String get ssdtMsg518;

  /// No description provided for @ssdtMsg519.
  ///
  /// In zh, this message translates to:
  /// **'No patch notes'**
  String get ssdtMsg519;

  /// No description provided for @ssdtMsg520.
  ///
  /// In zh, this message translates to:
  /// **'Failed to get patch notes: {arg0}'**
  String ssdtMsg520(String arg0);

  /// No description provided for @ssdtMsg521.
  ///
  /// In zh, this message translates to:
  /// **'Failed to get patch notes'**
  String get ssdtMsg521;

  /// No description provided for @ssdtMsg522.
  ///
  /// In zh, this message translates to:
  /// **'{arg0} Clear configuration path'**
  String ssdtMsg522(String arg0);

  /// No description provided for @ssdtMsg523.
  ///
  /// In zh, this message translates to:
  /// **'{arg0} selected an invalid file: {arg1}'**
  String ssdtMsg523(String arg0, String arg1);

  /// No description provided for @ssdtMsg524.
  ///
  /// In zh, this message translates to:
  /// **'No patch configuration found for {arg0}'**
  String ssdtMsg524(String arg0);

  /// No description provided for @ssdtMsg525.
  ///
  /// In zh, this message translates to:
  /// **'Please select the SSDT that needs to be customized before proceeding!'**
  String get ssdtMsg525;

  /// No description provided for @ssdtMsg526.
  ///
  /// In zh, this message translates to:
  /// **'Failed to execute patch: {arg0}'**
  String ssdtMsg526(String arg0);

  /// No description provided for @ssdtMsg527.
  ///
  /// In zh, this message translates to:
  /// **'Failed to execute patch [{arg0}]: {arg1}'**
  String ssdtMsg527(String arg0, String arg1);

  /// No description provided for @ssdtMsg528.
  ///
  /// In zh, this message translates to:
  /// **'SSDT is being generated, please do not repeat the operation!'**
  String get ssdtMsg528;

  /// No description provided for @ssdtMsg529.
  ///
  /// In zh, this message translates to:
  /// **'The patch list is empty!'**
  String get ssdtMsg529;

  /// No description provided for @ssdtMsg530.
  ///
  /// In zh, this message translates to:
  /// **'Extraction is in progress, please do not repeat the operation!'**
  String get ssdtMsg530;

  /// No description provided for @ssdtMsg531.
  ///
  /// In zh, this message translates to:
  /// **'The ACPI table extracted by the current {arg0} platform is very likely to be contaminated by ACPI patches injected by OpenCore and others. It is strongly recommended to operate on the Windows/Linux platform!'**
  String ssdtMsg531(String arg0);

  /// No description provided for @ssdtMsg532.
  ///
  /// In zh, this message translates to:
  /// **'Failed to extract ACPI!'**
  String get ssdtMsg532;

  /// No description provided for @ssdtMsg533.
  ///
  /// In zh, this message translates to:
  /// **'Extraction of ACPI successful!'**
  String get ssdtMsg533;

  /// No description provided for @ssdtMsg534.
  ///
  /// In zh, this message translates to:
  /// **'Failed to prepare patch: {arg0}'**
  String ssdtMsg534(String arg0);

  /// No description provided for @ssdtMsg535.
  ///
  /// In zh, this message translates to:
  /// **'Failed to load DSDT/ACPI: {arg0}'**
  String ssdtMsg535(String arg0);

  /// No description provided for @ssdtMsg536.
  ///
  /// In zh, this message translates to:
  /// **'The config.plist file does not exist: {arg0}'**
  String ssdtMsg536(String arg0);

  /// No description provided for @ssdtMsg537.
  ///
  /// In zh, this message translates to:
  /// **'Unrecognized plist file format'**
  String get ssdtMsg537;

  /// No description provided for @ssdtMsg538.
  ///
  /// In zh, this message translates to:
  /// **'The config.plist type is \"{arg0}\"'**
  String ssdtMsg538(String arg0);

  /// No description provided for @ssdtMsg539.
  ///
  /// In zh, this message translates to:
  /// **'Failed to parse plist type: {arg0}'**
  String ssdtMsg539(String arg0);

  /// No description provided for @ssdtMsg540.
  ///
  /// In zh, this message translates to:
  /// **'Please select the ACPIs directory first!'**
  String get ssdtMsg540;

  /// No description provided for @ssdtMsg541.
  ///
  /// In zh, this message translates to:
  /// **'Please select the config.plist file in the EFI directory first!'**
  String get ssdtMsg541;

  /// No description provided for @ssdtMsg542.
  ///
  /// In zh, this message translates to:
  /// **'Invalid ACPI path: {arg0}'**
  String ssdtMsg542(String arg0);

  /// No description provided for @ssdtMsg543.
  ///
  /// In zh, this message translates to:
  /// **'The config.plist file does not exist: {arg0}'**
  String ssdtMsg543(String arg0);

  /// No description provided for @ssdtMsg544.
  ///
  /// In zh, this message translates to:
  /// **'Failed to merge plist files: {arg0}'**
  String ssdtMsg544(String arg0);

  /// No description provided for @ssdtMsg545.
  ///
  /// In zh, this message translates to:
  /// **'yes'**
  String get ssdtMsg545;

  /// No description provided for @ssdtMsg546.
  ///
  /// In zh, this message translates to:
  /// **'no'**
  String get ssdtMsg546;

  /// No description provided for @ssdtMsg547.
  ///
  /// In zh, this message translates to:
  /// **'yes'**
  String get ssdtMsg547;

  /// No description provided for @ssdtMsg548.
  ///
  /// In zh, this message translates to:
  /// **'no'**
  String get ssdtMsg548;

  /// No description provided for @ssdtMsg549.
  ///
  /// In zh, this message translates to:
  /// **'yes'**
  String get ssdtMsg549;

  /// No description provided for @ssdtMsg550.
  ///
  /// In zh, this message translates to:
  /// **'no'**
  String get ssdtMsg550;

  /// No description provided for @ssdtMsg551.
  ///
  /// In zh, this message translates to:
  /// **'built-in'**
  String get ssdtMsg551;

  /// No description provided for @ssdtMsg552.
  ///
  /// In zh, this message translates to:
  /// **'remote'**
  String get ssdtMsg552;

  /// No description provided for @ssdtMsg553.
  ///
  /// In zh, this message translates to:
  /// **'New version of iasl'**
  String get ssdtMsg553;

  /// No description provided for @ssdtMsg554.
  ///
  /// In zh, this message translates to:
  /// **'Old version iasl-legacy'**
  String get ssdtMsg554;

  /// No description provided for @ssdtMsg555.
  ///
  /// In zh, this message translates to:
  /// **'yes'**
  String get ssdtMsg555;

  /// No description provided for @ssdtMsg556.
  ///
  /// In zh, this message translates to:
  /// **'no'**
  String get ssdtMsg556;

  /// No description provided for @ssdtMsg557.
  ///
  /// In zh, this message translates to:
  /// **'Preferences'**
  String get ssdtMsg557;

  /// No description provided for @ssdtMsg558.
  ///
  /// In zh, this message translates to:
  /// **'iasl mode'**
  String get ssdtMsg558;

  /// No description provided for @ssdtMsg559.
  ///
  /// In zh, this message translates to:
  /// **'iasl compilation type'**
  String get ssdtMsg559;

  /// No description provided for @ssdtMsg560.
  ///
  /// In zh, this message translates to:
  /// **'Delete decompiled .dsl files'**
  String get ssdtMsg560;

  /// No description provided for @ssdtMsg561.
  ///
  /// In zh, this message translates to:
  /// **'Force compilation'**
  String get ssdtMsg561;

  /// No description provided for @ssdtMsg562.
  ///
  /// In zh, this message translates to:
  /// **'Whether to overwrite the target EFI'**
  String get ssdtMsg562;

  /// No description provided for @ssdtMsg563.
  ///
  /// In zh, this message translates to:
  /// **'ACPI matching mode'**
  String get ssdtMsg563;

  /// No description provided for @ssdtMsg564.
  ///
  /// In zh, this message translates to:
  /// **'core patch'**
  String get ssdtMsg564;

  /// No description provided for @ssdtMsg565.
  ///
  /// In zh, this message translates to:
  /// **'Feature patches'**
  String get ssdtMsg565;

  /// No description provided for @ssdtMsg566.
  ///
  /// In zh, this message translates to:
  /// **'Device patches'**
  String get ssdtMsg566;

  /// No description provided for @ssdtMsg567.
  ///
  /// In zh, this message translates to:
  /// **'dedicated patch'**
  String get ssdtMsg567;

  /// No description provided for @ssdtMsg568.
  ///
  /// In zh, this message translates to:
  /// **'sleep patch'**
  String get ssdtMsg568;

  /// No description provided for @ssdtMsg569.
  ///
  /// In zh, this message translates to:
  /// **'Auxiliary patches'**
  String get ssdtMsg569;

  /// No description provided for @ssdtMsg570.
  ///
  /// In zh, this message translates to:
  /// **'Pre-made patches'**
  String get ssdtMsg570;

  /// No description provided for @ssdtMsg571.
  ///
  /// In zh, this message translates to:
  /// **'Basic patches necessary for normal system startup and power management'**
  String get ssdtMsg571;

  /// No description provided for @ssdtMsg572.
  ///
  /// In zh, this message translates to:
  /// **'Patches that provide additional functionality or fix feature issues'**
  String get ssdtMsg572;

  /// No description provided for @ssdtMsg573.
  ///
  /// In zh, this message translates to:
  /// **'Patches for graphics card hardware'**
  String get ssdtMsg573;

  /// No description provided for @ssdtMsg574.
  ///
  /// In zh, this message translates to:
  /// **'Patches only required on specific motherboards or architectures'**
  String get ssdtMsg574;

  /// No description provided for @ssdtMsg575.
  ///
  /// In zh, this message translates to:
  /// **'Optional, used to fix sleep problems'**
  String get ssdtMsg575;

  /// No description provided for @ssdtMsg576.
  ///
  /// In zh, this message translates to:
  /// **'Not required, but can complete the ACPI structure or enhance compatibility'**
  String get ssdtMsg576;

  /// No description provided for @ssdtMsg577.
  ///
  /// In zh, this message translates to:
  /// **'Select DMAR'**
  String get ssdtMsg577;

  /// No description provided for @ssdtMsg578.
  ///
  /// In zh, this message translates to:
  /// **'Please select the DMAR table that needs to be customized'**
  String get ssdtMsg578;

  /// No description provided for @ssdtMsg579.
  ///
  /// In zh, this message translates to:
  /// **'Select APIC'**
  String get ssdtMsg579;

  /// No description provided for @ssdtMsg580.
  ///
  /// In zh, this message translates to:
  /// **'Please select the APIC table that needs to be customized'**
  String get ssdtMsg580;

  /// No description provided for @ssdtMsg581.
  ///
  /// In zh, this message translates to:
  /// **'Select FACP'**
  String get ssdtMsg581;

  /// No description provided for @ssdtMsg582.
  ///
  /// In zh, this message translates to:
  /// **'Please select FACP form'**
  String get ssdtMsg582;

  /// No description provided for @ssdtMsg583.
  ///
  /// In zh, this message translates to:
  /// **'Select FACP'**
  String get ssdtMsg583;

  /// No description provided for @ssdtMsg584.
  ///
  /// In zh, this message translates to:
  /// **'Please select FACP form'**
  String get ssdtMsg584;

  /// No description provided for @ssdtMsg585.
  ///
  /// In zh, this message translates to:
  /// **'log'**
  String get ssdtMsg585;

  /// No description provided for @ssdtMsg586.
  ///
  /// In zh, this message translates to:
  /// **'clear log'**
  String get ssdtMsg586;

  /// No description provided for @ssdtMsg587.
  ///
  /// In zh, this message translates to:
  /// **'Export log'**
  String get ssdtMsg587;

  /// No description provided for @ssdtMsg588.
  ///
  /// In zh, this message translates to:
  /// **'Pre-made patches'**
  String get ssdtMsg588;

  /// No description provided for @ssdtMsg589.
  ///
  /// In zh, this message translates to:
  /// **'Execute patch'**
  String get ssdtMsg589;

  /// No description provided for @ssdtMsg590.
  ///
  /// In zh, this message translates to:
  /// **'Please select a file/directory'**
  String get ssdtMsg590;

  /// No description provided for @ssdtMsg591.
  ///
  /// In zh, this message translates to:
  /// **'Extract ACPI'**
  String get ssdtMsg591;

  /// No description provided for @ssdtMsg592.
  ///
  /// In zh, this message translates to:
  /// **'output directory'**
  String get ssdtMsg592;

  /// No description provided for @ssdtMsg593.
  ///
  /// In zh, this message translates to:
  /// **'Please select DSDT file or ACPIs directory'**
  String get ssdtMsg593;

  /// No description provided for @ssdtMsg594.
  ///
  /// In zh, this message translates to:
  /// **'Select ACPIs'**
  String get ssdtMsg594;

  /// No description provided for @ssdtMsg595.
  ///
  /// In zh, this message translates to:
  /// **'Merge config'**
  String get ssdtMsg595;

  /// No description provided for @ssdtMsg596.
  ///
  /// In zh, this message translates to:
  /// **'Select config'**
  String get ssdtMsg596;

  /// No description provided for @ssdtMsg597.
  ///
  /// In zh, this message translates to:
  /// **'Please select the config.plist file'**
  String get ssdtMsg597;

  /// No description provided for @ssdtMsg598.
  ///
  /// In zh, this message translates to:
  /// **'Preferences'**
  String get ssdtMsg598;

  /// No description provided for @ssdtMsg599.
  ///
  /// In zh, this message translates to:
  /// **'Platform patches'**
  String get ssdtMsg599;

  /// No description provided for @ssdtMsg600.
  ///
  /// In zh, this message translates to:
  /// **'Patch guide'**
  String get ssdtMsg600;

  /// No description provided for @ssdtMsg601.
  ///
  /// In zh, this message translates to:
  /// **'About the application'**
  String get ssdtMsg601;

  /// No description provided for @ssdtMsg602.
  ///
  /// In zh, this message translates to:
  /// **'{arg0}: {arg1}'**
  String ssdtMsg602(String arg0, String arg1);

  /// No description provided for @ssdtMsg603.
  ///
  /// In zh, this message translates to:
  /// **'Select patch'**
  String get ssdtMsg603;

  /// No description provided for @ssdtMsg604.
  ///
  /// In zh, this message translates to:
  /// **'Desktop'**
  String get ssdtMsg604;

  /// No description provided for @ssdtMsg605.
  ///
  /// In zh, this message translates to:
  /// **'server'**
  String get ssdtMsg605;

  /// No description provided for @ssdtMsg606.
  ///
  /// In zh, this message translates to:
  /// **'SSDT is being generated, please do not repeat the operation!'**
  String get ssdtMsg606;

  /// No description provided for @ssdtMsg607.
  ///
  /// In zh, this message translates to:
  /// **'No SSDT selected'**
  String get ssdtMsg607;

  /// No description provided for @ssdtMsg608.
  ///
  /// In zh, this message translates to:
  /// **'{arg0} {arg1}'**
  String ssdtMsg608(String arg0, String arg1);

  /// No description provided for @ssdtMsg609.
  ///
  /// In zh, this message translates to:
  /// **'{arg0} list: {arg1}'**
  String ssdtMsg609(String arg0, String arg1);

  /// No description provided for @ssdtMsg610.
  ///
  /// In zh, this message translates to:
  /// **'Prefabricated SSDT'**
  String get ssdtMsg610;

  /// No description provided for @ssdtMsg611.
  ///
  /// In zh, this message translates to:
  /// **'Custom SSDT'**
  String get ssdtMsg611;

  /// No description provided for @ssdtMsg612.
  ///
  /// In zh, this message translates to:
  /// **'CPU type:'**
  String get ssdtMsg612;

  /// No description provided for @ssdtMsg613.
  ///
  /// In zh, this message translates to:
  /// **'Platform type:'**
  String get ssdtMsg613;

  /// No description provided for @ssdtMsg614.
  ///
  /// In zh, this message translates to:
  /// **'Desktop'**
  String get ssdtMsg614;

  /// No description provided for @ssdtMsg615.
  ///
  /// In zh, this message translates to:
  /// **'Desktop'**
  String get ssdtMsg615;

  /// No description provided for @ssdtMsg616.
  ///
  /// In zh, this message translates to:
  /// **'notebook'**
  String get ssdtMsg616;

  /// No description provided for @ssdtMsg617.
  ///
  /// In zh, this message translates to:
  /// **'notebook'**
  String get ssdtMsg617;

  /// No description provided for @ssdtMsg618.
  ///
  /// In zh, this message translates to:
  /// **'Mini host'**
  String get ssdtMsg618;

  /// No description provided for @ssdtMsg619.
  ///
  /// In zh, this message translates to:
  /// **'Mini host'**
  String get ssdtMsg619;

  /// No description provided for @ssdtMsg620.
  ///
  /// In zh, this message translates to:
  /// **'server'**
  String get ssdtMsg620;

  /// No description provided for @ssdtMsg621.
  ///
  /// In zh, this message translates to:
  /// **'server'**
  String get ssdtMsg621;

  /// No description provided for @ssdtMsg622.
  ///
  /// In zh, this message translates to:
  /// **'Currently selected SSDT list: {arg0}'**
  String ssdtMsg622(String arg0);

  /// No description provided for @ssdtMsg623.
  ///
  /// In zh, this message translates to:
  /// **'Platform information:'**
  String get ssdtMsg623;

  /// No description provided for @ssdtMsg624.
  ///
  /// In zh, this message translates to:
  /// **'Check all'**
  String get ssdtMsg624;

  /// No description provided for @ssdtMsg625.
  ///
  /// In zh, this message translates to:
  /// **'Core (official recommendation)'**
  String get ssdtMsg625;

  /// No description provided for @ssdtMsg626.
  ///
  /// In zh, this message translates to:
  /// **'Recommend (function fix)'**
  String get ssdtMsg626;

  /// No description provided for @ssdtMsg627.
  ///
  /// In zh, this message translates to:
  /// **'Optional (complete with functions)'**
  String get ssdtMsg627;

  /// No description provided for @ssdtMsg628.
  ///
  /// In zh, this message translates to:
  /// **'Platform information:'**
  String get ssdtMsg628;

  /// No description provided for @ssdtMsg629.
  ///
  /// In zh, this message translates to:
  /// **'Prefabricated SSDT'**
  String get ssdtMsg629;

  /// No description provided for @ssdtMsg630.
  ///
  /// In zh, this message translates to:
  /// **'Custom SSDT'**
  String get ssdtMsg630;

  /// No description provided for @ssdtMsg631.
  ///
  /// In zh, this message translates to:
  /// **'Custom SSDT'**
  String get ssdtMsg631;

  /// No description provided for @ssdtMsg632.
  ///
  /// In zh, this message translates to:
  /// **'Prefabricated SSDT'**
  String get ssdtMsg632;

  /// No description provided for @ssdtMsg633.
  ///
  /// In zh, this message translates to:
  /// **'{arg0} {arg1}'**
  String ssdtMsg633(String arg0, String arg1);

  /// No description provided for @ssdtMsg634.
  ///
  /// In zh, this message translates to:
  /// **'{arg0}{arg1}'**
  String ssdtMsg634(String arg0, String arg1);

  /// No description provided for @ssdtMsg635.
  ///
  /// In zh, this message translates to:
  /// **'{arg0}{arg1}'**
  String ssdtMsg635(String arg0, String arg1);

  /// No description provided for @ssdtMsg636.
  ///
  /// In zh, this message translates to:
  /// **'Visit GitHub'**
  String get ssdtMsg636;

  /// No description provided for @ssdtMsg637.
  ///
  /// In zh, this message translates to:
  /// **'Download now'**
  String get ssdtMsg637;

  /// No description provided for @ssdtMsg638.
  ///
  /// In zh, this message translates to:
  /// **'closure'**
  String get ssdtMsg638;

  /// No description provided for @ssdtMsg639.
  ///
  /// In zh, this message translates to:
  /// **'new version found'**
  String get ssdtMsg639;

  /// No description provided for @ssdtMsg640.
  ///
  /// In zh, this message translates to:
  /// **'Version number:'**
  String get ssdtMsg640;

  /// No description provided for @ssdtMsg641.
  ///
  /// In zh, this message translates to:
  /// **'Release time:'**
  String get ssdtMsg641;

  /// No description provided for @ssdtMsg642.
  ///
  /// In zh, this message translates to:
  /// **'Connection to server timed out'**
  String get ssdtMsg642;

  /// No description provided for @ssdtMsg643.
  ///
  /// In zh, this message translates to:
  /// **'Connection to server timed out'**
  String get ssdtMsg643;

  /// No description provided for @ssdtMsg644.
  ///
  /// In zh, this message translates to:
  /// **'Download canceled'**
  String get ssdtMsg644;

  /// No description provided for @ssdtMsg645.
  ///
  /// In zh, this message translates to:
  /// **'Download canceled'**
  String get ssdtMsg645;

  /// No description provided for @ssdtMsg646.
  ///
  /// In zh, this message translates to:
  /// **'Read response timeout'**
  String get ssdtMsg646;

  /// No description provided for @ssdtMsg647.
  ///
  /// In zh, this message translates to:
  /// **'Read response timeout'**
  String get ssdtMsg647;

  /// No description provided for @ssdtMsg648.
  ///
  /// In zh, this message translates to:
  /// **'An exception occurred while obtaining server information! Status code: {arg0}'**
  String ssdtMsg648(String arg0);

  /// No description provided for @ssdtMsg649.
  ///
  /// In zh, this message translates to:
  /// **'Request failed, status code: {arg0}'**
  String ssdtMsg649(String arg0);

  /// No description provided for @ssdtMsg650.
  ///
  /// In zh, this message translates to:
  /// **'Download timed out, no progress for {arg0} seconds, task canceled'**
  String ssdtMsg650(String arg0);

  /// No description provided for @ssdtMsg651.
  ///
  /// In zh, this message translates to:
  /// **'Log channel does not exist: {arg0}'**
  String ssdtMsg651(String arg0);

  /// No description provided for @ssdtMsg652.
  ///
  /// In zh, this message translates to:
  /// **'Export successful! File path: {arg0}{arg1}{arg2}'**
  String ssdtMsg652(String arg0, String arg1, String arg2);

  /// No description provided for @ssdtMsg653.
  ///
  /// In zh, this message translates to:
  /// **'Export failed! Error message: {arg0}'**
  String ssdtMsg653(String arg0);

  /// No description provided for @ssdtMsg654.
  ///
  /// In zh, this message translates to:
  /// **'File does not exist! Export failed! File path: {arg0}'**
  String ssdtMsg654(String arg0);

  /// No description provided for @ssdtMsg655.
  ///
  /// In zh, this message translates to:
  /// **'Log file initialization failed: {arg0}'**
  String ssdtMsg655(String arg0);

  /// No description provided for @ssdtMsg656.
  ///
  /// In zh, this message translates to:
  /// **'unknown'**
  String get ssdtMsg656;

  /// No description provided for @ssdtMsg657.
  ///
  /// In zh, this message translates to:
  /// **'loosest'**
  String get ssdtMsg657;

  /// No description provided for @ssdtMsg658.
  ///
  /// In zh, this message translates to:
  /// **'length only'**
  String get ssdtMsg658;

  /// No description provided for @ssdtMsg659.
  ///
  /// In zh, this message translates to:
  /// **'Table ID and length, disable normalized headers'**
  String get ssdtMsg659;

  /// No description provided for @ssdtMsg660.
  ///
  /// In zh, this message translates to:
  /// **'Table ID and length, enable normalized headers'**
  String get ssdtMsg660;

  /// No description provided for @ssdtMsg661.
  ///
  /// In zh, this message translates to:
  /// **'Intel 1st generation Arrandale, 2nd generation Sandy Bridge, 3rd generation Ivy Bridge'**
  String get ssdtMsg661;

  /// No description provided for @ssdtMsg662.
  ///
  /// In zh, this message translates to:
  /// **'Intel 4th generation Haswell, 5th generation Broadwell'**
  String get ssdtMsg662;

  /// No description provided for @ssdtMsg663.
  ///
  /// In zh, this message translates to:
  /// **'Intel 6th generation Skylake, 7th generation Kaby Lake, some 4th generation Haswell'**
  String get ssdtMsg663;

  /// No description provided for @ssdtMsg664.
  ///
  /// In zh, this message translates to:
  /// **'Custom brightness, usually used for some non-standard equipment or special needs settings'**
  String get ssdtMsg664;

  /// No description provided for @ssdtMsg665.
  ///
  /// In zh, this message translates to:
  /// **'Custom brightness, usually used for some non-standard equipment or special needs settings'**
  String get ssdtMsg665;

  /// No description provided for @ssdtMsg666.
  ///
  /// In zh, this message translates to:
  /// **'Intel 8th generation CoffeeLake ~ 10th generation, and AMD notebooks'**
  String get ssdtMsg666;

  /// No description provided for @ssdtMsg667.
  ///
  /// In zh, this message translates to:
  /// **'Others (requires custom applbkl-name / applbkl-data device properties), may not be supported'**
  String get ssdtMsg667;

  /// No description provided for @ssdtMsg668.
  ///
  /// In zh, this message translates to:
  /// **'Table does not exist: {arg0}'**
  String ssdtMsg668(String arg0);

  /// No description provided for @ssdtMsg669.
  ///
  /// In zh, this message translates to:
  /// **'Incoming data length is less than 4 bytes: {arg0}'**
  String ssdtMsg669(String arg0);

  /// No description provided for @ssdtMsg670.
  ///
  /// In zh, this message translates to:
  /// **'File content is less than 4 bytes: {arg0}'**
  String ssdtMsg670(String arg0);

  /// No description provided for @ssdtMsg671.
  ///
  /// In zh, this message translates to:
  /// **'Error reading signature: {arg0}, file path: {arg1}'**
  String ssdtMsg671(String arg0, String arg1);

  /// No description provided for @ssdtMsg672.
  ///
  /// In zh, this message translates to:
  /// **'Temporary directory has been created at: {arg0}'**
  String ssdtMsg672(String arg0);

  /// No description provided for @ssdtMsg673.
  ///
  /// In zh, this message translates to:
  /// **'Temporary directory already exists at: {arg0}'**
  String ssdtMsg673(String arg0);

  /// No description provided for @ssdtMsg674.
  ///
  /// In zh, this message translates to:
  /// **'Decompiling {arg0} file...'**
  String ssdtMsg674(String arg0);

  /// No description provided for @ssdtMsg675.
  ///
  /// In zh, this message translates to:
  /// **'Decompiling SSDT.aml files in batches...'**
  String get ssdtMsg675;

  /// No description provided for @ssdtMsg676.
  ///
  /// In zh, this message translates to:
  /// **'Decompiling DSDT.aml and SSDT.aml files in batches...'**
  String get ssdtMsg676;

  /// No description provided for @ssdtMsg677.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompilation failed!'**
  String ssdtMsg677(String arg0);

  /// No description provided for @ssdtMsg678.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompiled successfully!'**
  String ssdtMsg678(String arg0);

  /// No description provided for @ssdtMsg679.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompiled successfully!'**
  String ssdtMsg679(String arg0);

  /// No description provided for @ssdtMsg680.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompiled successfully!'**
  String ssdtMsg680(String arg0);

  /// No description provided for @ssdtMsg681.
  ///
  /// In zh, this message translates to:
  /// **'Decompiling failed .aml files individually...'**
  String get ssdtMsg681;

  /// No description provided for @ssdtMsg682.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompiled successfully!'**
  String ssdtMsg682(String arg0);

  /// No description provided for @ssdtMsg683.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompilation failed!'**
  String ssdtMsg683(String arg0);

  /// No description provided for @ssdtMsg684.
  ///
  /// In zh, this message translates to:
  /// **'Decompiling other .aml files...'**
  String get ssdtMsg684;

  /// No description provided for @ssdtMsg685.
  ///
  /// In zh, this message translates to:
  /// **'=> {arg0} decompiled successfully!'**
  String ssdtMsg685(String arg0);

  /// No description provided for @ssdtMsg686.
  ///
  /// In zh, this message translates to:
  /// **'Note: Try not to include Chinese or special characters in the path or file name, otherwise it may cause unexpected problems!'**
  String get ssdtMsg686;

  /// No description provided for @ssdtMsg687.
  ///
  /// In zh, this message translates to:
  /// **'An error occurred: {arg0}'**
  String ssdtMsg687(String arg0);

  /// No description provided for @ssdtMsg688.
  ///
  /// In zh, this message translates to:
  /// **'An error occurred when processing paths in the getDevicePathsWithId method {arg0}: {arg1}'**
  String ssdtMsg688(String arg0, String arg1);

  /// No description provided for @ssdtMsg689.
  ///
  /// In zh, this message translates to:
  /// **'Skip: {arg0}, which has been decompiled correctly before!'**
  String ssdtMsg689(String arg0);

  /// No description provided for @ssdtMsg690.
  ///
  /// In zh, this message translates to:
  /// **'Target file is in exclude list: {arg0}'**
  String ssdtMsg690(String arg0);

  /// No description provided for @ssdtMsg691.
  ///
  /// In zh, this message translates to:
  /// **'Invalid path: {arg0}'**
  String ssdtMsg691(String arg0);

  /// No description provided for @ssdtMsg692.
  ///
  /// In zh, this message translates to:
  /// **'Invalid path'**
  String get ssdtMsg692;

  /// No description provided for @ssdtMsg693.
  ///
  /// In zh, this message translates to:
  /// **'No valid .aml or .dat file found at {arg0}!'**
  String ssdtMsg693(String arg0);

  /// No description provided for @ssdtMsg694.
  ///
  /// In zh, this message translates to:
  /// **'No valid .aml or .dat file found'**
  String get ssdtMsg694;

  /// No description provided for @ssdtMsg695.
  ///
  /// In zh, this message translates to:
  /// **'Decompilation failed: {arg0}'**
  String ssdtMsg695(String arg0);

  /// No description provided for @ssdtMsg696.
  ///
  /// In zh, this message translates to:
  /// **'The acpidump tool is not ready! Operation terminated!'**
  String get ssdtMsg696;

  /// No description provided for @ssdtMsg697.
  ///
  /// In zh, this message translates to:
  /// **'Exporting ACPI tables...'**
  String get ssdtMsg697;

  /// No description provided for @ssdtMsg698.
  ///
  /// In zh, this message translates to:
  /// **'The current platform does not support it!'**
  String get ssdtMsg698;

  /// No description provided for @ssdtMsg699.
  ///
  /// In zh, this message translates to:
  /// **'Waiting for sudo password authorization...'**
  String get ssdtMsg699;

  /// No description provided for @platformName1000.
  ///
  /// In zh, this message translates to:
  /// **'Generation 0-Penryn-775 platform'**
  String get platformName1000;

  /// No description provided for @platformName1001.
  ///
  /// In zh, this message translates to:
  /// **'Generation 0-Penryn-Notebook'**
  String get platformName1001;

  /// No description provided for @platformName1002.
  ///
  /// In zh, this message translates to:
  /// **'Generation 0-Penryn-mini host'**
  String get platformName1002;

  /// No description provided for @platformName1003.
  ///
  /// In zh, this message translates to:
  /// **'10th Generation-Cascade Lake-X&W-X599 Platform'**
  String get platformName1003;

  /// No description provided for @platformName1004.
  ///
  /// In zh, this message translates to:
  /// **'10th Generation-Comet Lake-1200 Platform'**
  String get platformName1004;

  /// No description provided for @platformName1005.
  ///
  /// In zh, this message translates to:
  /// **'10th Generation-Comet Lake-Laptop'**
  String get platformName1005;

  /// No description provided for @platformName1006.
  ///
  /// In zh, this message translates to:
  /// **'10th generation-Comet Lake-mini host'**
  String get platformName1006;

  /// No description provided for @platformName1007.
  ///
  /// In zh, this message translates to:
  /// **'10th Generation-Ice Lake-Laptop'**
  String get platformName1007;

  /// No description provided for @platformName1008.
  ///
  /// In zh, this message translates to:
  /// **'10th generation-Ice Lake-mini host'**
  String get platformName1008;

  /// No description provided for @platformName1009.
  ///
  /// In zh, this message translates to:
  /// **'11th generation-Rocket Lake-1200 platform'**
  String get platformName1009;

  /// No description provided for @platformName1010.
  ///
  /// In zh, this message translates to:
  /// **'11th Generation-Rocket Lake-Laptop'**
  String get platformName1010;

  /// No description provided for @platformName1011.
  ///
  /// In zh, this message translates to:
  /// **'11th generation-Tiger Lake-mini host'**
  String get platformName1011;

  /// No description provided for @platformName1012.
  ///
  /// In zh, this message translates to:
  /// **'12th generation-Alder Lake-1700 platform'**
  String get platformName1012;

  /// No description provided for @platformName1013.
  ///
  /// In zh, this message translates to:
  /// **'12th generation-Alder Lake-notebook'**
  String get platformName1013;

  /// No description provided for @platformName1014.
  ///
  /// In zh, this message translates to:
  /// **'12th generation-Alder Lake-mini host'**
  String get platformName1014;

  /// No description provided for @platformName1015.
  ///
  /// In zh, this message translates to:
  /// **'13th generation-Raptor Lake-1700 platform'**
  String get platformName1015;

  /// No description provided for @platformName1016.
  ///
  /// In zh, this message translates to:
  /// **'13th generation-Raptor Lake-notebook'**
  String get platformName1016;

  /// No description provided for @platformName1017.
  ///
  /// In zh, this message translates to:
  /// **'13th generation-Raptor Lake-mini host'**
  String get platformName1017;

  /// No description provided for @platformName1018.
  ///
  /// In zh, this message translates to:
  /// **'14th generation-Raptor Lake-1700 platform'**
  String get platformName1018;

  /// No description provided for @platformName1019.
  ///
  /// In zh, this message translates to:
  /// **'14th generation-Raptor Lake-notebook'**
  String get platformName1019;

  /// No description provided for @platformName1020.
  ///
  /// In zh, this message translates to:
  /// **'14th generation-Raptor Lake-mini host'**
  String get platformName1020;

  /// No description provided for @platformName1021.
  ///
  /// In zh, this message translates to:
  /// **'15th Generation-Arrow Lake-1851 Platform'**
  String get platformName1021;

  /// No description provided for @platformName1022.
  ///
  /// In zh, this message translates to:
  /// **'15th generation-Arrow Lake-notebook'**
  String get platformName1022;

  /// No description provided for @platformName1023.
  ///
  /// In zh, this message translates to:
  /// **'15th generation-Arrow Lake-mini host'**
  String get platformName1023;

  /// No description provided for @platformName1024.
  ///
  /// In zh, this message translates to:
  /// **'Generation 1-Arrandale-Notebook'**
  String get platformName1024;

  /// No description provided for @platformName1025.
  ///
  /// In zh, this message translates to:
  /// **'Generation 1-Arrandale-mini host'**
  String get platformName1025;

  /// No description provided for @platformName1026.
  ///
  /// In zh, this message translates to:
  /// **'Generation 1-Lynnfield-1156 Platform'**
  String get platformName1026;

  /// No description provided for @platformName1027.
  ///
  /// In zh, this message translates to:
  /// **'Generation 1-Nehalem&Westmere-X58 platform'**
  String get platformName1027;

  /// No description provided for @platformName1028.
  ///
  /// In zh, this message translates to:
  /// **'2nd generation-Sandy Bridge-1155 platform'**
  String get platformName1028;

  /// No description provided for @platformName1029.
  ///
  /// In zh, this message translates to:
  /// **'2nd generation-Sandy Bridge-E-X79 platform'**
  String get platformName1029;

  /// No description provided for @platformName1030.
  ///
  /// In zh, this message translates to:
  /// **'2nd generation-Sandy Bridge-notebook'**
  String get platformName1030;

  /// No description provided for @platformName1031.
  ///
  /// In zh, this message translates to:
  /// **'2nd generation-Sandy Bridge-mini host'**
  String get platformName1031;

  /// No description provided for @platformName1032.
  ///
  /// In zh, this message translates to:
  /// **'3rd generation-Ivy Bridge-1155 platform'**
  String get platformName1032;

  /// No description provided for @platformName1033.
  ///
  /// In zh, this message translates to:
  /// **'3rd generation-Ivy Bridge-E-X79 platform'**
  String get platformName1033;

  /// No description provided for @platformName1034.
  ///
  /// In zh, this message translates to:
  /// **'3rd generation-Ivy Bridge-notebook'**
  String get platformName1034;

  /// No description provided for @platformName1035.
  ///
  /// In zh, this message translates to:
  /// **'3rd generation-Ivy Bridge-mini host'**
  String get platformName1035;

  /// No description provided for @platformName1036.
  ///
  /// In zh, this message translates to:
  /// **'4th generation-Haswell-1150 platform'**
  String get platformName1036;

  /// No description provided for @platformName1037.
  ///
  /// In zh, this message translates to:
  /// **'4th generation-Haswell-E-X99 platform'**
  String get platformName1037;

  /// No description provided for @platformName1038.
  ///
  /// In zh, this message translates to:
  /// **'4th Generation-Haswell-Laptop'**
  String get platformName1038;

  /// No description provided for @platformName1039.
  ///
  /// In zh, this message translates to:
  /// **'4th generation-Haswell-mini host'**
  String get platformName1039;

  /// No description provided for @platformName1040.
  ///
  /// In zh, this message translates to:
  /// **'5th generation-Broadwell-1150 platform'**
  String get platformName1040;

  /// No description provided for @platformName1041.
  ///
  /// In zh, this message translates to:
  /// **'5th generation-Broadwell-E-X99 platform'**
  String get platformName1041;

  /// No description provided for @platformName1042.
  ///
  /// In zh, this message translates to:
  /// **'5th generation-Broadwell-notebook'**
  String get platformName1042;

  /// No description provided for @platformName1043.
  ///
  /// In zh, this message translates to:
  /// **'5th generation-Broadwell-mini host'**
  String get platformName1043;

  /// No description provided for @platformName1044.
  ///
  /// In zh, this message translates to:
  /// **'6th generation-Skylake-1151 platform'**
  String get platformName1044;

  /// No description provided for @platformName1045.
  ///
  /// In zh, this message translates to:
  /// **'6th generation-Skylake-X&W-X299 platform'**
  String get platformName1045;

  /// No description provided for @platformName1046.
  ///
  /// In zh, this message translates to:
  /// **'6th generation-Skylake-notebook'**
  String get platformName1046;

  /// No description provided for @platformName1047.
  ///
  /// In zh, this message translates to:
  /// **'6th generation-Skylake-mini host'**
  String get platformName1047;

  /// No description provided for @platformName1048.
  ///
  /// In zh, this message translates to:
  /// **'7th Generation-Kaby Lake-1151 Platform'**
  String get platformName1048;

  /// No description provided for @platformName1049.
  ///
  /// In zh, this message translates to:
  /// **'7th Generation-Kaby Lake-Notebook'**
  String get platformName1049;

  /// No description provided for @platformName1050.
  ///
  /// In zh, this message translates to:
  /// **'7th generation-Kaby Lake-mini host'**
  String get platformName1050;

  /// No description provided for @platformName1051.
  ///
  /// In zh, this message translates to:
  /// **'8th generation-Coffee Lake-1151 platform'**
  String get platformName1051;

  /// No description provided for @platformName1052.
  ///
  /// In zh, this message translates to:
  /// **'8th Generation-Coffee Lake-Notebook'**
  String get platformName1052;

  /// No description provided for @platformName1053.
  ///
  /// In zh, this message translates to:
  /// **'8th generation-Coffee Lake-mini host'**
  String get platformName1053;

  /// No description provided for @platformName1054.
  ///
  /// In zh, this message translates to:
  /// **'9th generation-Coffee Lake-1151 platform'**
  String get platformName1054;

  /// No description provided for @platformName1055.
  ///
  /// In zh, this message translates to:
  /// **'9th Generation-Coffee Lake-Notebook'**
  String get platformName1055;

  /// No description provided for @platformName1056.
  ///
  /// In zh, this message translates to:
  /// **'9th generation-Coffee Lake-mini host'**
  String get platformName1056;

  /// No description provided for @platformName1057.
  ///
  /// In zh, this message translates to:
  /// **'Bulldozer(15h) and Jaguar(16h)'**
  String get platformName1057;

  /// No description provided for @platformName1058.
  ///
  /// In zh, this message translates to:
  /// **'Bulldozer(15h) and Jaguar(16h)-Notebook'**
  String get platformName1058;

  /// No description provided for @platformName1059.
  ///
  /// In zh, this message translates to:
  /// **'Bulldozer(15h) and Jaguar(16h)-mini host'**
  String get platformName1059;

  /// No description provided for @platformName1060.
  ///
  /// In zh, this message translates to:
  /// **'Ryzen and Threadripper(17h and 19h)'**
  String get platformName1060;

  /// No description provided for @platformName1061.
  ///
  /// In zh, this message translates to:
  /// **'Ryzen and Threadripper(17h and 19h)-high-end servers'**
  String get platformName1061;

  /// No description provided for @platformName1062.
  ///
  /// In zh, this message translates to:
  /// **'Ryzen-notebook'**
  String get platformName1062;

  /// No description provided for @platformName1063.
  ///
  /// In zh, this message translates to:
  /// **'Ryzen-mini host'**
  String get platformName1063;

  /// No description provided for @platformName1064.
  ///
  /// In zh, this message translates to:
  /// **'server'**
  String get platformName1064;

  /// No description provided for @platformName1065.
  ///
  /// In zh, this message translates to:
  /// **'notebook'**
  String get platformName1065;

  /// No description provided for @platformName1066.
  ///
  /// In zh, this message translates to:
  /// **'Mini host'**
  String get platformName1066;
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
