// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'RapidSSDT';

  @override
  String get dumpAcpi => 'Dump ACPI';

  @override
  String get selectAcpisFolder => 'Select ACPIs';

  @override
  String get generateSsdt => 'Generate SSDT';

  @override
  String get clearConfig => 'Clear Config';

  @override
  String get selectDmar => 'Select DMAR';

  @override
  String get hintDmar => 'Please select the DMAR table';

  @override
  String get selectApic => 'Select APIC';

  @override
  String get hintApic => 'Please select the APIC table';

  @override
  String get selectFacp => 'Select FACP';

  @override
  String get hintFacp => 'Please select FACP table';

  @override
  String get selectOutputPath => 'Select Output Path';

  @override
  String get oneClickSelect => 'One-Click Select';

  @override
  String get clearSelection => 'Clear Selection';

  @override
  String get about => 'About';

  @override
  String get checkUpdate => 'Check Updates';

  @override
  String get guide => 'Guide';

  @override
  String get platformPreset => 'Platform Presets';

  @override
  String get customAcpiOptions => 'Custom ACPI Options';

  @override
  String get legacyIrqConflict => 'HPET IRQ Conflict';

  @override
  String get keepOriginalIrq => 'Keep Original IRQs';

  @override
  String get gpuSpoofModel => 'Spoofed GPU Model';

  @override
  String get pciPath => 'PCI Device Path';

  @override
  String get spoofGpuId => 'Spoofed GPU ID';

  @override
  String get disablePciDevices => 'Disable PCI Devices';

  @override
  String get brightnessPatch => 'Display Brightness Patch (PNLF)';

  @override
  String get usbxPowerProperties => 'USB Power Properties (USBX)';

  @override
  String get xosiWindowsVersion => 'Emulated Windows Version (XOSI)';

  @override
  String get language => 'Language';

  @override
  String get languagePortugueseBR => 'Português (Brasil)';

  @override
  String get languagePortuguesePT => 'Português (Portugal)';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageChinese => 'Chinese';

  @override
  String get languageJapanese => 'Japanese';

  @override
  String get newVersionFound => 'New version found';

  @override
  String get versionNumber => 'Version: ';

  @override
  String get releaseTime => 'Released: ';

  @override
  String get visitGithub => 'Visit GitHub';

  @override
  String get downloadNow => 'Download Now';

  @override
  String get close => 'Close';

  @override
  String get log => 'Log';

  @override
  String get clearLog => 'Clear Log';

  @override
  String get exportLog => 'Export Log';

  @override
  String get executePatch => 'Execute Patch';

  @override
  String get mergeConfig => 'Merge config';

  @override
  String get selectConfig => 'Select config';

  @override
  String get hintConfig => 'Please select config.plist file';

  @override
  String get selectPatch => 'Select patch';

  @override
  String get generatingSsdt => 'Generating SSDT, please wait!';

  @override
  String get noSsdtSelected => 'No SSDT selected';

  @override
  String get platformInfo => 'Platform:';

  @override
  String get prebuiltSsdt => 'Prebuilt SSDT';

  @override
  String get customSsdt => 'Custom SSDT';

  @override
  String get cpuType => 'CPU Type:';

  @override
  String get platformType => 'Form Factor:';

  @override
  String get platformDesktop => 'Desktop';

  @override
  String get platformLaptop => 'Laptop';

  @override
  String get platformNuc => 'NUC / Mini PC';

  @override
  String get platformServer => 'Server';

  @override
  String get checkAll => 'Check All';

  @override
  String get coreOfficialRec => 'Core (Official Rec.)';

  @override
  String get recommendedFixes => 'Recommended';

  @override
  String get optionalEnhancements => 'Optional';

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
  String get remark_ssdtHPET =>
      'Resolves IRQ conflicts, typically used for audio fixes';

  @override
  String get note_ssdtHPET =>
      '• Fixes IRQ conflicts by patching legacy IRQs\n• Often needed for on-board audio to work properly\n• Only select if recommended or if facing audio issues';

  @override
  String get remark_ssdtECUSBXDesktop =>
      'Spoofs EC and injects USB power properties (Intel 6th Gen+ Desktop)';

  @override
  String get note_ssdtECUSBXDesktop =>
      '• Spoofs EC to allow macOS power management to load\n• Injects USB power properties for correct USB power delivery\n• Suitable for Intel Skylake (6th Gen) and newer desktop platforms';

  @override
  String get remark_ssdtECUSBXLaptop =>
      'Spoofs EC, does not affect existing EC, injects USB power properties (Intel 6th Gen+ Laptop)';

  @override
  String get note_ssdtECUSBXLaptop =>
      '• Spoofs EC (Embedded Controller) without affecting the existing one\n• Injects USB power properties for laptops\n• Suitable for Intel Skylake (6th Gen) and newer laptop platforms';

  @override
  String get remark_ssdtECDesktop =>
      'Spoofs EC (Intel 5th Gen and older Desktop)';

  @override
  String get note_ssdtECDesktop =>
      '• Spoofs EC to allow macOS power management to load\n• Suitable for Intel Broadwell (5th Gen) and older desktop platforms';

  @override
  String get remark_ssdtECLaptop =>
      'Spoofs EC, does not affect existing EC (Intel 5th Gen and older Laptop)';

  @override
  String get note_ssdtECLaptop =>
      '• Spoofs EC (Embedded Controller) without affecting the existing one\n• Suitable for Intel Broadwell (5th Gen) and older laptop platforms';

  @override
  String get remark_ssdtUSBX => 'USB power properties fix (Intel 6th Gen+)';

  @override
  String get note_ssdtUSBX =>
      '• Injects USB power properties for correct USB power delivery\n• Suitable for Intel Skylake (6th Gen) and newer platforms';

  @override
  String get remark_ssdtPLUG =>
      'CPU core recognition, enables frequency scaling and power saving';

  @override
  String get note_ssdtPLUG =>
      '• Injects plugin-type=1 on the first processor\n• Enables native macOS CPU power management and frequency scaling\n• Required on Intel Haswell (4th Gen) to Comet Lake (10th Gen)';

  @override
  String get remark_ssdtPMC =>
      'Enables NVRAM support (Typically Intel 300 series native motherboards)';

  @override
  String get note_ssdtPMC =>
      '• Adds missing PMC device for native NVRAM support\n• Required on Intel 300 series motherboards (Z390, B360, etc.)';

  @override
  String get remark_ssdtPNLF =>
      'Adds PNLF device for backlight support (Laptops and AIOs)';

  @override
  String get note_ssdtPNLF =>
      '• Injects PNLF device required for macOS backlight control\n• Essential for Laptops and All-in-One devices';

  @override
  String get remark_ssdtALS0 =>
      'Provides ambient light sensor support (Laptops and AIOs)';

  @override
  String get note_ssdtALS0 =>
      '• Spoofs an ambient light sensor (ALS0)\n• Helps with screen brightness persistence and auto-brightness on laptops';

  @override
  String get remark_ssdtXOSI =>
      'macOS spoofs Windows, unlocks hidden devices (e.g., I2C trackpad)';

  @override
  String get note_ssdtXOSI =>
      '• Spoofs Windows version during ACPI OS check\n• Unlocks devices hidden by the BIOS (like I2C trackpads)\n• Requires _OSI to XOSI rename patch';

  @override
  String get remark_ssdtRHUB => 'USB port reset and fix';

  @override
  String get note_ssdtRHUB =>
      '• Disables the original RHUB device and forces macOS to enumerate USB ports again\n• Useful for Asus motherboards on 400-series chipsets';

  @override
  String get remark_ssdtBridge =>
      'Creates bridges for missing PCI device paths';

  @override
  String get note_ssdtBridge =>
      '• Adds missing PCI bridges to the ACPI tree\n• Ensures devices are mounted correctly in macOS';

  @override
  String get remark_ssdtDMAR =>
      'Removes DMAR reserved memory region, fixes system boot and network issues';

  @override
  String get note_ssdtDMAR =>
      '• Drops original DMAR table and replaces it without the reserved memory region\n• Fixes issues with Intel I225-V Ethernet and certain Wi-Fi cards';

  @override
  String get remark_ssdtAPIC =>
      'Adds missing APIC entries for more than 255 threads';

  @override
  String get note_ssdtAPIC =>
      '• Required on systems with more than 255 threads to boot macOS';

  @override
  String get remark_ssdtSBUSMCHC => 'Adds SMBus support';

  @override
  String get note_ssdtSBUSMCHC =>
      '• Completes the ACPI tree for SMBus (System Management Bus)\n• Enables AppleSMBus and fixes temperature sensors';

  @override
  String get remark_ssdtIMEI =>
      'Fixes iGPU acceleration failure (Typically Ivy Bridge and Sandy Bridge)';

  @override
  String get note_ssdtIMEI =>
      '• Adds or fixes the IMEI (Intel Management Engine Interface) device\n• Required for Intel HD 3000/4000 graphics acceleration';

  @override
  String get remark_ssdtFixShutdown =>
      'Fixes restart after shutdown or shutdown failure';

  @override
  String get note_ssdtFixShutdown =>
      '• Fixes the issue where the PC restarts instead of shutting down\n• Usually requires an ACPI rename patch (_PTS to ZPTS)';

  @override
  String get remark_checkSystemState => 'Check System State';

  @override
  String get note_checkSystemState =>
      '• Verifies system ACPI state for compatibility';

  @override
  String get remark_checkAOAC => 'Check AOAC';

  @override
  String get note_checkAOAC =>
      '• Checks Always-On Always-Connected compatibility';

  @override
  String get remark_ssdtGPRW => 'Fixes instant wake caused by USB controllers';

  @override
  String get note_ssdtGPRW =>
      '• Prevents USB devices from instantly waking the system from sleep\n• Requires GPRW to XPRW rename patch';

  @override
  String get remark_ssdtUPRW => 'Fixes instant wake caused by USB controllers';

  @override
  String get note_ssdtUPRW =>
      '• Alternative to GPRW patch to prevent instant wake';

  @override
  String get remark_ssdtLID => 'Fixes laptop lid sleep/wake issues';

  @override
  String get note_ssdtLID =>
      '• Ensures the system correctly enters sleep when the lid is closed and wakes when opened';

  @override
  String get remark_ssdtWakeScreen => 'Fixes screen not waking up after sleep';

  @override
  String get note_ssdtWakeScreen =>
      '• Injects a power button press to wake the screen';

  @override
  String get remark_ssdtLED => 'Fixes laptop LED status indicators after wake';

  @override
  String get note_ssdtLED =>
      '• Fixes breathing light and power button LED on Lenovo laptops after wake';

  @override
  String get remark_ssdtS3Disable =>
      'Disables S3 sleep state (Fixes crash, reboot or shutdown on wake)';

  @override
  String get note_ssdtS3Disable =>
      '• Disables macOS S3 sleep state to prevent crashes on wake\n• Requires _S3 to XS3 rename patch';

  @override
  String get remark_ssdtFACP =>
      'Changes warm reboot to cold reboot, fixes disabled hardware';

  @override
  String get note_ssdtFACP =>
      '• Changes warm reboot to cold reboot\n• Fixes issues where Wi-Fi, Bluetooth or Audio are disabled after rebooting from Windows to macOS';

  @override
  String get remark_ssdtGPUSPOOF => 'Spoofs GPU';

  @override
  String get note_ssdtGPUSPOOF =>
      '• Modifies device ID for unsupported AMD GPUs (like RX 550 Lexa, RX 6650XT) to a supported model to enable acceleration';

  @override
  String get remark_ssdtPCIDISABLE =>
      'Disables PCI devices (unsupported GPUs, NVMe SSDs, etc.)';

  @override
  String get note_ssdtPCIDISABLE =>
      '• Disables unsupported PCIe devices like discrete GPUs or specific NVMe drives via ACPI';

  @override
  String get remark_ssdtRMNE =>
      'Spoofs Ethernet device (For laptops without Ethernet)';

  @override
  String get note_ssdtRMNE =>
      '• Injects a NullEthernet device (en0)\n• Required for Apple services (iMessage, Facetime, iCloud) on laptops without an Ethernet port';

  @override
  String get remark_ssdtGPI0 => 'Fixes I2C trackpad issues (Laptops)';

  @override
  String get note_ssdtGPI0 =>
      '• Enables the GPI0 device in ACPI for macOS\n• Required for many I2C trackpads to function correctly';

  @override
  String get remark_ssdtCPUR =>
      'CPU rename for B850, B650, B550, A520 chipsets (Ryzen only)';

  @override
  String get note_ssdtCPUR =>
      '• Renames AMD CPU in ACPI to fix boot crashes on newer AMD chipsets';

  @override
  String get remark_ssdtPLUGALT =>
      'Power management fix (Intel 12th Gen+ and some AMD Ryzen)';

  @override
  String get note_ssdtPLUGALT =>
      '• Injects plugin-type=1 on newer processors\n• Required for macOS CPU power management on Intel Alder Lake and newer, and some AMD platforms';

  @override
  String get remark_ssdtAWAC => 'Disables AWAC (Modern Timer) (Intel 8th Gen+)';

  @override
  String get note_ssdtAWAC =>
      '• Disables the modern AWAC timer and enables the legacy RTC\n• Required on Intel Coffee Lake (8th Gen) and newer';

  @override
  String get remark_ssdtUNC =>
      'Required for native X99 (C612) and most X79 (C602) motherboards';

  @override
  String get note_ssdtUNC =>
      '• Disables unused devices in ACPI to prevent IOPCIFamily kernel panics on X99/X79 boards';

  @override
  String get remark_ssdtRTC0RANGE =>
      'Enables/spoofs legacy RTC timer and fixes RTC range (X99 and X299)';

  @override
  String get note_ssdtRTC0RANGE =>
      '• Enables legacy RTC timer and fixes RTC range errors on X99 and X299 boards';

  @override
  String get remark_ssdtDTGP => 'Adds DTGP support';

  @override
  String get note_ssdtDTGP =>
      '• Injects hardware properties for GPUs, audio, Thunderbolt cards';

  @override
  String get remark_ssdtDMAC => 'Spoofs a standard DMA controller';

  @override
  String get note_ssdtDMAC =>
      '• Spoofs a standard DMA Controller (PNP0200)\n• Completes ACPI resource table for LPC bus and DMA';

  @override
  String get remark_ssdtPWRB => 'Spoofs a standard PWRB controller';

  @override
  String get note_ssdtPWRB =>
      '• Spoofs a Power Button (PNP0C0C) device\n• Ensures macOS correctly identifies the power button for sleep/wake';

  @override
  String get remark_ssdtSLPB => 'Spoofs a standard SLPB controller';

  @override
  String get note_ssdtSLPB =>
      '• Spoofs a Sleep Button (PNP0C0E) device\n• Ensures macOS correctly identifies the sleep button';

  @override
  String get remark_ssdtMEM2 => 'Spoofs MEM2 device required for iGPU';

  @override
  String get note_ssdtMEM2 =>
      '• Adds MEM2 ACPI device required for Intel integrated graphics on Haswell to Kaby Lake';

  @override
  String get corePatches => 'Core Patches';

  @override
  String get corePatchesRemark =>
      'Essential patches for normal system boot and power management';

  @override
  String get functionPatches => 'Function Patches';

  @override
  String get functionPatchesRemark =>
      'Patches providing additional functions or fixing specific issues';

  @override
  String get devicePatches => 'Device Patches';

  @override
  String get devicePatchesRemark => 'Patches specifically for GPU hardware';

  @override
  String get specialPatches => 'Special Patches';

  @override
  String get specialPatchesRemark =>
      'Patches required only for specific motherboards or architectures';

  @override
  String get sleepPatches => 'Sleep Patches';

  @override
  String get sleepPatchesRemark => 'Optional, used to fix sleep/wake issues';

  @override
  String get auxiliaryPatches => 'Auxiliary Patches';

  @override
  String get auxiliaryPatchesRemark =>
      'Optional, completes ACPI structure or enhances compatibility';

  @override
  String get prebuiltPatches => 'Prebuilt Patches';

  @override
  String get languagePortuguese => '葡萄牙语';

  @override
  String get ssdtMsg500 => 'Device ACPI path:';

  @override
  String get ssdtMsg501 =>
      'Select the graphics card device to be counterfeited';

  @override
  String get ssdtMsg502 => 'Unknown graphics card model';

  @override
  String get ssdtMsg503 => 'Counterfeit graphics card ID database:';

  @override
  String ssdtMsg504(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg505 => 'For example: 73BF';

  @override
  String get ssdtMsg506 => 'Requires 4 hexadecimal characters';

  @override
  String ssdtMsg507(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg508 => 'Optional, graphics card name';

  @override
  String get ssdtMsg509 => 'Counterfeit graphics card ID:';

  @override
  String get ssdtMsg510 => 'Counterfeit graphics card name:';

  @override
  String ssdtMsg511(String arg0) {
    return 'Whether to delete the source .dsl file: $arg0';
  }

  @override
  String ssdtMsg512(String arg0) {
    return 'Whether to force compilation: $arg0';
  }

  @override
  String ssdtMsg513(String arg0) {
    return 'Whether to overwrite the target EFI: $arg0';
  }

  @override
  String ssdtMsg514(String arg0) {
    return 'Match pattern: $arg0';
  }

  @override
  String ssdtMsg515(String arg0) {
    return 'Failed to load HPET data: $arg0';
  }

  @override
  String ssdtMsg516(String arg0) {
    return 'Failed to initialize HPET data: $arg0';
  }

  @override
  String ssdtMsg517(String arg0) {
    return 'Failed to initialize ACPI path: $arg0';
  }

  @override
  String get ssdtMsg518 => 'No patch notes';

  @override
  String get ssdtMsg519 => 'No patch notes';

  @override
  String ssdtMsg520(String arg0) {
    return 'Failed to get patch notes: $arg0';
  }

  @override
  String get ssdtMsg521 => 'Failed to get patch notes';

  @override
  String ssdtMsg522(String arg0) {
    return '$arg0 Clear configuration path';
  }

  @override
  String ssdtMsg523(String arg0, String arg1) {
    return '$arg0 selected an invalid file: $arg1';
  }

  @override
  String ssdtMsg524(String arg0) {
    return 'No patch configuration found for $arg0';
  }

  @override
  String get ssdtMsg525 =>
      'Please select the SSDT that needs to be customized before proceeding!';

  @override
  String ssdtMsg526(String arg0) {
    return 'Failed to execute patch: $arg0';
  }

  @override
  String ssdtMsg527(String arg0, String arg1) {
    return 'Failed to execute patch [$arg0]: $arg1';
  }

  @override
  String get ssdtMsg528 =>
      'SSDT is being generated, please do not repeat the operation!';

  @override
  String get ssdtMsg529 => 'The patch list is empty!';

  @override
  String get ssdtMsg530 =>
      'Extraction is in progress, please do not repeat the operation!';

  @override
  String ssdtMsg531(String arg0) {
    return 'The ACPI table extracted by the current $arg0 platform is very likely to be contaminated by ACPI patches injected by OpenCore and others. It is strongly recommended to operate on the Windows/Linux platform!';
  }

  @override
  String get ssdtMsg532 => 'Failed to extract ACPI!';

  @override
  String get ssdtMsg533 => 'Extraction of ACPI successful!';

  @override
  String ssdtMsg534(String arg0) {
    return 'Failed to prepare patch: $arg0';
  }

  @override
  String ssdtMsg535(String arg0) {
    return 'Failed to load DSDT/ACPI: $arg0';
  }

  @override
  String ssdtMsg536(String arg0) {
    return 'The config.plist file does not exist: $arg0';
  }

  @override
  String get ssdtMsg537 => 'Unrecognized plist file format';

  @override
  String ssdtMsg538(String arg0) {
    return 'The config.plist type is \"$arg0\"';
  }

  @override
  String ssdtMsg539(String arg0) {
    return 'Failed to parse plist type: $arg0';
  }

  @override
  String get ssdtMsg540 => 'Please select the ACPIs directory first!';

  @override
  String get ssdtMsg541 =>
      'Please select the config.plist file in the EFI directory first!';

  @override
  String ssdtMsg542(String arg0) {
    return 'Invalid ACPI path: $arg0';
  }

  @override
  String ssdtMsg543(String arg0) {
    return 'The config.plist file does not exist: $arg0';
  }

  @override
  String ssdtMsg544(String arg0) {
    return 'Failed to merge plist files: $arg0';
  }

  @override
  String get ssdtMsg545 => 'yes';

  @override
  String get ssdtMsg546 => 'no';

  @override
  String get ssdtMsg547 => 'yes';

  @override
  String get ssdtMsg548 => 'no';

  @override
  String get ssdtMsg549 => 'yes';

  @override
  String get ssdtMsg550 => 'no';

  @override
  String get ssdtMsg551 => 'built-in';

  @override
  String get ssdtMsg552 => 'remote';

  @override
  String get ssdtMsg553 => 'New version of iasl';

  @override
  String get ssdtMsg554 => 'Old version iasl-legacy';

  @override
  String get ssdtMsg555 => 'yes';

  @override
  String get ssdtMsg556 => 'no';

  @override
  String get ssdtMsg557 => 'Preferences';

  @override
  String get ssdtMsg558 => 'iasl mode';

  @override
  String get ssdtMsg559 => 'iasl compilation type';

  @override
  String get ssdtMsg560 => 'Delete decompiled .dsl files';

  @override
  String get ssdtMsg561 => 'Force compilation';

  @override
  String get ssdtMsg562 => 'Whether to overwrite the target EFI';

  @override
  String get ssdtMsg563 => 'ACPI matching mode';

  @override
  String get ssdtMsg564 => 'core patch';

  @override
  String get ssdtMsg565 => 'Feature patches';

  @override
  String get ssdtMsg566 => 'Device patches';

  @override
  String get ssdtMsg567 => 'dedicated patch';

  @override
  String get ssdtMsg568 => 'sleep patch';

  @override
  String get ssdtMsg569 => 'Auxiliary patches';

  @override
  String get ssdtMsg570 => 'Pre-made patches';

  @override
  String get ssdtMsg571 =>
      'Basic patches necessary for normal system startup and power management';

  @override
  String get ssdtMsg572 =>
      'Patches that provide additional functionality or fix feature issues';

  @override
  String get ssdtMsg573 => 'Patches for graphics card hardware';

  @override
  String get ssdtMsg574 =>
      'Patches only required on specific motherboards or architectures';

  @override
  String get ssdtMsg575 => 'Optional, used to fix sleep problems';

  @override
  String get ssdtMsg576 =>
      'Not required, but can complete the ACPI structure or enhance compatibility';

  @override
  String get ssdtMsg577 => 'Select DMAR';

  @override
  String get ssdtMsg578 =>
      'Please select the DMAR table that needs to be customized';

  @override
  String get ssdtMsg579 => 'Select APIC';

  @override
  String get ssdtMsg580 =>
      'Please select the APIC table that needs to be customized';

  @override
  String get ssdtMsg581 => 'Select FACP';

  @override
  String get ssdtMsg582 => 'Please select FACP form';

  @override
  String get ssdtMsg583 => 'Select FACP';

  @override
  String get ssdtMsg584 => 'Please select FACP form';

  @override
  String get ssdtMsg585 => 'log';

  @override
  String get ssdtMsg586 => 'clear log';

  @override
  String get ssdtMsg587 => 'Export log';

  @override
  String get ssdtMsg588 => 'Pre-made patches';

  @override
  String get ssdtMsg589 => 'Execute patch';

  @override
  String get ssdtMsg590 => 'Please select a file/directory';

  @override
  String get ssdtMsg591 => 'Extract ACPI';

  @override
  String get ssdtMsg592 => 'output directory';

  @override
  String get ssdtMsg593 => 'Please select DSDT file or ACPIs directory';

  @override
  String get ssdtMsg594 => 'Select ACPIs';

  @override
  String get ssdtMsg595 => 'Merge config';

  @override
  String get ssdtMsg596 => 'Select config';

  @override
  String get ssdtMsg597 => 'Please select the config.plist file';

  @override
  String get ssdtMsg598 => 'Preferences';

  @override
  String get ssdtMsg599 => 'Platform patches';

  @override
  String get ssdtMsg600 => 'Patch guide';

  @override
  String get ssdtMsg601 => 'About the application';

  @override
  String ssdtMsg602(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String get ssdtMsg603 => 'Select patch';

  @override
  String get ssdtMsg604 => 'Desktop';

  @override
  String get ssdtMsg605 => 'server';

  @override
  String get ssdtMsg606 =>
      'SSDT is being generated, please do not repeat the operation!';

  @override
  String get ssdtMsg607 => 'No SSDT selected';

  @override
  String ssdtMsg608(String arg0, String arg1) {
    return '$arg0 $arg1';
  }

  @override
  String ssdtMsg609(String arg0, String arg1) {
    return '$arg0 list: $arg1';
  }

  @override
  String get ssdtMsg610 => 'Prefabricated SSDT';

  @override
  String get ssdtMsg611 => 'Custom SSDT';

  @override
  String get ssdtMsg612 => 'CPU type:';

  @override
  String get ssdtMsg613 => 'Platform type:';

  @override
  String get ssdtMsg614 => 'Desktop';

  @override
  String get ssdtMsg615 => 'Desktop';

  @override
  String get ssdtMsg616 => 'notebook';

  @override
  String get ssdtMsg617 => 'notebook';

  @override
  String get ssdtMsg618 => 'Mini host';

  @override
  String get ssdtMsg619 => 'Mini host';

  @override
  String get ssdtMsg620 => 'server';

  @override
  String get ssdtMsg621 => 'server';

  @override
  String ssdtMsg622(String arg0) {
    return 'Currently selected SSDT list: $arg0';
  }

  @override
  String get ssdtMsg623 => 'Platform information:';

  @override
  String get ssdtMsg624 => 'Check all';

  @override
  String get ssdtMsg625 => 'Core (official recommendation)';

  @override
  String get ssdtMsg626 => 'Recommend (function fix)';

  @override
  String get ssdtMsg627 => 'Optional (complete with functions)';

  @override
  String get ssdtMsg628 => 'Platform information:';

  @override
  String get ssdtMsg629 => 'Prefabricated SSDT';

  @override
  String get ssdtMsg630 => 'Custom SSDT';

  @override
  String get ssdtMsg631 => 'Custom SSDT';

  @override
  String get ssdtMsg632 => 'Prefabricated SSDT';

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
  String get ssdtMsg636 => 'Visit GitHub';

  @override
  String get ssdtMsg637 => 'Download now';

  @override
  String get ssdtMsg638 => 'closure';

  @override
  String get ssdtMsg639 => 'new version found';

  @override
  String get ssdtMsg640 => 'Version number:';

  @override
  String get ssdtMsg641 => 'Release time:';

  @override
  String get ssdtMsg642 => 'Connection to server timed out';

  @override
  String get ssdtMsg643 => 'Connection to server timed out';

  @override
  String get ssdtMsg644 => 'Download canceled';

  @override
  String get ssdtMsg645 => 'Download canceled';

  @override
  String get ssdtMsg646 => 'Read response timeout';

  @override
  String get ssdtMsg647 => 'Read response timeout';

  @override
  String ssdtMsg648(String arg0) {
    return 'An exception occurred while obtaining server information! Status code: $arg0';
  }

  @override
  String ssdtMsg649(String arg0) {
    return 'Request failed, status code: $arg0';
  }

  @override
  String ssdtMsg650(String arg0) {
    return 'Download timed out, no progress for $arg0 seconds, task canceled';
  }

  @override
  String ssdtMsg651(String arg0) {
    return 'Log channel does not exist: $arg0';
  }

  @override
  String ssdtMsg652(String arg0, String arg1, String arg2) {
    return 'Export successful! File path: $arg0$arg1$arg2';
  }

  @override
  String ssdtMsg653(String arg0) {
    return 'Export failed! Error message: $arg0';
  }

  @override
  String ssdtMsg654(String arg0) {
    return 'File does not exist! Export failed! File path: $arg0';
  }

  @override
  String ssdtMsg655(String arg0) {
    return 'Log file initialization failed: $arg0';
  }

  @override
  String get ssdtMsg656 => 'unknown';

  @override
  String get ssdtMsg657 => 'loosest';

  @override
  String get ssdtMsg658 => 'length only';

  @override
  String get ssdtMsg659 => 'Table ID and length, disable normalized headers';

  @override
  String get ssdtMsg660 => 'Table ID and length, enable normalized headers';

  @override
  String get ssdtMsg661 =>
      'Intel 1st generation Arrandale, 2nd generation Sandy Bridge, 3rd generation Ivy Bridge';

  @override
  String get ssdtMsg662 =>
      'Intel 4th generation Haswell, 5th generation Broadwell';

  @override
  String get ssdtMsg663 =>
      'Intel 6th generation Skylake, 7th generation Kaby Lake, some 4th generation Haswell';

  @override
  String get ssdtMsg664 =>
      'Custom brightness, usually used for some non-standard equipment or special needs settings';

  @override
  String get ssdtMsg665 =>
      'Custom brightness, usually used for some non-standard equipment or special needs settings';

  @override
  String get ssdtMsg666 =>
      'Intel 8th generation CoffeeLake ~ 10th generation, and AMD notebooks';

  @override
  String get ssdtMsg667 =>
      'Others (requires custom applbkl-name / applbkl-data device properties), may not be supported';

  @override
  String ssdtMsg668(String arg0) {
    return 'Table does not exist: $arg0';
  }

  @override
  String ssdtMsg669(String arg0) {
    return 'Incoming data length is less than 4 bytes: $arg0';
  }

  @override
  String ssdtMsg670(String arg0) {
    return 'File content is less than 4 bytes: $arg0';
  }

  @override
  String ssdtMsg671(String arg0, String arg1) {
    return 'Error reading signature: $arg0, file path: $arg1';
  }

  @override
  String ssdtMsg672(String arg0) {
    return 'Temporary directory has been created at: $arg0';
  }

  @override
  String ssdtMsg673(String arg0) {
    return 'Temporary directory already exists at: $arg0';
  }

  @override
  String ssdtMsg674(String arg0) {
    return 'Decompiling $arg0 file...';
  }

  @override
  String get ssdtMsg675 => 'Decompiling SSDT.aml files in batches...';

  @override
  String get ssdtMsg676 =>
      'Decompiling DSDT.aml and SSDT.aml files in batches...';

  @override
  String ssdtMsg677(String arg0) {
    return '=> $arg0 decompilation failed!';
  }

  @override
  String ssdtMsg678(String arg0) {
    return '=> $arg0 decompiled successfully!';
  }

  @override
  String ssdtMsg679(String arg0) {
    return '=> $arg0 decompiled successfully!';
  }

  @override
  String ssdtMsg680(String arg0) {
    return '=> $arg0 decompiled successfully!';
  }

  @override
  String get ssdtMsg681 => 'Decompiling failed .aml files individually...';

  @override
  String ssdtMsg682(String arg0) {
    return '=> $arg0 decompiled successfully!';
  }

  @override
  String ssdtMsg683(String arg0) {
    return '=> $arg0 decompilation failed!';
  }

  @override
  String get ssdtMsg684 => 'Decompiling other .aml files...';

  @override
  String ssdtMsg685(String arg0) {
    return '=> $arg0 decompiled successfully!';
  }

  @override
  String get ssdtMsg686 =>
      'Note: Try not to include Chinese or special characters in the path or file name, otherwise it may cause unexpected problems!';

  @override
  String ssdtMsg687(String arg0) {
    return 'An error occurred: $arg0';
  }

  @override
  String ssdtMsg688(String arg0, String arg1) {
    return 'An error occurred when processing paths in the getDevicePathsWithId method $arg0: $arg1';
  }

  @override
  String ssdtMsg689(String arg0) {
    return 'Skip: $arg0, which has been decompiled correctly before!';
  }

  @override
  String ssdtMsg690(String arg0) {
    return 'Target file is in exclude list: $arg0';
  }

  @override
  String ssdtMsg691(String arg0) {
    return 'Invalid path: $arg0';
  }

  @override
  String get ssdtMsg692 => 'Invalid path';

  @override
  String ssdtMsg693(String arg0) {
    return 'No valid .aml or .dat file found at $arg0!';
  }

  @override
  String get ssdtMsg694 => 'No valid .aml or .dat file found';

  @override
  String ssdtMsg695(String arg0) {
    return 'Decompilation failed: $arg0';
  }

  @override
  String get ssdtMsg696 =>
      'The acpidump tool is not ready! Operation terminated!';

  @override
  String get ssdtMsg697 => 'Exporting ACPI tables...';

  @override
  String get ssdtMsg698 => 'The current platform does not support it!';

  @override
  String get ssdtMsg699 => 'Waiting for sudo password authorization...';

  @override
  String get platformName1000 => 'Generation 0-Penryn-775 platform';

  @override
  String get platformName1001 => 'Generation 0-Penryn-Notebook';

  @override
  String get platformName1002 => 'Generation 0-Penryn-mini host';

  @override
  String get platformName1003 =>
      '10th Generation-Cascade Lake-X&W-X599 Platform';

  @override
  String get platformName1004 => '10th Generation-Comet Lake-1200 Platform';

  @override
  String get platformName1005 => '10th Generation-Comet Lake-Laptop';

  @override
  String get platformName1006 => '10th generation-Comet Lake-mini host';

  @override
  String get platformName1007 => '10th Generation-Ice Lake-Laptop';

  @override
  String get platformName1008 => '10th generation-Ice Lake-mini host';

  @override
  String get platformName1009 => '11th generation-Rocket Lake-1200 platform';

  @override
  String get platformName1010 => '11th Generation-Rocket Lake-Laptop';

  @override
  String get platformName1011 => '11th generation-Tiger Lake-mini host';

  @override
  String get platformName1012 => '12th generation-Alder Lake-1700 platform';

  @override
  String get platformName1013 => '12th generation-Alder Lake-notebook';

  @override
  String get platformName1014 => '12th generation-Alder Lake-mini host';

  @override
  String get platformName1015 => '13th generation-Raptor Lake-1700 platform';

  @override
  String get platformName1016 => '13th generation-Raptor Lake-notebook';

  @override
  String get platformName1017 => '13th generation-Raptor Lake-mini host';

  @override
  String get platformName1018 => '14th generation-Raptor Lake-1700 platform';

  @override
  String get platformName1019 => '14th generation-Raptor Lake-notebook';

  @override
  String get platformName1020 => '14th generation-Raptor Lake-mini host';

  @override
  String get platformName1021 => '15th Generation-Arrow Lake-1851 Platform';

  @override
  String get platformName1022 => '15th generation-Arrow Lake-notebook';

  @override
  String get platformName1023 => '15th generation-Arrow Lake-mini host';

  @override
  String get platformName1024 => 'Generation 1-Arrandale-Notebook';

  @override
  String get platformName1025 => 'Generation 1-Arrandale-mini host';

  @override
  String get platformName1026 => 'Generation 1-Lynnfield-1156 Platform';

  @override
  String get platformName1027 => 'Generation 1-Nehalem&Westmere-X58 platform';

  @override
  String get platformName1028 => '2nd generation-Sandy Bridge-1155 platform';

  @override
  String get platformName1029 => '2nd generation-Sandy Bridge-E-X79 platform';

  @override
  String get platformName1030 => '2nd generation-Sandy Bridge-notebook';

  @override
  String get platformName1031 => '2nd generation-Sandy Bridge-mini host';

  @override
  String get platformName1032 => '3rd generation-Ivy Bridge-1155 platform';

  @override
  String get platformName1033 => '3rd generation-Ivy Bridge-E-X79 platform';

  @override
  String get platformName1034 => '3rd generation-Ivy Bridge-notebook';

  @override
  String get platformName1035 => '3rd generation-Ivy Bridge-mini host';

  @override
  String get platformName1036 => '4th generation-Haswell-1150 platform';

  @override
  String get platformName1037 => '4th generation-Haswell-E-X99 platform';

  @override
  String get platformName1038 => '4th Generation-Haswell-Laptop';

  @override
  String get platformName1039 => '4th generation-Haswell-mini host';

  @override
  String get platformName1040 => '5th generation-Broadwell-1150 platform';

  @override
  String get platformName1041 => '5th generation-Broadwell-E-X99 platform';

  @override
  String get platformName1042 => '5th generation-Broadwell-notebook';

  @override
  String get platformName1043 => '5th generation-Broadwell-mini host';

  @override
  String get platformName1044 => '6th generation-Skylake-1151 platform';

  @override
  String get platformName1045 => '6th generation-Skylake-X&W-X299 platform';

  @override
  String get platformName1046 => '6th generation-Skylake-notebook';

  @override
  String get platformName1047 => '6th generation-Skylake-mini host';

  @override
  String get platformName1048 => '7th Generation-Kaby Lake-1151 Platform';

  @override
  String get platformName1049 => '7th Generation-Kaby Lake-Notebook';

  @override
  String get platformName1050 => '7th generation-Kaby Lake-mini host';

  @override
  String get platformName1051 => '8th generation-Coffee Lake-1151 platform';

  @override
  String get platformName1052 => '8th Generation-Coffee Lake-Notebook';

  @override
  String get platformName1053 => '8th generation-Coffee Lake-mini host';

  @override
  String get platformName1054 => '9th generation-Coffee Lake-1151 platform';

  @override
  String get platformName1055 => '9th Generation-Coffee Lake-Notebook';

  @override
  String get platformName1056 => '9th generation-Coffee Lake-mini host';

  @override
  String get platformName1057 => 'Bulldozer(15h) and Jaguar(16h)';

  @override
  String get platformName1058 => 'Bulldozer(15h) and Jaguar(16h)-Notebook';

  @override
  String get platformName1059 => 'Bulldozer(15h) and Jaguar(16h)-mini host';

  @override
  String get platformName1060 => 'Ryzen and Threadripper(17h and 19h)';

  @override
  String get platformName1061 =>
      'Ryzen and Threadripper(17h and 19h)-high-end servers';

  @override
  String get platformName1062 => 'Ryzen-notebook';

  @override
  String get platformName1063 => 'Ryzen-mini host';

  @override
  String get platformName1064 => 'server';

  @override
  String get platformName1065 => 'notebook';

  @override
  String get platformName1066 => 'Mini host';
}
