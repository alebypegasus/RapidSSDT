import 'package:rapidssdt/l10n/l10n_helper.dart';
//  table.dart
//  Created by JeoJay127
//
extension MapExtension on Map<String, dynamic> {
  String get name => this['name'] ?? '';
}

class ACPITable {
  static const ssdtHPET = {
    'name': 'SSDT-HPET',
    'remark': l10nGlobal.msg_36e505,
    'note': l10nGlobal.msg_d42a42,
  };

  static const ssdtECUSBXDesktop = {
    'name': 'SSDT-EC-USBX-DESKTOP',
    'remark': l10nGlobal.msg_766811,
    'note': l10nGlobal.msg_b32c88,
  };

  static const ssdtECUSBXLaptop = {
    'name': 'SSDT-EC-USBX-LAPTOP',
    'remark': l10nGlobal.msg_6208bc,
    'note': l10nGlobal.msg_6aa5c4,
  };

  static const ssdtECDesktop = {
    'name': 'SSDT-EC-DESKTOP',
    'remark': l10nGlobal.msg_6cb5f9,
    'note': l10nGlobal.msg_934f2f,
  };

  static const ssdtECLaptop = {
    'name': 'SSDT-EC-LAPTOP',
    'remark': l10nGlobal.msg_64650a,
    'note': l10nGlobal.msg_3533b7,
  };

  static const ssdtUSBX = {
    'name': 'SSDT-USBX',
    'remark': l10nGlobal.msg_cab9af,
    'note': l10nGlobal.msg_376392,
  };

  static const ssdtPLUG = {
    'name': 'SSDT-PLUG',
    'remark': l10nGlobal.msg_35a396,
    'note': l10nGlobal.msg_6d1e2e,
  };

  static const ssdtPMC = {
    'name': 'SSDT-PMC',
    'remark': l10nGlobal.msg_4d1f71,
    'note': l10nGlobal.msg_84f5f0,
  };

  static const ssdtPNLF = {
    'name': 'SSDT-PNLF',
    'remark': l10nGlobal.msg_3881da,
    'note': l10nGlobal.msg_fa12d7,
  };

  static const ssdtALS0 = {
    'name': 'SSDT-ALS0',
    'remark': l10nGlobal.msg_b98498,
    'note': l10nGlobal.msg_79a407,
  };

  static const ssdtXOSI = {
    'name': 'SSDT-XOSI',
    'remark': l10nGlobal.msg_10158d,
    'note': l10nGlobal.msg_95d511,
  };

  static const ssdtRHUB = {
    'name': 'SSDT-RHUB',
    'remark': l10nGlobal.msg_b8c02c,
    'note': l10nGlobal.msg_482188,
  };

  static const ssdtBridge = {
    'name': 'SSDT-Bridge',
    'remark': l10nGlobal.msg_fcf38e,
    'note': l10nGlobal.msg_85458c,
  };

  static const ssdtDMAR = {
    'name': 'SSDT-DMAR',
    'remark': l10nGlobal.msg_98bc31,
    'note': l10nGlobal.msg_a62c48,
  };

  static const ssdtAPIC = {
    'name': 'SSDT-APIC',
    'remark': l10nGlobal.msg_be07d2,
    'note': l10nGlobal.msg_e2ca40,
  };

  static const ssdtSBUSMCHC = {
    'name': 'SSDT-SBUS-MCHC',
    'remark': l10nGlobal.msg_c8e1cf,
    'note': l10nGlobal.msg_8d71eb,
  };

  static const ssdtIMEI = {
    'name': 'SSDT-IMEI',
    'remark': l10nGlobal.msg_e386d5,
    'note': l10nGlobal.msg_56c4a4,
  };

  static const ssdtFixShutdown = {
    'name': 'SSDT-FixShutdown',
    'remark': l10nGlobal.msg_3ec739,
    'note': l10nGlobal.msg_c635c2,
  };

  static const checkSystemState = {
    'name': 'Check-System-State',
    'remark': l10nGlobal.msg_a17700,
    'note': l10nGlobal.msg_498046,
  };

  static const checkAOAC = {
    'name': 'Check-AOAC',
    'remark': l10nGlobal.msg_586912,
    'note': l10nGlobal.msg_c0b1c5,
  };

