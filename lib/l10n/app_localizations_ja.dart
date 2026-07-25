// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'RapidSSDT';

  @override
  String get dumpAcpi => 'ACPI抽出';

  @override
  String get selectAcpisFolder => 'ACPIs選択';

  @override
  String get generateSsdt => 'SSDT生成';

  @override
  String get clearConfig => '設定クリア';

  @override
  String get selectDmar => 'DMAR選択';

  @override
  String get hintDmar => 'カスタマイズするDMAR表を選択してください';

  @override
  String get selectApic => 'APIC選択';

  @override
  String get hintApic => 'カスタマイズするAPIC表を選択してください';

  @override
  String get selectFacp => 'FACP選択';

  @override
  String get hintFacp => 'FACP表を選択してください';

  @override
  String get selectOutputPath => '出力パスを選択';

  @override
  String get oneClickSelect => 'ワンクリック選択';

  @override
  String get clearSelection => '選択クリア';

  @override
  String get about => 'アプリについて';

  @override
  String get checkUpdate => '更新を確認';

  @override
  String get guide => 'ガイド';

  @override
  String get platformPreset => 'プラットフォームプリセット';

  @override
  String get customAcpiOptions => 'カスタムACPIオプション';

  @override
  String get legacyIrqConflict => 'HPET IRQ競合';

  @override
  String get keepOriginalIrq => '元のIRQを保持';

  @override
  String get gpuSpoofModel => '偽装GPUモデル';

  @override
  String get pciPath => 'PCIデバイスパス';

  @override
  String get spoofGpuId => '偽装GPU ID';

  @override
  String get disablePciDevices => 'PCIデバイス無効化';

  @override
  String get brightnessPatch => '画面明るさパッチ(PNLF)';

  @override
  String get usbxPowerProperties => 'USB電源プロパティ(USBX)';

  @override
  String get xosiWindowsVersion => 'XOSI偽装Windowsバージョン';

  @override
  String get language => '言語';

  @override
  String get languagePortugueseBR => 'ポルトガル語 (ブラジル)';

  @override
  String get languagePortuguesePT => 'ポルトガル語 (ポルトガル)';

  @override
  String get languageEnglish => '英語';

  @override
  String get languageChinese => '中国語 (簡体字)';

  @override
  String get languageJapanese => '日本語';

  @override
  String get newVersionFound => '发现新版本';

  @override
  String get versionNumber => '版本号：';

  @override
  String get releaseTime => '发布时间：';

  @override
  String get visitGithub => '访问 GitHub';

  @override
  String get downloadNow => '立即下载';

  @override
  String get close => '关闭';

  @override
  String get log => '日志';

  @override
  String get clearLog => '清除日志';

  @override
  String get exportLog => '导出日志';

  @override
  String get executePatch => '执行补丁';

  @override
  String get mergeConfig => '合并config';

  @override
  String get selectConfig => '选择config';

  @override
  String get hintConfig => '请选择config.plist文件';

  @override
  String get selectPatch => '选择补丁';

  @override
  String get generatingSsdt => '正在生成SSDT，请勿重复操作!';

  @override
  String get noSsdtSelected => '未选择任何 SSDT';

  @override
  String get platformInfo => '平台信息:';

  @override
  String get prebuiltSsdt => '预制SSDT';

  @override
  String get customSsdt => '定制SSDT';

  @override
  String get cpuType => 'CPU类型:';

  @override
  String get platformType => '平台类型:';

  @override
  String get platformDesktop => '台式机';

  @override
  String get platformLaptop => '笔记本';

  @override
  String get platformNuc => '迷你主机';

  @override
  String get platformServer => '服务器';

  @override
  String get checkAll => '勾选所有';

  @override
  String get coreOfficialRec => '核心(官方推荐)';

  @override
  String get recommendedFixes => '推荐(功能修复)';

  @override
  String get optionalEnhancements => '可选(功能完善)';

  @override
  String get builtin => '内置';

  @override
  String get remote => '远程';

  @override
  String get newIasl => '新版iasl';

  @override
  String get oldIasl => '旧版iasl-legacy';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get preferences => '偏好设置';

  @override
  String get iaslMode => 'iasl模式';

  @override
  String get iaslCompileType => 'iasl编译类型';

  @override
  String get deleteDsl => '删除反编译.dsl文件';

  @override
  String get forceCompile => '强制编译';

  @override
  String get overwriteEFI => '是否覆盖目标EFI';

  @override
  String get acpiMatchMode => 'ACPI匹配模式';

  @override
  String get deviceAcpiPath => '设备ACPI路径:';

  @override
  String get disableMethod => '禁用方式:';

  @override
  String get methodOFF => 'OFF方法';

  @override
  String get methodPS3 => 'PS3方法';

  @override
  String get methodIOName => 'IOName方法';

  @override
  String get deviceType => '设备类型:';

  @override
  String get gpuGraphic => 'GPU显卡';

  @override
  String get nvmeSsd => 'NVMe固态硬盘';

  @override
  String get otherPcie => '其他PCIe';

  @override
  String get validDevicePathFormat => '符合要求的设备路径应具有以下格式之一:';

  @override
  String get pciBridgePath => 'PCI桥接路径:';

  @override
  String get add => '添加';

  @override
  String get addedPciList => '已添加PCI列表:';

  @override
  String get delete => '删除';

  @override
  String get usbxPatch => 'USBX 补丁:';

  @override
  String get selectXosiTarget => '选择XOSI的目标系统';

  @override
  String get autoDetectOsid => '不选择则会根据DSDT自动探测OSID版本';

  @override
  String get osidSelection => 'OSID选择:';

  @override
  String get hpetChoiceC => 'C: 仅来自 * 设备冲突IRQ（0,2,8,11）';

  @override
  String get hpetChoiceL => 'L: 仅来自 * 设备使用的IRQ';

  @override
  String get hpetChoiceO => 'O: 来自所有设备冲突IRQ（0,2,8,11）';

  @override
  String get currentLegacyIrqs => '当前 Legacy IRQs:';

  @override
  String get customIrqsDesc =>
      '自定义IRQs,设备之间用空格分隔，IRQ之间用逗号分隔,例如: RTC:0 IPIC:2 TMR:8,11';

  @override
  String get customIrqs => '自定义IRQs:';

  @override
  String get customIrqsExample => '示例: RTC:0 IPIC:2 TMR:8,11';

  @override
  String get customIrqFormatError => '自定义 IRQ 列表格式错误';

  @override
  String get selectGpuToSpoof => '选择需要仿冒的显卡设备';

  @override
  String get unknownGpuModel => '未知显卡型号';

  @override
  String get fakeGpuIdDatabase => '仿冒显卡ID数据库:';

  @override
  String get fakeGpuId => '仿冒显卡ID:';

  @override
  String get example73BF => '例如: 73BF';

  @override
  String get require4HexChars => '需要4位十六进制字符';

  @override
  String get fakeGpuName => '仿冒显卡名称:';

  @override
  String get optionalGpuName => '选填项,显卡名称';

  @override
  String get fillAcpiPath => '填写ACPI路径';

  @override
  String get fillPciPath => '填写PCI路径';

  @override
  String get invalidAcpiPath => '无效ACPI路径';

  @override
  String get invalidPciPath => '无效PCI路径';

  @override
  String get imeiNotSpoofed => '未启用仿冒IMEI, ';

  @override
  String get imeiSpoofedValue => '启用仿冒IMEI: ';

  @override
  String get applicableTo => '适用于';

  @override
  String get sandyBridge7Series => '搭配 7 系列芯片组的 Sandy Bridge CPU';

  @override
  String get ivyBridge6Series => '搭配 6 系列芯片组的 Ivy Bridge CPU';

  @override
  String get devicePropertiesDeviceId => '需要使用 DeviceProperties 设置device-id';

  @override
  String get imeiPatch => 'IMEI 补丁:';

  @override
  String get selectPnlfUid => '为PNLF选择UID';

  @override
  String get suggestIgpuPath => '当选择UID=14时,建议补充IGPU ACPI路径';

  @override
  String get uidType => 'UID类型:';

  @override
  String get requiredField => '必填项';

  @override
  String get invalidUid => 'UID值无效';

  @override
  String get supplementIgpuRegisters => '是否补充IGPU寄存器信息';

  @override
  String get suggestIgpuRegisters => '当选择UID=14时,建议开启。如果不开启,可能会遇到最大亮度受限或其他问题';

  @override
  String get remark_ssdtHPET => '消除IRQ冲突,通常用于声卡修复';

  @override
  String get note_ssdtHPET =>
      '•\tHPET(High Precision Event Timer,高精度事件计时器)是用于系统定时的硬件模块。\n•\t在 macOS 下,一些主板的 HPET 设备可能会导致 IRQ(中断请求)冲突，进而影响音频设备的正常工作,导致系统不稳定、甚至无法启动。\n•\t该补丁通过调整 HPET 相关的 ACPI 设备定义，避免 IRQ 冲突，确保 macOS 能够正确使用 HPET 计时器，修复声卡问题,提高系统稳定性等。';

  @override
  String get remark_ssdtECUSBXDesktop => '仿冒EC并注入USB电源属性(适用于Intel 6代及以上台式机)';

  @override
  String get note_ssdtECUSBXDesktop =>
      '•\t适用于Intel 6代及以上台式机\n•\t该补丁会禁用系统原有 EC 设备,然后创建一个虚拟的 EC 设备，以“欺骗” macOS 认为存在一个兼容的 EC，从而解决因 EC 设备缺失导致的启动问题。 \n•\t添加必要的USB电源属性以修复潜在的问题。等同于合并: SSDT-EC-DESKTOP.aml + SSDT-USBX.aml';

  @override
  String get remark_ssdtECUSBXLaptop =>
      '仅仿冒EC,不影响现有EC，同时注入USB电源属性(适用于Intel 6代及以上笔记本）';

  @override
  String get note_ssdtECUSBXLaptop =>
      '•\t适用于Intel 6代及以上笔记本\n•\t适用于笔记本,它不会删除或修改现有的 EC,而是单独创建一个新的虚拟 EC，避免破坏原始 EC 设备，防止可能导致笔记本电源管理、键盘背光等功能异常。\n•\t添加必要的USB电源属性以修复潜在的问题。等同于合并: SSDT-EC-LAPTOP.aml + SSDT-USBX.aml';

  @override
  String get remark_ssdtECDesktop => '仿冒EC(适用于Intel 5代及以下台式机)';

  @override
  String get note_ssdtECDesktop =>
      '•\t适用于Intel 5代及以下台式机\n•\t该补丁会禁用系统原有 EC 设备,然后创建一个虚拟的 EC 设备，以“欺骗” macOS 认为存在一个兼容的 EC，从而解决因 EC 设备缺失导致的启动问题。';

  @override
  String get remark_ssdtECLaptop => '仅仿冒EC,不影响现有EC(适用于Intel 5代及以下笔记本）';

  @override
  String get note_ssdtECLaptop =>
      '•\t适用于Intel 5代及以下笔记本\n•\t它不会删除或修改现有的 EC,而是单独创建一个新的虚拟 EC，避免破坏原始 EC 设备，防止可能导致笔记本电源管理、键盘背光等功能异常。';

  @override
  String get remark_ssdtUSBX => 'USB电源属性修正(适用于Intel 6代及更新平台)';

  @override
  String get note_ssdtUSBX =>
      '•\t适用于Intel Skylake 6代及以上, 服务器Haswell-E 4代及以上，AMD Ryzen等平台\n•\t从 Intel Skylake 及更新的处理器开始，macOS 需要特定的 USB 电源属性，以确保 USB 设备能够正确供电和识别。\n•\t该补丁修正 USB 端口的电源管理，使其符合 macOS 要求，解决 USB 设备识别异常、供电不足、无法热插拔等问题。\n•\t对于笔记本: SSDT-EC-LAPTOP.aml + SSDT-USBX.aml 两者合并等同于 SSDT-EC-USBX-LAPTOP.aml\n•\t对于台式机: SSDT-EC-DESKTOP.aml + SSDT-USBX.aml 两者合并等同于 SSDT-EC-USBX-DESKTOP.aml';

  @override
  String get remark_ssdtPLUG => 'CPU核心识别,启用频率调节与节能修正';

  @override
  String get note_ssdtPLUG =>
      '•\tSSDT-PLUG 适用于Intel Haswell 4代 ~ 11代, 服务器Haswell-E 4代及以上平台 (定制SSDT-PLUG时,工具自动检测生成!)\n•\tSSDT-PLUG-ALT 适用于Intel Alder Lake 12代及以上,以及AMD Ryzen平台 (定制SSDT-PLUG时,工具自动检测生成并更名为SSDT-PLUG-ALT!)\n•\tmacOS 依赖 CPU 电源管理插件（PluginType）来调节 CPU 频率，提高能效和续航。\n•\t该补丁会修改 CPU 定义，使 macOS 认为它是 Apple 设备所需的 plugin-type = 1 处理器，从而正确加载 CPU 变频管理，提高性能和功耗控制。';

  @override
  String get remark_ssdtPMC => '启用NVRAM支持(通常适用于Intel原生300系列主板)';

  @override
  String get note_ssdtPMC =>
      '•\t适用于Intel Coffee Lake 8代 ~ 9代平台\n•\t原生 300 系列主板（如 Z370、B360）在 macOS 下可能无法正确使用 NVRAM，导致部分功能（如 iMessage、音量记忆、引导参数等）无法保存。\n•\t该补丁启用主板的 PMC（Power Management Controller，电源管理控制器），让 macOS 正常使用原生 NVRAM，而无需额外的 EmuVariableUEFI 驱动。';

  @override
  String get remark_ssdtPNLF => '添加PNLF设备以提供背光支持(仅适用于笔记本和一体机)';

  @override
  String get note_ssdtPNLF =>
      '•\tmacOS 需要 PNLF 设备（Panel Brightness）才能正确控制笔记本屏幕的亮度。\n•\t该补丁会在 ACPI 中创建一个 PNLF 设备,使 macOS 能够调节屏幕亮度，并在系统偏好设置中显示亮度控制选项。\n•\t适用于笔记本和部分一体机,解决亮度调节不可用的问题。\n•\tUID = 14, 适用于: Intel第1代Arrandale,第2代Sandy Bridge,第3代Ivy Bridge \n  注意:有些机器使用UID: 14 会遇到最大亮度受限或其他问题.为了解决这些问题,必须设置正确的 iGPU（集成显卡）的设备路径，并且可能需要补充IGPU寄存器信息\n•\tUID = 15, 适用于: Intel第4代Haswell,第5代Broadwell\n•\tUID = 16, 适用于: Intel第6代Skylake,第7代Kaby Lake, 某些第4代Haswell\n•\tUID = 17, 适用于: 自定义亮度,通常用于一些非标准设备或特殊需求的 Hackintosh（黑苹果）设置\n•\tUID = 18, 适用于: 自定义亮度,通常用于一些非标准设备或特殊需求的 Hackintosh（黑苹果）设置\n•\tUID = 19, 适用于: Intel第8代CoffeeLake及以上,10代以下,以及AMD笔记本\n•\tUID = 99, 适用于: 其他（需要自定义 applbkl-name / applbkl-data 设备属性）,可能根本无法正常工作';

  @override
  String get remark_ssdtALS0 => '提供屏幕背光调节所需的传感器支持(仅适用于笔记本和一体机)';

  @override
  String get note_ssdtALS0 =>
      '•\t用于模拟和启用 Apple 原生传感器(光线传感器 Ambient Light Sensor,简称ALS)功能,以实现自动调节屏幕亮度\n•\t如果你的设备真的有ALS(如某些高端笔记本),并且存在问题,可以尝试添加SSDT-ALS0来修正自动亮度调节功能,否则不建议添加\n•\t适用范围：仅限一体机 (AIO) 和笔记本电脑';

  @override
  String get remark_ssdtXOSI => 'macOS伪装成Windows,解锁被屏蔽的设备(如I2C触摸板)';

  @override
  String get note_ssdtXOSI =>
      '•\t_OSI（Operating System Interface）是 ACPI 的一个方法，允许操作系统报告自己支持哪些功能。\n•\t一些主板固件可能会根据 _OSI 返回值来决定是否启用某些设备，而 macOS 可能不被识别，从而导致功能缺失。\n•\t该补丁会“欺骗”固件，使其认为 macOS 也是 Windows，从而激活隐藏的功能，如：I2C 触摸板、电池管理等。';

  @override
  String get remark_ssdtRHUB => 'USB端口重置与修正';

  @override
  String get note_ssdtRHUB =>
      '•\t某些OEM违反了ACPI规范，这导致在启动macOS时出现问题。为了解决这个问题，需要关闭RHUB设备，并强制macOS手动重建端口。\n•\t该补丁在 macOS 启动时重置 USB 控制器(包括EHC1,EHC2等USB设备屏蔽和更名),使得所有 USB 端口可以正确识别,并配合 USB 映射（如:UTBMap.kext）使用,以确保 USB 设备正常工作。\n• 通常适用于桌面端400系主板(华硕等)以及移动端IceLake平台(戴尔,联想等)。';

  @override
  String get remark_ssdtBridge => '为缺失的 PCI 设备路径创建桥接';

  @override
  String get note_ssdtBridge =>
      '•\t一些主板或设备的 PCI 设备路径可能在 macOS 下无法正确识别，导致设备无法正常工作，例如: 显卡、声卡、无线网卡等。\n•\t该补丁会为这些设备创建正确的 PCI 桥接，确保 macOS 能够正确识别并使用这些 PCI 设备。';

  @override
  String get remark_ssdtDMAR => '移除DMAR保留内存区域,修复系统启动问题,网卡兼容性问题';

  @override
  String get note_ssdtDMAR =>
      '•\tDMAR（DMA Remapping Table）是 Intel VT-d 虚拟化技术的一部分，用于 IOMMU（输入输出内存管理单元）支持。\n•\t该补丁会移除 DMAR 表中导致问题的保留内存区域，从而避免 macOS 误读 DMAR 导致系统无法启动。\n•\t为 VT-d 兼容性提供支持，让 VT-d 在 macOS Big Sur 及更新版本中正常工作，尤其是涉及使用 DriverKit 驱动的硬件。\n•\tmacOS 支持 VT-d，但某些主板或 BIOS 提供的 DMAR 表存在兼容性问题，可能导致 macOS 在解析 ACPI DMAR 表时内核崩溃、卡启动、系统不稳定等问题(卡在 AppleACPICPU、IOPCI、AppleVTD 相关日志位置)。\n•\t支持的硬件范围： I225 网卡、Aquantia 网卡、部分 WiFi 设备等。\n•\t需在固件中 Drop 掉原有 DMAR 表，才能加载修补后的表。\n•\t适用 CPU： 任何支持 VT-d 技术的处理器。';

  @override
  String get remark_ssdtAPIC => '修正APIC表,解决CPU内核panic问题(适用于HEDT服务器平台)';

  @override
  String get note_ssdtAPIC =>
      '•\t修复或重写 APIC 表中的 Processor ID,确保 macOS 能正确识别 CPU 核心数量和编号,避免内核 panic 或核心识别错误。\n•\t需在固件中 Drop 掉原有 APIC 表，才能加载修补后的表。\n•\t适用于X58, X79, X99, X299 等 Intel 服务器(HEDT)平台。';

  @override
  String get remark_ssdtSBUSMCHC => '添加系统总线SMBus支持';

  @override
  String get note_ssdtSBUSMCHC =>
      '•\tmacOS 需要 SMBus（System Management Bus） 设备才能正确运行某些服务，如：\n  I2C 触摸板，电池管理，光感自动亮度调节，某些 Wi-Fi / 蓝牙设备\n•\tSSDT-SBUS-MCHC 通过在 ACPI 中添加 SBUS（系统管理总线）和 MCHC（内存控制器）设备，使 macOS 认为这是一个原生的 Apple 设备，确保相关功能正常工作。\n•\t如果设备 I2C 触摸板、电池信息、自动亮度调节无法使用，可以尝试启用该补丁。';

  @override
  String get remark_ssdtIMEI => '修复核显加速失败问题(通常适用于Ivy Bridge和 Sandy Bridge)';

  @override
  String get note_ssdtIMEI =>
      '•\tIntel Management Engine(简称IMEI)是用于连接管理引擎的硬件接口,只有在旧平台(Sandy/Ivy)和某些主板缺少 MEI/IMEI/HECI 设备时才需要\n•\t适用于Intel第3代Ivy Bridge处理器,6系主板混合时(例如：i3 3225处理器，H61主板),核显加速问题\n•\t适用于Intel第2代Sandy Bridge处理器,7系主板混合时(例如：i5 2500k处理器，B75主板),核显加速问题\n•\tIntel第3代Ivy Bridge处理器搭配7系主板,以及Intel第2代Sandy Bridge处理器搭配6系主板,不需要此SSDT!\n• Intel第4代Haswell及更新平台,通常能正确实现 MEI/IMEI/HECI 设备,不需要此SSDT!';

  @override
  String get remark_ssdtFixShutdown => '修复关机变重启或关机不断电问题';

  @override
  String get note_ssdtFixShutdown =>
      '•\t修复某些主板在macOS执行关机（S5）时，有时不会完全关闭 USB 控制器电源导致无法正常关机问题(关机变重启或关机不断电)\n•\t需要搭配 ACPI 重命名补丁： _PTS -> ZPTS';

  @override
  String get remark_checkSystemState => '检查当前系统状态,主要查看是否支持S3睡眠(非定制SSDT)';

  @override
  String get note_checkSystemState =>
      '•\t检查当前机器是否为AOAC机器(非定制SSDT)\n•\t检查当前BIOS设置中系统状态,主要查看是否支持S3睡眠(非定制SSDT)\n•\t注意:非AOAC机器才兼容S3睡眠,AOAC机器与S3睡眠冲突,不支持S3睡眠!\n•\t如果非AOAC机器(AOAC机器不支持S3睡眠,不用往下看)检查结果显示系统状态不支持S3睡眠,可能存在如下几种情况:\n  1. 主板固件支持S3睡眠,但是BIOS设置中未开启S3睡眠,开启后可支持S3睡眠\n  2. 主板固件物理未阉割 S3,只是 DSDT 未定义 _S3 方法,补全 _S3 方法有概率修复 S3 睡眠问题\n  3. 主板固件物理阉割 S3,完全不支持S3睡眠,就算补全 _S3 方法,也无法修复 S3 睡眠问题';

  @override
  String get remark_checkAOAC => '检查当前是否为AOAC机器(非定制SSDT)';

  @override
  String get note_checkAOAC =>
      '•\t根据FACP.aml检查当前是否为AOAC机器(非定制SSDT)\n•\t注意:非AOAC机器才兼容S3睡眠,AOAC机器与S3睡眠冲突,不支持S3睡眠!AOAC机器常见于笔记本\n•\tAOAC机器一旦进入S3睡眠,可能出现：睡眠后无法被唤醒，呈现死机状态，只能强制关机。建议禁用S3睡眠。\n•\tAOAC机器建议考虑如下解决方案:\n  1. 解锁BIOS,禁用AOAC(通常很难办到,但是最稳定)\n  2. 禁用S3睡眠 (在BIOS中禁用S3睡眠,或者SSDT-S3-DISABLE禁用S3睡眠)\n  3. 关闭独显供电电源\n  4. 使用 NVMeFix.kext 开启 SSD 的 APST\n  5. 启用 ASPM（BIOS 高级选项启用ASPM,SSDT 补丁启用 L1）';

  @override
  String get remark_ssdtGPRW => '修复由于USB控制器导致睡眠即醒问题';

  @override
  String get note_ssdtGPRW =>
      '•\t将GPRW重命名为XPRW,修复即时唤醒问题(注意:可能导致USB键盘无法唤醒设备,可以通过电源键唤醒)\n•\tSSDT-GPRW比较常用,因为绝大多数平台都是GPRW方法,极少数平台提供并使用UPRW方法\n•\t适用于Skylake及更新平台';

  @override
  String get remark_ssdtUPRW => '修复由于USB控制器导致睡眠即醒问题';

  @override
  String get note_ssdtUPRW =>
      '•\t将GPRW重命名为XPRW,修复即时唤醒问题(注意:可能导致USB键盘无法唤醒设备,可以通过电源键唤醒)\n•\t很少用到SSDT-UPRW,因为绝大多数平台都是GPRW方法,极少数平台提供并使用UPRW方法\n•\t适用于Skylake及更新平台';

  @override
  String get remark_ssdtLID => '修复睡眠按键睡眠问题(适用于笔记本)';

  @override
  String get note_ssdtLID =>
      '•\t某些电脑通过睡眠按键SLPB（PNP0C0E） 进入睡眠时,由于 ACPI 传递错误参数,导致 macOS 误认为是关机,可能导致:直接重启,睡眠后崩溃,或者睡眠成功但系统状态损坏\n•\t在按下睡眠键时伪装“盖子合上”，把危险的 PNP0C0E 睡眠强制转换成安全稳定的 PNP0C0D 睡眠\n•\t通常适用于笔记本电脑';

  @override
  String get remark_ssdtWakeScreen => '修复唤醒后需按任意键亮屏问题';

  @override
  String get note_ssdtWakeScreen => '•\t修复某些机器唤醒后需按任意键才能亮屏的问题';

  @override
  String get remark_ssdtLED => '修复唤醒后电源键呼吸灯异常问题(适用于联想笔记本)';

  @override
  String get note_ssdtLED =>
      '•\t修复某些联想笔记本唤醒后 A 面呼吸灯和电源键呼吸灯未恢复正常的问题\n•\t修复某些联想笔记本上唤醒后 F4 麦克风指示灯状态不正常的问题\n•\t主要适用于联想系列笔记本,其他品牌笔记本通常不适用';

  @override
  String get remark_ssdtS3Disable => '禁用系统 S3 睡眠状态(修复S3睡眠唤醒崩溃,重启或关机问题)';

  @override
  String get note_ssdtS3Disable =>
      '•\t仅禁用macOS系统下 S3 睡眠状态,避免macOS系统唤醒时出现系统崩溃、重启或关机\n•\t禁用后,仅macOS不再支持S3睡眠(点击睡眠按钮或者显示器进入节能模式,屏幕关闭,但是主机仍然会运行,风扇也不会停止运转)\n•\t禁用macOS系统下 S3 睡眠状态后,不再需要修改macOS任何系统设置,可以不用关闭节能模式(在此之前,你可能需要修改系统设置->不活跃时关闭显示器->永不)\n•\t适用场景:在没有修复睡眠问题时,macOS系统设置里节能模式开启(\"不活跃时关闭显示器->10分钟\"),系统进入睡眠状态后,当唤醒macOS系统,可能出现系统崩溃、重启或关机.此时可以禁用S3睡眠状态,即可修复该问题.\n•\t需要搭配 ACPI 重命名补丁： _S3 -> XS3';

  @override
  String get remark_ssdtFACP => '热重启修改为冷重启,修复部分硬件不可用的问题';

  @override
  String get note_ssdtFACP =>
      '•\t热重启修改为冷重启，修复部分平台从Windows重启到macOS后,导致部分硬件不可用的问题。(比如：声卡,WiFi,蓝牙)\n•\t注意: 没有SSDT-FACP.aml生成! 只生成ACPI - Patch补丁!';

  @override
  String get remark_ssdtGPUSPOOF => '仿冒显卡';

  @override
  String get note_ssdtGPUSPOOF =>
      '•\t仅适用于AMD 显卡,SSDT-GPU-SPOOF 通过修改 macOS 读取的设备 ID，让 macOS 误以为该显卡是支持的型号，从而启用加速功能。\n•\t常见需要仿冒的显卡型号：\n  • AMD Radeon RX 550 Lexa 核心  \n  • AMD Radeon RX 6650XT, RX 6950XT等';

  @override
  String get remark_ssdtPCIDISABLE => '屏蔽PCI设备,包括不支持的显卡、NVMe固态硬盘等';

  @override
  String get note_ssdtPCIDISABLE =>
      '•\t常见3种方法(OFF,PS3,IOName都可以屏蔽),屏蔽不支持的PCIe 设备,包括不支持的显卡、NVMe固态硬盘、无线网卡等,方法优先顺序: OFF > PS3 > IOName\n•\tSSDT-GPU-DISABLE-OFF (适用于笔记本,台式机一般不提供OFF方法)通过在 ACPI 层面禁用独立显卡,可以做到macOS 系统完全检测不到独显,独显处于停止供电状态,从而节省功耗并降低温度。\n•\tSSDT-GPU-DISABLE-PS3 (适用于笔记本,台式机一般不提供PS3方法) 通过在 ACPI 层面禁用独立显卡,可以做到macOS 系统独显在S3 睡眠状态下停止供电,从而节省功耗并降低温度。\n•\tSSDT-GPU-DISABLE-IOName (适用于所有平台) 修改显卡设备ID,macOS 系统仍然会检测到显卡,只是不加载对应显卡驱动,显卡处于未驱动状态,因此存在一定功耗。\n•\t笔记本原始ACPI表不存在OFF,PS3方法时,对应的SSDT-GPU-DISABLE-OFF,SSDT-GPU-DISABLE-PS3方法屏蔽会失败,建议退而求其次,使用IOName方法屏蔽PCI设备';

  @override
  String get remark_ssdtRMNE => '仿冒有线网卡设备(适用于没有有线网卡的笔记本)';

  @override
  String get note_ssdtRMNE =>
      '•\t为Hackintosh系统提供NullEthernet仿冒虚拟网卡，用于解决 iMessage、Facetime、iCloud 等 Apple 服务对内建网络设备的依赖';

  @override
  String get remark_ssdtGPI0 => '修复笔记本I2C触摸板问题(适用于笔记本)';

  @override
  String get note_ssdtGPI0 =>
      '•\t通过修复ACPI硬件节点挂载,确保在macOS系统启用该设备,修复部分I2C触控板无法正常识别问题\n•\tSSDT-GPI0 解决驱动挂载硬件设备问题,SSDT-XOSI 主要用于修复 BIOS/ACPI 初始化逻辑与操作系统识别不兼容的问题(某些时候可以修复触控板问题)';

  @override
  String get remark_ssdtCPUR => 'B850,B650,B550,A520芯片组的CPU重命名(仅适用于Ryzen平台)';

  @override
  String get note_ssdtCPUR =>
      '•\t适用于B850,B650,B550,A520芯片组的CPU重命名,修复AMD平台无法识别CPU导致的崩溃问题(预制SSDT补丁时才推荐使用)\n•\t定制SSDT补丁时,建议使用定制的SSDT-PLUG即可!(AMD Ryzen平台,在定制SSDT时,自动更名为SSDT-PLUG-ALT)';

  @override
  String get remark_ssdtPLUGALT => '修复电源管理(适用于Intel 12代及以上，部分AMD Ryzen等平台)';

  @override
  String get note_ssdtPLUGALT =>
      '•\tmacOS 依赖 CPU 电源管理插件（PluginType）来调节 CPU 频率，提高能效和续航。\n•\t该补丁会修改 CPU 定义，使 macOS 认为它是 Apple 设备所需的 plugin-type = 1 处理器，从而正确加载 CPU 变频管理，提高性能和功耗控制。\n•\t适用于Intel Alder Lake 12代及以上,以及部分AMD Ryzen平台';

  @override
  String get remark_ssdtAWAC => '禁用AWAC(现代计时器)(适用于Intel Coffee Lake 8代及以上)';

  @override
  String get note_ssdtAWAC =>
      '•\t禁用AWAC(现代计时器),同时启用或仿冒传统RTC\n•\t适用于Intel Coffee Lake 8代及以上';

  @override
  String get remark_ssdtUNC => '所有原生X99(C612)主板和大多数原生X79(C602)主板需要';

  @override
  String get note_ssdtUNC =>
      '•\t此 SSDT 适用于所有 X99 主板以及多数 X79 主板，主要功能是禁用 ACPI 中未使用的设备，从而防止 IOPCIFamily 引起内核崩溃（kernel panic）。\n•\t适用主板： 所有原生X99(C612)主板和大多数原生X79(C602)主板。';

  @override
  String get remark_ssdtRTC0RANGE =>
      '启用或仿冒传统RTC计时器,并修复RTC范围(适用于所有原生X99(C612)和X299主板)';

  @override
  String get note_ssdtRTC0RANGE =>
      '•\t启用或仿冒传统RTC计时器,并修复RTC范围。\n• 解决开机时间不正确、RTC 相关错误、睡眠唤醒问题等。\n•\t此 SSDT 适用于所有 X99(C612) 主板以及X299 主板';

  @override
  String get remark_ssdtDTGP => '添加DTGP支持';

  @override
  String get note_ssdtDTGP =>
      '•\t注入硬件设备属性,修复部分显卡,声卡,雷电卡等ACPI问题(没有 DTGP 方法支持时，这些属性注入可能会失败或不起作用！)';

  @override
  String get remark_ssdtDMAC => '仿冒一个标准DMA控制器';

  @override
  String get note_ssdtDMAC =>
      '•\t仿冒一个标准 DMA Controller（直接内存访问控制器）的虚拟设备控制器（PNP0200）, 补全 ACPI 资源表,让 macOS 正常识别 LPC 总线设备和 DMA 功能\n•\tHEDT/服务器平台通常不需要\n•\t添加缺失的部件,这只是一种完善方案,非必要!';

  @override
  String get remark_ssdtPWRB => '仿冒一个标准PWRB控制器';

  @override
  String get note_ssdtPWRB =>
      '•\t仿冒一个标准 Power Button（PNP0C0C）设备,让 macOS 正常识别系统电源按钮、支持睡眠和唤醒\n•\t部分 BIOS/主板 ACPI 树里没有 PNP0C0C,macOS 无法正确处理电源按钮,可能导致无法睡眠、无法唤醒、菜单栏电源按钮不可用\n•\t添加缺失的部件,这只是一种完善方案,非必要!';

  @override
  String get remark_ssdtSLPB => '仿冒一个标准SLPB控制器';

  @override
  String get note_ssdtSLPB =>
      '•\t仿冒一个标准 Sleep Button（PNP0C0E）设备，让 macOS 正确识别系统睡眠按钮，实现睡眠和唤醒功能\n•\t部分 BIOS/主板 ACPI 树里没有 PNP0C0E,macOS 无法正确处理睡眠按钮,可能导致无法睡眠、无法唤醒、菜单栏睡眠按钮不可用\n•\tPNP0C0E睡眠修正方法时,需要此部件!\n•\t添加缺失的部件,这只是一种完善方案,非必要!';

  @override
  String get remark_ssdtMEM2 => '仿冒一个IGPU所需的MEM2设备';

  @override
  String get note_ssdtMEM2 =>
      '•\t添加 IGPU 所需的 MEM2 ACPI 设备,修复 IGPU 相关问题\n•\t补充核显内存映射，避免驱动初始化失败\n•\t适用范围: Haswell ~ Kaby Lake，仅核显系统。通常仅独显不需要此SSDT!';

  @override
  String get corePatches => '核心补丁';

  @override
  String get corePatchesRemark => '系统正常启动和电源管理必需的基础补丁';

  @override
  String get functionPatches => '功能补丁';

  @override
  String get functionPatchesRemark => '提供额外功能或修复特性问题的补丁';

  @override
  String get devicePatches => '设备补丁';

  @override
  String get devicePatchesRemark => '针对显卡硬件的补丁';

  @override
  String get specialPatches => '专用补丁';

  @override
  String get specialPatchesRemark => '仅在特定主板或架构需要的补丁';

  @override
  String get sleepPatches => '睡眠补丁';

  @override
  String get sleepPatchesRemark => '非必需，用于修复睡眠问题';

  @override
  String get auxiliaryPatches => '辅助补丁';

  @override
  String get auxiliaryPatchesRemark => '非必需，但可以补全ACPI结构或增强兼容性';

  @override
  String get prebuiltPatches => '预制补丁';

  @override
  String get languagePortuguese => '葡萄牙语';

  @override
  String get ssdtMsg500 => 'デバイスの ACPI パス:';

  @override
  String get ssdtMsg501 => '偽造するグラフィックス カード デバイスを選択してください';

  @override
  String get ssdtMsg502 => '不明なグラフィックス カード モデル';

  @override
  String get ssdtMsg503 => '偽造グラフィックス カード ID データベース:';

  @override
  String ssdtMsg504(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg505 => '例: 73BF';

  @override
  String get ssdtMsg506 => '4 つの 16 進文字が必要です';

  @override
  String ssdtMsg507(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg508 => 'オプション、グラフィックス カード名';

  @override
  String get ssdtMsg509 => '偽造グラフィックス カード ID:';

  @override
  String get ssdtMsg510 => '偽造グラフィックス カード名:';

  @override
  String ssdtMsg511(String arg0) {
    return 'ソース .dsl ファイルを削除するかどうか: $arg0';
  }

  @override
  String ssdtMsg512(String arg0) {
    return '強制的にコンパイルするかどうか: $arg0';
  }

  @override
  String ssdtMsg513(String arg0) {
    return 'ターゲット EFI を上書きするかどうか: $arg0';
  }

  @override
  String ssdtMsg514(String arg0) {
    return '一致パターン: $arg0';
  }

  @override
  String ssdtMsg515(String arg0) {
    return 'HPET データのロードに失敗しました: $arg0';
  }

  @override
  String ssdtMsg516(String arg0) {
    return 'HPET データの初期化に失敗しました: $arg0';
  }

  @override
  String ssdtMsg517(String arg0) {
    return 'ACPI パスの初期化に失敗しました: $arg0';
  }

  @override
  String get ssdtMsg518 => 'パッチノートはありません';

  @override
  String get ssdtMsg519 => 'パッチノートはありません';

  @override
  String ssdtMsg520(String arg0) {
    return 'パッチノートの取得に失敗しました: $arg0';
  }

  @override
  String get ssdtMsg521 => 'パッチノートの取得に失敗しました';

  @override
  String ssdtMsg522(String arg0) {
    return '$arg0 構成パスをクリアします';
  }

  @override
  String ssdtMsg523(String arg0, String arg1) {
    return '$arg0 が無効なファイルを選択しました: $arg1';
  }

  @override
  String ssdtMsg524(String arg0) {
    return '$arg0 のパッチ構成が見つかりません';
  }

  @override
  String get ssdtMsg525 => '続行する前に、カスタマイズする必要がある SSDT を選択してください。';

  @override
  String ssdtMsg526(String arg0) {
    return 'パッチの実行に失敗しました: $arg0';
  }

  @override
  String ssdtMsg527(String arg0, String arg1) {
    return 'パッチ [$arg0] の実行に失敗しました: $arg1';
  }

  @override
  String get ssdtMsg528 => 'SSDT が生成されています。操作を繰り返さないでください。';

  @override
  String get ssdtMsg529 => 'パッチリストが空です!';

  @override
  String get ssdtMsg530 => '抽出が進行中です。操作を繰り返さないでください。';

  @override
  String ssdtMsg531(String arg0) {
    return '現在の $arg0 プラットフォームによって抽出された ACPI テーブルは、OpenCore などによって挿入された ACPI パッチによって汚染されている可能性が非常に高くなります。 Windows/Linux プラットフォームで動作することを強くお勧めします。';
  }

  @override
  String get ssdtMsg532 => 'ACPIの抽出に失敗しました!';

  @override
  String get ssdtMsg533 => 'ACPIの抽出に成功しました!';

  @override
  String ssdtMsg534(String arg0) {
    return 'パッチの準備に失敗しました: $arg0';
  }

  @override
  String ssdtMsg535(String arg0) {
    return 'DSDT/ACPI のロードに失敗しました: $arg0';
  }

  @override
  String ssdtMsg536(String arg0) {
    return 'config.plist ファイルが存在しません: $arg0';
  }

  @override
  String get ssdtMsg537 => '認識できない plist ファイル形式';

  @override
  String ssdtMsg538(String arg0) {
    return 'config.plist タイプは「$arg0」です';
  }

  @override
  String ssdtMsg539(String arg0) {
    return 'plist タイプの解析に失敗しました: $arg0';
  }

  @override
  String get ssdtMsg540 => '最初に ACPI ディレクトリを選択してください。';

  @override
  String get ssdtMsg541 => 'まず、EFI ディレクトリ内の config.plist ファイルを選択してください。';

  @override
  String ssdtMsg542(String arg0) {
    return '無効な ACPI パス: $arg0';
  }

  @override
  String ssdtMsg543(String arg0) {
    return 'config.plist ファイルが存在しません: $arg0';
  }

  @override
  String ssdtMsg544(String arg0) {
    return 'plist ファイルのマージに失敗しました: $arg0';
  }

  @override
  String get ssdtMsg545 => 'はい';

  @override
  String get ssdtMsg546 => 'いいえ';

  @override
  String get ssdtMsg547 => 'はい';

  @override
  String get ssdtMsg548 => 'いいえ';

  @override
  String get ssdtMsg549 => 'はい';

  @override
  String get ssdtMsg550 => 'いいえ';

  @override
  String get ssdtMsg551 => '内蔵';

  @override
  String get ssdtMsg552 => 'リモート';

  @override
  String get ssdtMsg553 => '新しいバージョンのiasl';

  @override
  String get ssdtMsg554 => '古いバージョンの iasl-legacy';

  @override
  String get ssdtMsg555 => 'はい';

  @override
  String get ssdtMsg556 => 'いいえ';

  @override
  String get ssdtMsg557 => '設定';

  @override
  String get ssdtMsg558 => 'IASLモード';

  @override
  String get ssdtMsg559 => 'IASL コンパイル タイプ';

  @override
  String get ssdtMsg560 => '逆コンパイルされた .dsl ファイルを削除する';

  @override
  String get ssdtMsg561 => '強制コンパイル';

  @override
  String get ssdtMsg562 => 'ターゲットEFIを上書きするかどうか';

  @override
  String get ssdtMsg563 => 'ACPIマッチングモード';

  @override
  String get ssdtMsg564 => 'コアパッチ';

  @override
  String get ssdtMsg565 => '機能パッチ';

  @override
  String get ssdtMsg566 => 'デバイスパッチ';

  @override
  String get ssdtMsg567 => '専用パッチ';

  @override
  String get ssdtMsg568 => 'スリープパッチ';

  @override
  String get ssdtMsg569 => '補助パッチ';

  @override
  String get ssdtMsg570 => '既製のパッチ';

  @override
  String get ssdtMsg571 => '通常のシステム起動と電源管理に必要な基本パッチ';

  @override
  String get ssdtMsg572 => '追加機能を提供する、または機能の問題を修正するパッチ';

  @override
  String get ssdtMsg573 => 'グラフィックス カード ハードウェア用のパッチ';

  @override
  String get ssdtMsg574 => 'パッチは特定のマザーボードまたはアーキテクチャでのみ必要です';

  @override
  String get ssdtMsg575 => 'オプション、睡眠の問題を解決するために使用されます';

  @override
  String get ssdtMsg576 => '必須ではありませんが、ACPI 構造を完成させたり、互換性を強化したりできます';

  @override
  String get ssdtMsg577 => 'DMARを選択します';

  @override
  String get ssdtMsg578 => 'カスタマイズする必要があるDMARテーブルを選択してください';

  @override
  String get ssdtMsg579 => 'APIC を選択します';

  @override
  String get ssdtMsg580 => 'カスタマイズする必要がある APIC テーブルを選択してください';

  @override
  String get ssdtMsg581 => 'FACPを選択します';

  @override
  String get ssdtMsg582 => 'FACP フォームを選択してください';

  @override
  String get ssdtMsg583 => 'FACPを選択します';

  @override
  String get ssdtMsg584 => 'FACP フォームを選択してください';

  @override
  String get ssdtMsg585 => 'ログ';

  @override
  String get ssdtMsg586 => 'ログをクリアする';

  @override
  String get ssdtMsg587 => 'ログのエクスポート';

  @override
  String get ssdtMsg588 => '既製のパッチ';

  @override
  String get ssdtMsg589 => 'パッチの実行';

  @override
  String get ssdtMsg590 => 'ファイル/ディレクトリを選択してください';

  @override
  String get ssdtMsg591 => 'ACPIの抽出';

  @override
  String get ssdtMsg592 => '出力ディレクトリ';

  @override
  String get ssdtMsg593 => 'DSDT ファイルまたは ACPI ディレクトリを選択してください';

  @override
  String get ssdtMsg594 => 'ACPIの選択';

  @override
  String get ssdtMsg595 => '構成をマージする';

  @override
  String get ssdtMsg596 => '構成を選択します';

  @override
  String get ssdtMsg597 => 'config.plist ファイルを選択してください';

  @override
  String get ssdtMsg598 => '設定';

  @override
  String get ssdtMsg599 => 'プラットフォームパッチ';

  @override
  String get ssdtMsg600 => 'パッチガイド';

  @override
  String get ssdtMsg601 => 'アプリケーションについて';

  @override
  String ssdtMsg602(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String get ssdtMsg603 => 'パッチを選択';

  @override
  String get ssdtMsg604 => 'デスクトップ';

  @override
  String get ssdtMsg605 => 'サーバ';

  @override
  String get ssdtMsg606 => 'SSDT が生成されています。操作を繰り返さないでください。';

  @override
  String get ssdtMsg607 => 'SSDT が選択されていません';

  @override
  String ssdtMsg608(String arg0, String arg1) {
    return '$arg0 $arg1';
  }

  @override
  String ssdtMsg609(String arg0, String arg1) {
    return '$arg0 リスト: $arg1';
  }

  @override
  String get ssdtMsg610 => 'プレハブSSDT';

  @override
  String get ssdtMsg611 => 'カスタムSSDT';

  @override
  String get ssdtMsg612 => 'CPUの種類:';

  @override
  String get ssdtMsg613 => 'プラットフォームの種類:';

  @override
  String get ssdtMsg614 => 'デスクトップ';

  @override
  String get ssdtMsg615 => 'デスクトップ';

  @override
  String get ssdtMsg616 => 'ノート';

  @override
  String get ssdtMsg617 => 'ノート';

  @override
  String get ssdtMsg618 => 'ミニホスト';

  @override
  String get ssdtMsg619 => 'ミニホスト';

  @override
  String get ssdtMsg620 => 'サーバ';

  @override
  String get ssdtMsg621 => 'サーバ';

  @override
  String ssdtMsg622(String arg0) {
    return '現在選択されている SSDT リスト: $arg0';
  }

  @override
  String get ssdtMsg623 => 'プラットフォーム情報:';

  @override
  String get ssdtMsg624 => 'すべてチェックしてください';

  @override
  String get ssdtMsg625 => 'コア（公式推奨）';

  @override
  String get ssdtMsg626 => '推奨（機能修正）';

  @override
  String get ssdtMsg627 => 'オプション（機能を完備）';

  @override
  String get ssdtMsg628 => 'プラットフォーム情報:';

  @override
  String get ssdtMsg629 => 'プレハブSSDT';

  @override
  String get ssdtMsg630 => 'カスタムSSDT';

  @override
  String get ssdtMsg631 => 'カスタムSSDT';

  @override
  String get ssdtMsg632 => 'プレハブSSDT';

  @override
  String ssdtMsg633(String arg0, String arg1) {
    return '$arg0 $arg1';
  }

  @override
  String ssdtMsg634(String arg0, String arg1) {
    return '$arg0$arg1';
  }

  @override
  String ssdtMsg635(String arg0, String arg1) {
    return '$arg0$arg1';
  }

  @override
  String get ssdtMsg636 => 'GitHub にアクセス';

  @override
  String get ssdtMsg637 => '今すぐダウンロード';

  @override
  String get ssdtMsg638 => '閉鎖';

  @override
  String get ssdtMsg639 => '新しいバージョンが見つかりました';

  @override
  String get ssdtMsg640 => 'バージョン番号:';

  @override
  String get ssdtMsg641 => '発売時期：';

  @override
  String get ssdtMsg642 => 'サーバーへの接続がタイムアウトしました';

  @override
  String get ssdtMsg643 => 'サーバーへの接続がタイムアウトしました';

  @override
  String get ssdtMsg644 => 'ダウンロードがキャンセルされました';

  @override
  String get ssdtMsg645 => 'ダウンロードがキャンセルされました';

  @override
  String get ssdtMsg646 => '読み取り応答タイムアウト';

  @override
  String get ssdtMsg647 => '読み取り応答タイムアウト';

  @override
  String ssdtMsg648(String arg0) {
    return 'サーバー情報の取得中に例外が発生しました。ステータスコード: $arg0';
  }

  @override
  String ssdtMsg649(String arg0) {
    return 'リクエストが失敗しました。ステータス コード: $arg0';
  }

  @override
  String ssdtMsg650(String arg0) {
    return 'ダウンロードがタイムアウトしました。$arg0 秒間進捗がありません。タスクはキャンセルされました。';
  }

  @override
  String ssdtMsg651(String arg0) {
    return 'ログ チャネルが存在しません: $arg0';
  }

  @override
  String ssdtMsg652(String arg0, String arg1, String arg2) {
    return 'エクスポートが成功しました。ファイルパス: $arg0$arg1$arg2';
  }

  @override
  String ssdtMsg653(String arg0) {
    return 'エクスポートに失敗しました!エラーメッセージ: $arg0';
  }

  @override
  String ssdtMsg654(String arg0) {
    return 'ファイルが存在しません!エクスポートに失敗しました!ファイルパス: $arg0';
  }

  @override
  String ssdtMsg655(String arg0) {
    return 'ログ ファイルの初期化に失敗しました: $arg0';
  }

  @override
  String get ssdtMsg656 => '未知';

  @override
  String get ssdtMsg657 => '最も緩い';

  @override
  String get ssdtMsg658 => '長さのみ';

  @override
  String get ssdtMsg659 => 'テーブル ID と長さ、正規化されたヘッダーを無効にする';

  @override
  String get ssdtMsg660 => 'テーブル ID と長さ、正規化されたヘッダーを有効にする';

  @override
  String get ssdtMsg661 =>
      'Intel 第 1 世代 Arrandale、第 2 世代 Sandy Bridge、第 3 世代 Ivy Bridge';

  @override
  String get ssdtMsg662 => 'Intel第4世代Haswell、第5世代Broadwell';

  @override
  String get ssdtMsg663 =>
      'Intel 第 6 世代 Skylake、第 7 世代 Kaby Lake、第 4 世代 Haswell の一部';

  @override
  String get ssdtMsg664 => 'カスタムの明るさ。通常、一部の非標準機器または特別なニーズの設定に使用されます。';

  @override
  String get ssdtMsg665 => 'カスタムの明るさ。通常、一部の非標準機器または特別なニーズの設定に使用されます。';

  @override
  String get ssdtMsg666 => 'Intel 第 8 世代 CoffeeLake ～ 第 10 世代、および AMD ノートブック';

  @override
  String get ssdtMsg667 =>
      'その他 (カスタム applbkl-name / applbkl-data デバイス プロパティが必要) はサポートされていない可能性があります';

  @override
  String ssdtMsg668(String arg0) {
    return 'テーブルが存在しません: $arg0';
  }

  @override
  String ssdtMsg669(String arg0) {
    return '受信データの長さが 4 バイト未満です: $arg0';
  }

  @override
  String ssdtMsg670(String arg0) {
    return 'ファイルの内容は 4 バイト未満です: $arg0';
  }

  @override
  String ssdtMsg671(String arg0, String arg1) {
    return '署名の読み取りエラー: $arg0、ファイル パス: $arg1';
  }

  @override
  String ssdtMsg672(String arg0) {
    return '一時ディレクトリが次の場所に作成されました: $arg0';
  }

  @override
  String ssdtMsg673(String arg0) {
    return '一時ディレクトリはすでに次の場所に存在します: $arg0';
  }

  @override
  String ssdtMsg674(String arg0) {
    return '$arg0 ファイルを逆コンパイルしています...';
  }

  @override
  String get ssdtMsg675 => '正在批量反编译 SSDT.aml 文件...';

  @override
  String get ssdtMsg676 => 'DSDT.aml および SSDT.aml ファイルをバッチで逆コンパイルしています...';

  @override
  String ssdtMsg677(String arg0) {
    return '=> $arg0 の逆コンパイルに失敗しました。';
  }

  @override
  String ssdtMsg678(String arg0) {
    return '=> $arg0 は正常に逆コンパイルされました!';
  }

  @override
  String ssdtMsg679(String arg0) {
    return '=> $arg0 は正常に逆コンパイルされました!';
  }

  @override
  String ssdtMsg680(String arg0) {
    return '=> $arg0 は正常に逆コンパイルされました!';
  }

  @override
  String get ssdtMsg681 => '失敗した .aml ファイルを個別に逆コンパイルしています...';

  @override
  String ssdtMsg682(String arg0) {
    return '=> $arg0 は正常に逆コンパイルされました!';
  }

  @override
  String ssdtMsg683(String arg0) {
    return '=> $arg0 の逆コンパイルに失敗しました。';
  }

  @override
  String get ssdtMsg684 => '他の .aml ファイルを逆コンパイルしています...';

  @override
  String ssdtMsg685(String arg0) {
    return '=> $arg0 は正常に逆コンパイルされました!';
  }

  @override
  String get ssdtMsg686 =>
      '注: パスまたはファイル名に中国語または特殊文字を含めないように注意してください。含めると、予期しない問題が発生する可能性があります。';

  @override
  String ssdtMsg687(String arg0) {
    return 'エラーが発生しました: $arg0';
  }

  @override
  String ssdtMsg688(String arg0, String arg1) {
    return 'getDevicePathsWithId メソッド $arg0 でパスを処理中にエラーが発生しました: $arg1';
  }

  @override
  String ssdtMsg689(String arg0) {
    return 'スキップ: $arg0。これは以前に正しく逆コンパイルされています。';
  }

  @override
  String ssdtMsg690(String arg0) {
    return 'ターゲット ファイルは除外リストにあります: $arg0';
  }

  @override
  String ssdtMsg691(String arg0) {
    return '無効なパス: $arg0';
  }

  @override
  String get ssdtMsg692 => '無効なパス';

  @override
  String ssdtMsg693(String arg0) {
    return '$arg0 に有効な .aml または .dat ファイルが見つかりません!';
  }

  @override
  String get ssdtMsg694 => '有効な .aml または .dat ファイルが見つかりません';

  @override
  String ssdtMsg695(String arg0) {
    return '逆コンパイルに失敗しました: $arg0';
  }

  @override
  String get ssdtMsg696 => 'acpidump ツールの準備ができていません。作戦終了！';

  @override
  String get ssdtMsg697 => 'ACPI テーブルをエクスポートしています...';

  @override
  String get ssdtMsg698 => '現在のプラットフォームではサポートされていません。';

  @override
  String get ssdtMsg699 => 'sudo パスワード認証を待っています...';

  @override
  String get platformName1000 => 'ジェネレーション 0-Penryn-775 プラットフォーム';

  @override
  String get platformName1001 => 'ジェネレーション 0-ペンリン-ノートブック';

  @override
  String get platformName1002 => '世代 0-Penryn-mini ホスト';

  @override
  String get platformName1003 => '第 10 世代 - Cascade Lake - X&W-X599 プラットフォーム';

  @override
  String get platformName1004 => '第 10 世代 - Comet Lake - 1200 プラットフォーム';

  @override
  String get platformName1005 => '第 10 世代 - Comet Lake - ラップトップ';

  @override
  String get platformName1006 => '10代目-Comet Lake-ミニホスト';

  @override
  String get platformName1007 => '第 10 世代 - Ice Lake - ラップトップ';

  @override
  String get platformName1008 => '第10世代 - Ice Lake - ミニホスト';

  @override
  String get platformName1009 => '第 11 世代 - Rocket Lake - 1200 プラットフォーム';

  @override
  String get platformName1010 => '第 11 世代 - Rocket Lake - ラップトップ';

  @override
  String get platformName1011 => '11代目 - Tiger Lake - ミニホスト';

  @override
  String get platformName1012 => '第12世代-Alder Lake-1700プラットフォーム';

  @override
  String get platformName1013 => '12代目-アルダーレイク-ノート';

  @override
  String get platformName1014 => '12代目-Alder Lake-ミニホスト';

  @override
  String get platformName1015 => '第 13 世代 - Raptor Lake-1700 プラットフォーム';

  @override
  String get platformName1016 => '13代目-Raptor Lake-ノート';

  @override
  String get platformName1017 => '13代目-Raptor Lake-ミニホスト';

  @override
  String get platformName1018 => '第 14 世代 - Raptor Lake-1700 プラットフォーム';

  @override
  String get platformName1019 => '14代目-Raptor Lake-ノートブック';

  @override
  String get platformName1020 => '第14世代 - Raptor Lake - ミニホスト';

  @override
  String get platformName1021 => '第 15 世代 - Arrow Lake - 1851 プラットフォーム';

  @override
  String get platformName1022 => '15代目-アローレイク-手帳';

  @override
  String get platformName1023 => '15代目 - Arrow Lake - ミニホスト';

  @override
  String get platformName1024 => '第 1 世代 - アランデール - ノートブック';

  @override
  String get platformName1025 => '第 1 世代 - アランデール - ミニ ホスト';

  @override
  String get platformName1026 => '第 1 世代 - Lynnfield-1156 プラットフォーム';

  @override
  String get platformName1027 => '第 1 世代 - Nehalem&Westmere - X58 プラットフォーム';

  @override
  String get platformName1028 => '第 2 世代 - Sandy Bridge - 1155 プラットフォーム';

  @override
  String get platformName1029 => '第2世代-Sandy Bridge-E-X79プラットフォーム';

  @override
  String get platformName1030 => '2代目-Sandy Bridge-ノート';

  @override
  String get platformName1031 => '2代目-Sandy Bridge-ミニホスト';

  @override
  String get platformName1032 => '第 3 世代 - Ivy Bridge - 1155 プラットフォーム';

  @override
  String get platformName1033 => '第 3 世代 - Ivy Bridge - E-X79 プラットフォーム';

  @override
  String get platformName1034 => '3代目-Ivy Bridge-ノートブック';

  @override
  String get platformName1035 => '第 3 世代 - Ivy Bridge - ミニホスト';

  @override
  String get platformName1036 => '第4世代Haswell-1150プラットフォーム';

  @override
  String get platformName1037 => '第4世代Haswell-E-X99プラットフォーム';

  @override
  String get platformName1038 => '第 4 世代 - Haswell - ラップトップ';

  @override
  String get platformName1039 => '第4世代-Haswell-miniホスト';

  @override
  String get platformName1040 => '第 5 世代 - Broadwell-1150 プラットフォーム';

  @override
  String get platformName1041 => '第 5 世代 - Broadwell-E-X99 プラットフォーム';

  @override
  String get platformName1042 => '第5世代-Broadwell-ノートブック';

  @override
  String get platformName1043 => '第 5 世代 - Broadwell - ミニ ホスト';

  @override
  String get platformName1044 => '第6世代-Skylake-1151プラットフォーム';

  @override
  String get platformName1045 => '第6世代-Skylake-X&W-X299プラットフォーム';

  @override
  String get platformName1046 => '第6世代-Skylake-ノートブック';

  @override
  String get platformName1047 => '第6世代-Skylake-miniホスト';

  @override
  String get platformName1048 => '第 7 世代 - Kaby Lake - 1151 プラットフォーム';

  @override
  String get platformName1049 => '第 7 世代 - Kaby Lake - ノートブック';

  @override
  String get platformName1050 => '第7世代 - Kaby Lake - ミニホスト';

  @override
  String get platformName1051 => '第8世代-Coffee Lake-1151プラットフォーム';

  @override
  String get platformName1052 => '第 8 世代-Coffee Lake-ノートブック';

  @override
  String get platformName1053 => '8代目-Coffee Lake-ミニホスト';

  @override
  String get platformName1054 => '第9世代-Coffee Lake-1151プラットフォーム';

  @override
  String get platformName1055 => '第9世代-Coffee Lake-ノートブック';

  @override
  String get platformName1056 => '9代目-Coffee Lake-ミニホスト';

  @override
  String get platformName1057 => 'ブルドーザー(15時間)とジャガー(16時間)';

  @override
  String get platformName1058 => 'ブルドーザー (15 時間) およびジャガー (16 時間) - ノートブック';

  @override
  String get platformName1059 => 'ブルドーザー (15 時間) およびジャガー (16 時間) - ミニ ホスト';

  @override
  String get platformName1060 => 'Ryzen と Threadripper (17 時間と 19 時間)';

  @override
  String get platformName1061 =>
      'Ryzen および Threadripper (17 時間および 19 時間) - ハイエンド サーバー';

  @override
  String get platformName1062 => 'Ryzen ノートブック';

  @override
  String get platformName1063 => 'Ryzen-miniホスト';

  @override
  String get platformName1064 => 'サーバ';

  @override
  String get platformName1065 => 'ノート';

  @override
  String get platformName1066 => 'ミニホスト';
}
