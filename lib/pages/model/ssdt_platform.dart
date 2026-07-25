//  ssdt_platform.dart
//  Created by JeoJay127
//
// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:rapidssdt/utils/ssdttool/table.dart';

class SsdtPlatform {
  static Map<String, Map<String, dynamic>> platform_intel_desktop = {
    '0 Gen - Penryn (775)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [ACPITable.ssdtHPET],
      'optional': optional_sstds_intel_desktop,
    },
    '1 Gen - Lynnfield (1156)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [ACPITable.ssdtHPET],
      'optional': optional_sstds_intel_desktop,
    },
    '2 Gen - Sandy Bridge (1155)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [
        ACPITable.ssdtHPET,
        {...ACPITable.ssdtIMEI, 'extra': '3A1C'},
      ],
      'optional': optional_sstds_intel_desktop,
    },
    '3 Gen - Ivy Bridge (1155)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [
        ACPITable.ssdtHPET,
        {...ACPITable.ssdtIMEI, 'extra': '3A1E'},
        ACPITable.ssdtDMAR,
      ],
      'optional': optional_sstds_intel_desktop,
    },
    '4 Gen - Haswell (1150)': {
      'basic': [ACPITable.ssdtECDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_desktop, ACPITable.ssdtMEM2],
    },
    '5 Gen - Broadwell (1150)': {
      'basic': [ACPITable.ssdtECDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_desktop, ACPITable.ssdtMEM2],
    },
    '6 Gen - Skylake (1151)': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_desktop, ACPITable.ssdtMEM2],
    },
    '7 Gen - Kaby Lake (1151)': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_desktop, ACPITable.ssdtMEM2],
    },
    '8 Gen - Coffee Lake (1151)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtPMC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_desktop,
    },
    '9 Gen - Coffee Lake (1151)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtPMC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_desktop,
    },
    '10 Gen - Comet Lake (1200)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_desktop,
    },
    '11 Gen - Rocket Lake (1200)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_desktop,
    },
    '12 Gen - Alder Lake (1700)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
      ],
      'recommend': [
        ACPITable.ssdtRHUB,
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtDMAR,
      ],
      'optional': optional_sstds_intel_desktop,
    },
    '13 Gen - Raptor Lake (1700)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtPMC],
      'optional': optional_sstds_intel_desktop,
    },
    '14 Gen - Raptor Lake (1700)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtPMC],
      'optional': optional_sstds_intel_desktop,
    },
    '15 Gen - Arrow Lake (1851)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtPMC],
      'optional': optional_sstds_intel_desktop,
    },
  };

  static Map<String, Map<String, dynamic>> platform_intel_laptop = {
    '0 Gen - Penryn (Laptop)': {
      'basic': [
        ACPITable.ssdtECLaptop,
        {...ACPITable.ssdtPNLF, 'extra': 14},
      ],
      'recommend': [ACPITable.ssdtHPET],
      'optional': optional_sstds_intel_laptop,
    },
    '1 Gen - Arrandale (Laptop)': {
      'basic': [
        ACPITable.ssdtECLaptop,
        {...ACPITable.ssdtPNLF, 'extra': 14},
      ],
      'recommend': [ACPITable.ssdtHPET],
      'optional': optional_sstds_intel_laptop,
    },
    '2 Gen - Sandy Bridge (Laptop)': {
      'basic': [
        ACPITable.ssdtECLaptop,
        {...ACPITable.ssdtPNLF, 'extra': 14},
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        {...ACPITable.ssdtIMEI, 'extra': '3A1C'},
      ],
      'optional': optional_sstds_intel_laptop,
    },
    '3 Gen - Ivy Bridge (Laptop)': {
      'basic': [
        ACPITable.ssdtECLaptop,
        {...ACPITable.ssdtPNLF, 'extra': 14},
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        {...ACPITable.ssdtIMEI, 'extra': '3A1E'},
        ACPITable.ssdtALS0,
        ACPITable.ssdtDMAR,
      ],
      'optional': optional_sstds_intel_laptop,
    },
    '4 Gen - Haswell (Laptop)': {
      'basic': [
        ACPITable.ssdtECLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 15},
        ACPITable.ssdtXOSI,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtALS0, ACPITable.ssdtDMAR],
      'optional': [
        ACPITable.ssdtGPI0,
        ...optional_sstds_intel_laptop,
        ACPITable.ssdtMEM2,
      ],
    },
    '5 Gen - Broadwell (Laptop)': {
      'basic': [
        ACPITable.ssdtECLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 15},
        ACPITable.ssdtXOSI,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtALS0, ACPITable.ssdtDMAR],
      'optional': [
        ACPITable.ssdtGPI0,
        ...optional_sstds_intel_laptop,
        ACPITable.ssdtMEM2,
      ],
    },
    '6 Gen - Skylake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 16},
        ACPITable.ssdtXOSI,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtALS0, ACPITable.ssdtDMAR],
      'optional': [
        ACPITable.ssdtGPI0,
        ...optional_sstds_intel_laptop,
        ACPITable.ssdtMEM2,
      ],
    },
    '7 Gen - Kaby Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 16},
        ACPITable.ssdtXOSI,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtALS0, ACPITable.ssdtDMAR],
      'optional': [
        ACPITable.ssdtGPI0,
        ...optional_sstds_intel_laptop,
        ACPITable.ssdtMEM2,
      ],
    },
    '8 Gen - Coffee Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 19},
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '9 Gen - Coffee Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 19},
        ACPITable.ssdtAWAC,
        ACPITable.ssdtPMC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtALS0, ACPITable.ssdtDMAR],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '10 Gen - Comet Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 19},
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '10 Gen - Ice Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 19},
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
        ACPITable.ssdtRHUB,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '11 Gen - Rocket Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '12 Gen - Alder Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '13 Gen - Raptor Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '14 Gen - Raptor Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
    '15 Gen - Arrow Lake (Laptop)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtXOSI,
      ],
      'recommend': [
        ACPITable.ssdtHPET,
        ACPITable.ssdtPMC,
        ACPITable.ssdtALS0,
        ACPITable.ssdtRHUB,
        ACPITable.ssdtDMAR,
      ],
      'optional': [ACPITable.ssdtGPI0, ...optional_sstds_intel_laptop],
    },
  };

  static Map<String, Map<String, dynamic>> platform_intel_nuc = {
    '0 Gen - Penryn (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [ACPITable.ssdtHPET],
      'optional': optional_sstds_intel_nuc,
    },
    '1 Gen - Arrandale (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [ACPITable.ssdtHPET],
      'optional': optional_sstds_intel_nuc,
    },
    '2 Gen - Sandy Bridge (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [
        ACPITable.ssdtHPET,
        {...ACPITable.ssdtIMEI, 'extra': '3A1C'},
      ],
      'optional': optional_sstds_intel_nuc,
    },
    '3 Gen - Ivy Bridge (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [
        ACPITable.ssdtHPET,
        {...ACPITable.ssdtIMEI, 'extra': '3A1E'},
        ACPITable.ssdtDMAR,
      ],
      'optional': optional_sstds_intel_nuc,
    },
    '4 Gen - Haswell (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_nuc, ACPITable.ssdtMEM2],
    },
    '5 Gen - Broadwell (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_nuc, ACPITable.ssdtMEM2],
    },
    '6 Gen - Skylake (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_nuc, ACPITable.ssdtMEM2],
    },
    '7 Gen - Kaby Lake (NUC/Mini PC)': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': [...optional_sstds_intel_nuc, ACPITable.ssdtMEM2],
    },
    '8 Gen - Coffee Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtPMC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '9 Gen - Coffee Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtPNLF,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtPMC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '10 Gen - Comet Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '10 Gen - Ice Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
        ACPITable.ssdtRHUB,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '11 Gen - Tiger Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtAWAC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtRHUB, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '12 Gen - Alder Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtRHUB, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '13 Gen - Raptor Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtRHUB, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '14 Gen - Raptor Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtRHUB, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
    '15 Gen - Arrow Lake (NUC/Mini PC)': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUGALT,
        ACPITable.ssdtAWAC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtRHUB, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_nuc,
    },
  };

  static Map<String, Map<String, dynamic>> platform_intel_hedt = {
    '1 Gen - Nehalem&Westmere (X58)': {
      'basic': [ACPITable.ssdtECDesktop],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC],
      'optional': optional_sstds_intel_hedt,
    },
    '2代-Sandy Bridge-E-X79平台': {
      'basic': [ACPITable.ssdtECDesktop, ACPITable.ssdtUNC],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_hedt,
    },
    '3代-Ivy Bridge-E-X79平台': {
      'basic': [ACPITable.ssdtECDesktop, ACPITable.ssdtUNC],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_hedt,
    },
    '4代-Haswell-E-X99平台': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtRTC0RANGE,
        ACPITable.ssdtUNC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_hedt,
    },
    '5代-Broadwell-E-X99平台': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtRTC0RANGE,
        ACPITable.ssdtUNC,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_hedt,
    },
    '6代-Skylake-X&W-X299平台': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtRTC0RANGE,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_hedt,
    },
    '10代-Cascade Lake-X&W-X599平台': {
      'basic': [
        ACPITable.ssdtECUSBXDesktop,
        ACPITable.ssdtPLUG,
        ACPITable.ssdtRTC0RANGE,
      ],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtAPIC, ACPITable.ssdtDMAR],
      'optional': optional_sstds_intel_hedt,
    },
  };

  static Map<String, Map<String, dynamic>> platform_amd_desktop = {
    'Bulldozer(15h) and Jaguar(16h)': {
      'basic': [ACPITable.ssdtECUSBXDesktop],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_amd_desktop,
    },
    'Ryzen and Threadripper(17h and 19h)': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtCPUR, ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_amd_desktop,
    },
  };

  static Map<String, Map<String, dynamic>> platform_amd_laptop = {
    'Bulldozer(15h) and Jaguar(16h) - Laptop': {
      'basic': [ACPITable.ssdtECUSBXLaptop],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_amd_laptop,
    },
    'Ryzen - Laptop': {
      'basic': [
        ACPITable.ssdtECUSBXLaptop,
        ACPITable.ssdtPLUG,
        {...ACPITable.ssdtPNLF, 'extra': 19},
        ACPITable.ssdtXOSI,
      ],
      'recommend': [ACPITable.ssdtCPUR, ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_amd_laptop,
    },
  };

  static Map<String, Map<String, dynamic>> platform_amd_nuc = {
    'Bulldozer(15h) and Jaguar(16h)-NUC/Mini PC': {
      'basic': [ACPITable.ssdtECUSBXDesktop],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_amd_nuc,
    },
    'Ryzen-NUC/Mini PC': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtCPUR, ACPITable.ssdtHPET, ACPITable.ssdtDMAR],
      'optional': optional_sstds_amd_nuc,
    },
  };

  static Map<String, Map<String, dynamic>> platform_amd_hedt = {
    'Ryzen and Threadripper(17h and 19h) - High-End Server': {
      'basic': [ACPITable.ssdtECUSBXDesktop, ACPITable.ssdtPLUG],
      'recommend': [ACPITable.ssdtHPET, ACPITable.ssdtDMAR, ACPITable.ssdtCPUR],
      'optional': optional_sstds_amd_hedt,
    },
  };

  static Map<String, Map<String, Map<String, dynamic>>> platform_mapping = {
    'Intel': {
      '台式机': {'platform': platform_intel_desktop, 'index': 4},
      '笔记本': {'platform': platform_intel_laptop, 'index': 4},
      'NUC/Mini PC': {'platform': platform_intel_nuc, 'index': 4},
      '服务器': {'platform': platform_intel_hedt, 'index': 3},
    },
    'AMD': {
      '台式机': {'platform': platform_amd_desktop, 'index': 1},
      '笔记本': {'platform': platform_amd_laptop, 'index': 1},
      'NUC/Mini PC': {'platform': platform_amd_nuc, 'index': 1},
      '服务器': {'platform': platform_amd_hedt, 'index': 0},
    },
  };

  /// ======= 可选的SSDT表-Intel台式机 =======
  static const optional_sstds_intel_desktop = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtPWRB,
    ACPITable.ssdtSLPB,
  ];

  /// ======= 可选的SSDT表-Intel笔记本 =======
  static const optional_sstds_intel_laptop = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtRMNE,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtSLPB,
    ACPITable.ssdtPWRB,
  ];

  /// ======= 可选的SSDT表-IntelNUC/Mini PC =======
  static const optional_sstds_intel_nuc = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtPWRB,
    ACPITable.ssdtSLPB,
  ];

  /// ======= 可选的SSDT表-Intel服务器 =======
  static const optional_sstds_intel_hedt = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtPWRB,
    ACPITable.ssdtSLPB,
  ];

  /// ======= 可选的SSDT表-AMD台式机 =======
  static const optional_sstds_amd_desktop = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtPWRB,
    ACPITable.ssdtSLPB,
  ];

  /// ======= 可选的SSDT表-AMD笔记本 =======
  static const optional_sstds_amd_laptop = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtRMNE,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtSLPB,
    ACPITable.ssdtPWRB,
  ];

  /// ======= 可选的SSDT表-AMDNUC/Mini PC =======
  static const optional_sstds_amd_nuc = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtPWRB,
    ACPITable.ssdtSLPB,
  ];

  /// ======= 可选的SSDT表-AMD服务器 =======
  static const optional_sstds_amd_hedt = [
    ACPITable.ssdtSBUSMCHC,
    ACPITable.ssdtGPRW,
    ACPITable.ssdtFixShutdown,
    ACPITable.ssdtFACP,
    ACPITable.ssdtDMAC,
    ACPITable.ssdtPWRB,
    ACPITable.ssdtSLPB,
  ];
}