  static const ssdtGPRW = {
    'name': 'SSDT-GPRW',
    'remark': l10nGlobal.msg_d5028c,
    'note': l10nGlobal.msg_b8a729,
  };

  static const ssdtUPRW = {
    'name': 'SSDT-UPRW',
    'remark': l10nGlobal.msg_d5028c,
    'note': l10nGlobal.msg_dd8954,
  };
  static const ssdtLID = {
    'name': 'SSDT-LID',
    'remark': l10nGlobal.msg_6d11c7,
    'note': l10nGlobal.msg_fd4b7e,
  };

  static const ssdtWakeScreen = {
    'name': 'SSDT-WakeScreen',
    'remark': l10nGlobal.msg_11bfb1,
    'note': l10nGlobal.msg_e8b9b4,
  };

  static const ssdtLED = {
    'name': 'SSDT-LED',
    'remark': l10nGlobal.msg_c34ae3,
    'note': l10nGlobal.msg_b78115,
  };

  static const ssdtS3Disable = {
    'name': 'SSDT-S3-DISABLE',
    'remark': l10nGlobal.msg_44e1f8,
    'note': l10nGlobal.msg_ef497f,
  };

  static const ssdtFACP = {
    'name': 'SSDT-FACP',
    'remark': l10nGlobal.msg_4dc9ea,
    'note': l10nGlobal.msg_f61bb7,
  };

  static const ssdtGPUSPOOF = {
    'name': 'SSDT-GPU-SPOOF',
    'remark': l10nGlobal.msg_85c749,
    'note': l10nGlobal.msg_1dca11,
  };

  static const ssdtPCIDISABLE = {
    'name': 'SSDT-PCI-DISABLE',
    'remark': l10nGlobal.msg_83ce79,
    'note': l10nGlobal.msg_42ee86,
  };

  static const ssdtRMNE = {
    'name': 'SSDT-RMNE',
    'remark': l10nGlobal.msg_cf09ed,
    'note': l10nGlobal.msg_251c44,
  };

  static const ssdtGPI0 = {
    'name': 'SSDT-GPI0',
    'remark': l10nGlobal.msg_4a5131,
    'note': l10nGlobal.msg_e24ece,
  };

  static const ssdtCPUR = {
    'name': 'SSDT-CPUR',
    'remark': l10nGlobal.msg_c0f4e5,
    'note': l10nGlobal.msg_37355c,
  };

  static const ssdtPLUGALT = {
    'name': 'SSDT-PLUG-ALT',
    'remark': l10nGlobal.msg_8486b0,
    'note': l10nGlobal.msg_edcdf4,
  };

  static const ssdtAWAC = {
    'name': 'SSDT-AWAC',
    'remark': l10nGlobal.msg_cbb7b4,
    'note': l10nGlobal.msg_728f94,
  };

  static const ssdtUNC = {
    'name': 'SSDT-UNC',
    'remark': l10nGlobal.msg_ff44e3,
    'note': l10nGlobal.msg_cddd8e,
  };

  static const ssdtRTC0RANGE = {
    'name': 'SSDT-RTC0-RANGE',
    'remark': l10nGlobal.msg_73bd6f,
    'note': l10nGlobal.msg_aa4c4a,
  };

  static const ssdtDTGP = {
    'name': 'SSDT-DTGP',
    'remark': l10nGlobal.msg_24ca31,
    'note': l10nGlobal.msg_471c01,
  };

  static const ssdtDMAC = {
    'name': 'SSDT-DMAC',
    'remark': l10nGlobal.msg_72123a,
    'note': l10nGlobal.msg_47714f,
  };

  static const ssdtPWRB = {
    'name': 'SSDT-PWRB',
    'remark': l10nGlobal.msg_558ec3,
    'note': l10nGlobal.msg_fa5bcb,
  };

  static const ssdtSLPB = {
    'name': 'SSDT-SLPB',
    'remark': l10nGlobal.msg_2076fe,
    'note': l10nGlobal.msg_efe90c,
  };

  static const ssdtMEM2 = {
    'name': 'SSDT-MEM2',
    'remark': l10nGlobal.msg_6ac38d,
    'note': l10nGlobal.msg_15d318,
  };
}
