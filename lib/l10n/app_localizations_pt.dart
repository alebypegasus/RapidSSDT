// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'RapidSSDT';

  @override
  String get dumpAcpi => 'Extrair ACPI';

  @override
  String get selectAcpisFolder => 'Selecionar ACPIs';

  @override
  String get generateSsdt => 'Gerar SSDT';

  @override
  String get clearConfig => 'Limpar Configuração';

  @override
  String get selectDmar => 'Selec. DMAR';

  @override
  String get hintDmar => 'Selecione a tabela DMAR';

  @override
  String get selectApic => 'Selec. APIC';

  @override
  String get hintApic => 'Selecione a tabela APIC';

  @override
  String get selectFacp => 'Selecionar FACP';

  @override
  String get hintFacp => 'Selecione a tabela FACP';

  @override
  String get selectOutputPath => 'Caminho de Saída';

  @override
  String get oneClickSelect => 'Seleção Rápida';

  @override
  String get clearSelection => 'Limpar Seleção';

  @override
  String get about => 'Sobre';

  @override
  String get checkUpdate => 'Verificar Atualizações';

  @override
  String get guide => 'Guia';

  @override
  String get platformPreset => 'Presets de Plataforma';

  @override
  String get customAcpiOptions => 'Opções ACPI Customizadas';

  @override
  String get legacyIrqConflict => 'Conflito de IRQ HPET';

  @override
  String get keepOriginalIrq => 'Manter IRQs Originais';

  @override
  String get gpuSpoofModel => 'Modelo de GPU Falsificada';

  @override
  String get pciPath => 'Caminho do Dispositivo PCI';

  @override
  String get spoofGpuId => 'ID da GPU Falsificada';

  @override
  String get disablePciDevices => 'Desativar Dispositivos PCI';

  @override
  String get brightnessPatch => 'Correção de Brilho da Tela (PNLF)';

  @override
  String get usbxPowerProperties => 'Propriedades de Energia USB (USBX)';

  @override
  String get xosiWindowsVersion => 'Versão Emulada do Windows (XOSI)';

  @override
  String get language => 'Idioma';

  @override
  String get languagePortugueseBR => 'Português (Brasil)';

  @override
  String get languagePortuguesePT => 'Português (Portugal)';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageChinese => 'Chinês';

  @override
  String get languageJapanese => 'Japonês';

  @override
  String get newVersionFound => 'Nova versão encontrada';

  @override
  String get versionNumber => 'Versão: ';

  @override
  String get releaseTime => 'Lançamento: ';

  @override
  String get visitGithub => 'Acessar GitHub';

  @override
  String get downloadNow => 'Baixar Agora';

  @override
  String get close => 'Fechar';

  @override
  String get log => 'Log do Sistema';

  @override
  String get clearLog => 'Limpar Log';

  @override
  String get exportLog => 'Exportar Log';

  @override
  String get executePatch => 'Executar Patch';

  @override
  String get mergeConfig => 'Mesclar config';

  @override
  String get selectConfig => 'Selecionar config';

  @override
  String get hintConfig => 'Por favor, selecione o arquivo config.plist';

  @override
  String get selectPatch => 'Selecionar patch';

  @override
  String get generatingSsdt => 'Gerando SSDT, aguarde!';

  @override
  String get noSsdtSelected => 'Nenhum SSDT selecionado';

  @override
  String get platformInfo => 'Plataforma:';

  @override
  String get prebuiltSsdt => 'SSDT Pré-construído';

  @override
  String get customSsdt => 'SSDT Customizado';

  @override
  String get cpuType => 'Tipo de CPU:';

  @override
  String get platformType => 'Fator de Forma:';

  @override
  String get platformDesktop => 'Desktop';

  @override
  String get platformLaptop => 'Laptop';

  @override
  String get platformNuc => 'Mini PC / NUC';

  @override
  String get platformServer => 'Servidor';

  @override
  String get checkAll => 'Marcar Todos';

  @override
  String get coreOfficialRec => 'Core (Rec. Oficial)';

  @override
  String get recommendedFixes => 'Recomendado';

  @override
  String get optionalEnhancements => 'Opcional';

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
      'Resolve conflitos de IRQ, normalmente usado para correções de áudio';

  @override
  String get note_ssdtHPET =>
      '• Resolve conflitos de IRQ em IRQs legados\n• Frequentemente necessário para o áudio integrado funcionar corretamente\n• Selecione apenas se recomendado ou se estiver enfrentando problemas de áudio';

  @override
  String get remark_ssdtECUSBXDesktop =>
      'Falsifica EC e injeta propriedades de energia USB (Desktop Intel 6ª Geração+)';

  @override
  String get note_ssdtECUSBXDesktop =>
      '• Falsifica o EC para permitir o carregamento do gerenciamento de energia do macOS\n• Injeta propriedades de energia USB para o fornecimento correto de energia USB\n• Adequado para plataformas desktop Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtECUSBXLaptop =>
      'Falsifica EC, não afeta EC existente, injeta propriedades de energia USB (Laptop Intel 6ª Geração+)';

  @override
  String get note_ssdtECUSBXLaptop =>
      '• Falsifica o EC (Controlador Embutido) sem afetar o existente\n• Injeta propriedades de energia USB para laptops\n• Adequado para plataformas de laptop Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtECDesktop =>
      'Falsifica EC (Desktop Intel 5ª Geração e anteriores)';

  @override
  String get note_ssdtECDesktop =>
      '• Falsifica o EC para permitir o carregamento do gerenciamento de energia do macOS\n• Adequado para plataformas desktop Intel Broadwell (5ª Geração) e anteriores';

  @override
  String get remark_ssdtECLaptop =>
      'Falsifica EC, não afeta EC existente (Laptop Intel 5ª Geração e anteriores)';

  @override
  String get note_ssdtECLaptop =>
      '• Falsifica o EC (Controlador Embutido) sem afetar o existente\n• Adequado para plataformas de laptop Intel Broadwell (5ª Geração) e anteriores';

  @override
  String get remark_ssdtUSBX =>
      'Correção de propriedades de energia USB (Intel 6ª Geração+)';

  @override
  String get note_ssdtUSBX =>
      '• Injeta propriedades de energia USB para o fornecimento correto de energia USB\n• Adequado para plataformas Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtPLUG =>
      'Reconhecimento de núcleo da CPU, permite dimensionamento de frequência e economia de energia';

  @override
  String get note_ssdtPLUG =>
      '• Injeta plugin-type=1 no primeiro processador\n• Permite o gerenciamento de energia da CPU nativo do macOS e o dimensionamento de frequência\n• Necessário do Intel Haswell (4ª Geração) ao Comet Lake (10ª Geração)';

  @override
  String get remark_ssdtPMC =>
      'Habilita suporte a NVRAM (Normalmente placas-mãe nativas Intel série 300)';

  @override
  String get note_ssdtPMC =>
      '• Adiciona o dispositivo PMC ausente para suporte NVRAM nativo\n• Necessário em placas-mãe Intel série 300 (Z390, B360, etc.)';

  @override
  String get remark_ssdtPNLF =>
      'Adiciona dispositivo PNLF para suporte a luz de fundo (Laptops e AIOs)';

  @override
  String get note_ssdtPNLF =>
      '• Injeta o dispositivo PNLF necessário para o controle de brilho da tela no macOS\n• Essencial para Laptops e dispositivos All-in-One';

  @override
  String get remark_ssdtALS0 =>
      'Fornece suporte ao sensor de luz ambiente (Laptops e AIOs)';

  @override
  String get note_ssdtALS0 =>
      '• Falsifica um sensor de luz ambiente (ALS0)\n• Ajuda com a persistência do brilho da tela e brilho automático em laptops';

  @override
  String get remark_ssdtXOSI =>
      'macOS se disfarça de Windows, desbloqueia dispositivos ocultos (ex: trackpad I2C)';

  @override
  String get note_ssdtXOSI =>
      '• Falsifica a versão do Windows durante a verificação do sistema operacional ACPI\n• Desbloqueia dispositivos ocultos pela BIOS (como trackpads I2C)\n• Requer o patch de renomeação de _OSI para XOSI';

  @override
  String get remark_ssdtRHUB => 'Redefinição e correção de porta USB';

  @override
  String get note_ssdtRHUB =>
      '• Desativa o dispositivo RHUB original e força o macOS a enumerar as portas USB novamente\n• Útil para placas-mãe Asus em chipsets da série 400';

  @override
  String get remark_ssdtBridge =>
      'Cria pontes para caminhos de dispositivo PCI ausentes';

  @override
  String get note_ssdtBridge =>
      '• Adiciona pontes PCI ausentes à árvore ACPI\n• Garante que os dispositivos sejam montados corretamente no macOS';

  @override
  String get remark_ssdtDMAR =>
      'Remove região de memória reservada DMAR, corrige problemas de inicialização e rede';

  @override
  String get note_ssdtDMAR =>
      '• Descarta a tabela DMAR original e a substitui sem a região de memória reservada\n• Corrige problemas com Ethernet Intel I225-V e certas placas Wi-Fi';

  @override
  String get remark_ssdtAPIC =>
      'Adiciona entradas APIC ausentes para mais de 255 threads';

  @override
  String get note_ssdtAPIC =>
      '• Necessário em sistemas com mais de 255 threads para iniciar o macOS';

  @override
  String get remark_ssdtSBUSMCHC => 'Adiciona suporte a SMBus';

  @override
  String get note_ssdtSBUSMCHC =>
      '• Completa a árvore ACPI para SMBus (System Management Bus)\n• Habilita AppleSMBus e corrige os sensores de temperatura';

  @override
  String get remark_ssdtIMEI =>
      'Corrige falha de aceleração de iGPU (Normalmente Ivy Bridge e Sandy Bridge)';

  @override
  String get note_ssdtIMEI =>
      '• Adiciona ou corrige o dispositivo IMEI (Intel Management Engine Interface)\n• Necessário para aceleração de gráficos Intel HD 3000/4000';

  @override
  String get remark_ssdtFixShutdown =>
      'Corrige a reinicialização após desligamento ou falha de desligamento';

  @override
  String get note_ssdtFixShutdown =>
      '• Corrige o problema em que o PC reinicia em vez de desligar\n• Geralmente requer um patch de renomeação ACPI (_PTS para ZPTS)';

  @override
  String get remark_checkSystemState => 'Verificar Estado do Sistema';

  @override
  String get note_checkSystemState =>
      '• Verifica o estado ACPI do sistema para compatibilidade';

  @override
  String get remark_checkAOAC => 'Verificar AOAC';

  @override
  String get note_checkAOAC =>
      '• Verifica a compatibilidade do Always-On Always-Connected';

  @override
  String get remark_ssdtGPRW =>
      'Corrige despertar instantâneo causado por controladores USB';

  @override
  String get note_ssdtGPRW =>
      '• Impede que dispositivos USB despertem instantaneamente o sistema do modo de repouso\n• Requer o patch de renomeação de GPRW para XPRW';

  @override
  String get remark_ssdtUPRW =>
      'Corrige despertar instantâneo causado por controladores USB';

  @override
  String get note_ssdtUPRW =>
      '• Alternativa ao patch GPRW para evitar despertar instantâneo';

  @override
  String get remark_ssdtLID =>
      'Corrige problemas de repouso/despertar com a tampa do laptop';

  @override
  String get note_ssdtLID =>
      '• Garante que o sistema entre no modo de repouso corretamente quando a tampa é fechada e desperte quando aberta';

  @override
  String get remark_ssdtWakeScreen =>
      'Corrige tela que não liga após despertar';

  @override
  String get note_ssdtWakeScreen =>
      '• Injeta o pressionamento do botão liga/desliga para ativar a tela';

  @override
  String get remark_ssdtLED =>
      'Corrige indicadores de status LED do laptop após despertar';

  @override
  String get note_ssdtLED =>
      '• Corrige a luz de respiração e o LED do botão liga/desliga em laptops Lenovo após despertar';

  @override
  String get remark_ssdtS3Disable =>
      'Desativa estado de repouso S3 (Corrige travamento, reinicialização ou desligamento ao despertar)';

  @override
  String get note_ssdtS3Disable =>
      '• Desativa o estado de repouso S3 do macOS para evitar travamentos ao despertar\n• Requer o patch de renomeação de _S3 para XS3';

  @override
  String get remark_ssdtFACP =>
      'Altera reinicialização a quente para fria, corrige hardware desativado';

  @override
  String get note_ssdtFACP =>
      '• Altera reinicialização a quente para reinicialização a fria\n• Corrige problemas em que Wi-Fi, Bluetooth ou Áudio são desativados após reiniciar do Windows para o macOS';

  @override
  String get remark_ssdtGPUSPOOF => 'Falsifica GPU';

  @override
  String get note_ssdtGPUSPOOF =>
      '• Modifica o ID do dispositivo para GPUs AMD não suportadas (como RX 550 Lexa, RX 6650XT) para um modelo suportado para habilitar a aceleração';

  @override
  String get remark_ssdtPCIDISABLE =>
      'Desativa dispositivos PCI (GPUs não suportadas, SSDs NVMe, etc.)';

  @override
  String get note_ssdtPCIDISABLE =>
      '• Desativa dispositivos PCIe não suportados como GPUs dedicadas ou unidades NVMe específicas via ACPI';

  @override
  String get remark_ssdtRMNE =>
      'Falsifica dispositivo Ethernet (Para laptops sem Ethernet)';

  @override
  String get note_ssdtRMNE =>
      '• Injeta um dispositivo NullEthernet (en0)\n• Necessário para serviços Apple (iMessage, Facetime, iCloud) em laptops sem uma porta Ethernet';

  @override
  String get remark_ssdtGPI0 => 'Corrige problemas no trackpad I2C (Laptops)';

  @override
  String get note_ssdtGPI0 =>
      '• Habilita o dispositivo GPI0 no ACPI para macOS\n• Necessário para que muitos trackpads I2C funcionem corretamente';

  @override
  String get remark_ssdtCPUR =>
      'Renomeação de CPU para chipsets B850, B650, B550, A520 (apenas Ryzen)';

  @override
  String get note_ssdtCPUR =>
      '• Renomeia a CPU AMD no ACPI para corrigir travamentos de inicialização em chipsets AMD mais recentes';

  @override
  String get remark_ssdtPLUGALT =>
      'Correção de gerenciamento de energia (Intel 12ª Geração+ e alguns AMD Ryzen)';

  @override
  String get note_ssdtPLUGALT =>
      '• Injeta plugin-type=1 em processadores mais recentes\n• Necessário para o gerenciamento de energia da CPU macOS no Intel Alder Lake e mais recentes, e algumas plataformas AMD';

  @override
  String get remark_ssdtAWAC =>
      'Desativa AWAC (Temporizador Moderno) (Intel 8ª Geração+)';

  @override
  String get note_ssdtAWAC =>
      '• Desativa o temporizador moderno AWAC e habilita o RTC herdado\n• Necessário no Intel Coffee Lake (8ª Geração) e mais recentes';

  @override
  String get remark_ssdtUNC =>
      'Necessário para placas-mãe X99 nativas (C612) e a maioria das X79 (C602)';

  @override
  String get note_ssdtUNC =>
      '• Desativa dispositivos não utilizados em ACPI para evitar pânicos do kernel IOPCIFamily em placas X99/X79';

  @override
  String get remark_ssdtRTC0RANGE =>
      'Habilita/falsifica temporizador RTC legado e corrige intervalo de RTC (X99 e X299)';

  @override
  String get note_ssdtRTC0RANGE =>
      '• Habilita o temporizador RTC legado e corrige erros de intervalo de RTC em placas X99 e X299';

  @override
  String get remark_ssdtDTGP => 'Adiciona suporte DTGP';

  @override
  String get note_ssdtDTGP =>
      '• Injeta propriedades de hardware para GPUs, áudio, placas Thunderbolt';

  @override
  String get remark_ssdtDMAC => 'Falsifica um controlador DMA padrão';

  @override
  String get note_ssdtDMAC =>
      '• Falsifica um Controlador DMA (PNP0200)\n• Completa a tabela de recursos ACPI para barramento LPC e DMA';

  @override
  String get remark_ssdtPWRB => 'Falsifica um controlador PWRB padrão';

  @override
  String get note_ssdtPWRB =>
      '• Falsifica um dispositivo Power Button (PNP0C0C)\n• Garante que o macOS identifique corretamente o botão liga/desliga';

  @override
  String get remark_ssdtSLPB => 'Falsifica um controlador SLPB padrão';

  @override
  String get note_ssdtSLPB =>
      '• Falsifica um dispositivo Sleep Button (PNP0C0E)\n• Garante que o macOS identifique corretamente o botão de repouso';

  @override
  String get remark_ssdtMEM2 =>
      'Falsifica dispositivo MEM2 necessário para iGPU';

  @override
  String get note_ssdtMEM2 =>
      '• Adiciona o dispositivo ACPI MEM2 necessário para os gráficos integrados Intel do Haswell ao Kaby Lake';

  @override
  String get corePatches => 'Patches Centrais';

  @override
  String get corePatchesRemark =>
      'Patches essenciais para inicialização normal do sistema e gerenciamento de energia';

  @override
  String get functionPatches => 'Patches de Função';

  @override
  String get functionPatchesRemark =>
      'Patches que fornecem funções adicionais ou corrigem problemas específicos';

  @override
  String get devicePatches => 'Patches de Dispositivos';

  @override
  String get devicePatchesRemark =>
      'Patches específicos para hardware de vídeo';

  @override
  String get specialPatches => 'Patches Especiais';

  @override
  String get specialPatchesRemark =>
      'Patches necessários apenas para placas-mãe ou arquiteturas específicas';

  @override
  String get sleepPatches => 'Patches de Repouso';

  @override
  String get sleepPatchesRemark =>
      'Opcional, usado para corrigir problemas de repouso/despertar';

  @override
  String get auxiliaryPatches => 'Patches Auxiliares';

  @override
  String get auxiliaryPatchesRemark =>
      'Opcional, completa a estrutura ACPI ou melhora a compatibilidade';

  @override
  String get prebuiltPatches => 'Patches Pré-construídos';

  @override
  String get languagePortuguese => '葡萄牙语';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appName => 'RapidSSDT';

  @override
  String get dumpAcpi => 'Extrair ACPI';

  @override
  String get selectAcpisFolder => 'Selecionar ACPIs';

  @override
  String get generateSsdt => 'Gerar SSDT';

  @override
  String get clearConfig => 'Limpar Configuração';

  @override
  String get selectDmar => 'Selec. DMAR';

  @override
  String get hintDmar => 'Selecione a tabela DMAR';

  @override
  String get selectApic => 'Selec. APIC';

  @override
  String get hintApic => 'Selecione a tabela APIC';

  @override
  String get selectFacp => 'Selecionar FACP';

  @override
  String get hintFacp => 'Selecione a tabela FACP';

  @override
  String get selectOutputPath => 'Caminho de Saída';

  @override
  String get oneClickSelect => 'Seleção Rápida';

  @override
  String get clearSelection => 'Limpar Seleção';

  @override
  String get about => 'Sobre';

  @override
  String get checkUpdate => 'Verificar Atualizações';

  @override
  String get guide => 'Guia';

  @override
  String get platformPreset => 'Presets de Plataforma';

  @override
  String get customAcpiOptions => 'Opções ACPI Customizadas';

  @override
  String get legacyIrqConflict => 'Conflito de IRQ HPET';

  @override
  String get keepOriginalIrq => 'Manter IRQs Originais';

  @override
  String get gpuSpoofModel => 'Modelo de GPU Falsificada';

  @override
  String get pciPath => 'Caminho do Dispositivo PCI';

  @override
  String get spoofGpuId => 'ID da GPU Falsificada';

  @override
  String get disablePciDevices => 'Desativar Dispositivos PCI';

  @override
  String get brightnessPatch => 'Correção de Brilho da Tela (PNLF)';

  @override
  String get usbxPowerProperties => 'Propriedades de Energia USB (USBX)';

  @override
  String get xosiWindowsVersion => 'Versão Emulada do Windows (XOSI)';

  @override
  String get language => 'Idioma';

  @override
  String get languagePortugueseBR => 'Português (Brasil)';

  @override
  String get languagePortuguesePT => 'Português (Portugal)';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageChinese => 'Chinês';

  @override
  String get languageJapanese => 'Japonês';

  @override
  String get newVersionFound => 'Nova versão encontrada';

  @override
  String get versionNumber => 'Versão: ';

  @override
  String get releaseTime => 'Lançamento: ';

  @override
  String get visitGithub => 'Acessar GitHub';

  @override
  String get downloadNow => 'Baixar Agora';

  @override
  String get close => 'Fechar';

  @override
  String get log => 'Log do Sistema';

  @override
  String get clearLog => 'Limpar Log';

  @override
  String get exportLog => 'Exportar Log';

  @override
  String get executePatch => 'Executar Patch';

  @override
  String get mergeConfig => 'Mesclar config';

  @override
  String get selectConfig => 'Selecionar config';

  @override
  String get hintConfig => 'Por favor, selecione o arquivo config.plist';

  @override
  String get selectPatch => 'Selecionar patch';

  @override
  String get generatingSsdt => 'Gerando SSDT, aguarde!';

  @override
  String get noSsdtSelected => 'Nenhum SSDT selecionado';

  @override
  String get platformInfo => 'Plataforma:';

  @override
  String get prebuiltSsdt => 'SSDT Pré-construído';

  @override
  String get customSsdt => 'SSDT Customizado';

  @override
  String get cpuType => 'Tipo de CPU:';

  @override
  String get platformType => 'Fator de Forma:';

  @override
  String get platformDesktop => 'Desktop';

  @override
  String get platformLaptop => 'Laptop';

  @override
  String get platformNuc => 'Mini PC / NUC';

  @override
  String get platformServer => 'Servidor';

  @override
  String get checkAll => 'Marcar Todos';

  @override
  String get coreOfficialRec => 'Core (Rec. Oficial)';

  @override
  String get recommendedFixes => 'Recomendado';

  @override
  String get optionalEnhancements => 'Opcional';

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
      'Resolve conflitos de IRQ, normalmente usado para correções de áudio';

  @override
  String get note_ssdtHPET =>
      '• Resolve conflitos de IRQ em IRQs legados\n• Frequentemente necessário para o áudio integrado funcionar corretamente\n• Selecione apenas se recomendado ou se estiver enfrentando problemas de áudio';

  @override
  String get remark_ssdtECUSBXDesktop =>
      'Falsifica EC e injeta propriedades de energia USB (Desktop Intel 6ª Geração+)';

  @override
  String get note_ssdtECUSBXDesktop =>
      '• Falsifica o EC para permitir o carregamento do gerenciamento de energia do macOS\n• Injeta propriedades de energia USB para o fornecimento correto de energia USB\n• Adequado para plataformas desktop Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtECUSBXLaptop =>
      'Falsifica EC, não afeta EC existente, injeta propriedades de energia USB (Laptop Intel 6ª Geração+)';

  @override
  String get note_ssdtECUSBXLaptop =>
      '• Falsifica o EC (Controlador Embutido) sem afetar o existente\n• Injeta propriedades de energia USB para laptops\n• Adequado para plataformas de laptop Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtECDesktop =>
      'Falsifica EC (Desktop Intel 5ª Geração e anteriores)';

  @override
  String get note_ssdtECDesktop =>
      '• Falsifica o EC para permitir o carregamento do gerenciamento de energia do macOS\n• Adequado para plataformas desktop Intel Broadwell (5ª Geração) e anteriores';

  @override
  String get remark_ssdtECLaptop =>
      'Falsifica EC, não afeta EC existente (Laptop Intel 5ª Geração e anteriores)';

  @override
  String get note_ssdtECLaptop =>
      '• Falsifica o EC (Controlador Embutido) sem afetar o existente\n• Adequado para plataformas de laptop Intel Broadwell (5ª Geração) e anteriores';

  @override
  String get remark_ssdtUSBX =>
      'Correção de propriedades de energia USB (Intel 6ª Geração+)';

  @override
  String get note_ssdtUSBX =>
      '• Injeta propriedades de energia USB para o fornecimento correto de energia USB\n• Adequado para plataformas Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtPLUG =>
      'Reconhecimento de núcleo da CPU, permite dimensionamento de frequência e economia de energia';

  @override
  String get note_ssdtPLUG =>
      '• Injeta plugin-type=1 no primeiro processador\n• Permite o gerenciamento de energia da CPU nativo do macOS e o dimensionamento de frequência\n• Necessário do Intel Haswell (4ª Geração) ao Comet Lake (10ª Geração)';

  @override
  String get remark_ssdtPMC =>
      'Habilita suporte a NVRAM (Normalmente placas-mãe nativas Intel série 300)';

  @override
  String get note_ssdtPMC =>
      '• Adiciona o dispositivo PMC ausente para suporte NVRAM nativo\n• Necessário em placas-mãe Intel série 300 (Z390, B360, etc.)';

  @override
  String get remark_ssdtPNLF =>
      'Adiciona dispositivo PNLF para suporte a luz de fundo (Laptops e AIOs)';

  @override
  String get note_ssdtPNLF =>
      '• Injeta o dispositivo PNLF necessário para o controle de brilho da tela no macOS\n• Essencial para Laptops e dispositivos All-in-One';

  @override
  String get remark_ssdtALS0 =>
      'Fornece suporte ao sensor de luz ambiente (Laptops e AIOs)';

  @override
  String get note_ssdtALS0 =>
      '• Falsifica um sensor de luz ambiente (ALS0)\n• Ajuda com a persistência do brilho da tela e brilho automático em laptops';

  @override
  String get remark_ssdtXOSI =>
      'macOS se disfarça de Windows, desbloqueia dispositivos ocultos (ex: trackpad I2C)';

  @override
  String get note_ssdtXOSI =>
      '• Falsifica a versão do Windows durante a verificação do sistema operacional ACPI\n• Desbloqueia dispositivos ocultos pela BIOS (como trackpads I2C)\n• Requer o patch de renomeação de _OSI para XOSI';

  @override
  String get remark_ssdtRHUB => 'Redefinição e correção de porta USB';

  @override
  String get note_ssdtRHUB =>
      '• Desativa o dispositivo RHUB original e força o macOS a enumerar as portas USB novamente\n• Útil para placas-mãe Asus em chipsets da série 400';

  @override
  String get remark_ssdtBridge =>
      'Cria pontes para caminhos de dispositivo PCI ausentes';

  @override
  String get note_ssdtBridge =>
      '• Adiciona pontes PCI ausentes à árvore ACPI\n• Garante que os dispositivos sejam montados corretamente no macOS';

  @override
  String get remark_ssdtDMAR =>
      'Remove região de memória reservada DMAR, corrige problemas de inicialização e rede';

  @override
  String get note_ssdtDMAR =>
      '• Descarta a tabela DMAR original e a substitui sem a região de memória reservada\n• Corrige problemas com Ethernet Intel I225-V e certas placas Wi-Fi';

  @override
  String get remark_ssdtAPIC =>
      'Adiciona entradas APIC ausentes para mais de 255 threads';

  @override
  String get note_ssdtAPIC =>
      '• Necessário em sistemas com mais de 255 threads para iniciar o macOS';

  @override
  String get remark_ssdtSBUSMCHC => 'Adiciona suporte a SMBus';

  @override
  String get note_ssdtSBUSMCHC =>
      '• Completa a árvore ACPI para SMBus (System Management Bus)\n• Habilita AppleSMBus e corrige os sensores de temperatura';

  @override
  String get remark_ssdtIMEI =>
      'Corrige falha de aceleração de iGPU (Normalmente Ivy Bridge e Sandy Bridge)';

  @override
  String get note_ssdtIMEI =>
      '• Adiciona ou corrige o dispositivo IMEI (Intel Management Engine Interface)\n• Necessário para aceleração de gráficos Intel HD 3000/4000';

  @override
  String get remark_ssdtFixShutdown =>
      'Corrige a reinicialização após desligamento ou falha de desligamento';

  @override
  String get note_ssdtFixShutdown =>
      '• Corrige o problema em que o PC reinicia em vez de desligar\n• Geralmente requer um patch de renomeação ACPI (_PTS para ZPTS)';

  @override
  String get remark_checkSystemState => 'Verificar Estado do Sistema';

  @override
  String get note_checkSystemState =>
      '• Verifica o estado ACPI do sistema para compatibilidade';

  @override
  String get remark_checkAOAC => 'Verificar AOAC';

  @override
  String get note_checkAOAC =>
      '• Verifica a compatibilidade do Always-On Always-Connected';

  @override
  String get remark_ssdtGPRW =>
      'Corrige despertar instantâneo causado por controladores USB';

  @override
  String get note_ssdtGPRW =>
      '• Impede que dispositivos USB despertem instantaneamente o sistema do modo de repouso\n• Requer o patch de renomeação de GPRW para XPRW';

  @override
  String get remark_ssdtUPRW =>
      'Corrige despertar instantâneo causado por controladores USB';

  @override
  String get note_ssdtUPRW =>
      '• Alternativa ao patch GPRW para evitar despertar instantâneo';

  @override
  String get remark_ssdtLID =>
      'Corrige problemas de repouso/despertar com a tampa do laptop';

  @override
  String get note_ssdtLID =>
      '• Garante que o sistema entre no modo de repouso corretamente quando a tampa é fechada e desperte quando aberta';

  @override
  String get remark_ssdtWakeScreen =>
      'Corrige tela que não liga após despertar';

  @override
  String get note_ssdtWakeScreen =>
      '• Injeta o pressionamento do botão liga/desliga para ativar a tela';

  @override
  String get remark_ssdtLED =>
      'Corrige indicadores de status LED do laptop após despertar';

  @override
  String get note_ssdtLED =>
      '• Corrige a luz de respiração e o LED do botão liga/desliga em laptops Lenovo após despertar';

  @override
  String get remark_ssdtS3Disable =>
      'Desativa estado de repouso S3 (Corrige travamento, reinicialização ou desligamento ao despertar)';

  @override
  String get note_ssdtS3Disable =>
      '• Desativa o estado de repouso S3 do macOS para evitar travamentos ao despertar\n• Requer o patch de renomeação de _S3 para XS3';

  @override
  String get remark_ssdtFACP =>
      'Altera reinicialização a quente para fria, corrige hardware desativado';

  @override
  String get note_ssdtFACP =>
      '• Altera reinicialização a quente para reinicialização a fria\n• Corrige problemas em que Wi-Fi, Bluetooth ou Áudio são desativados após reiniciar do Windows para o macOS';

  @override
  String get remark_ssdtGPUSPOOF => 'Falsifica GPU';

  @override
  String get note_ssdtGPUSPOOF =>
      '• Modifica o ID do dispositivo para GPUs AMD não suportadas (como RX 550 Lexa, RX 6650XT) para um modelo suportado para habilitar a aceleração';

  @override
  String get remark_ssdtPCIDISABLE =>
      'Desativa dispositivos PCI (GPUs não suportadas, SSDs NVMe, etc.)';

  @override
  String get note_ssdtPCIDISABLE =>
      '• Desativa dispositivos PCIe não suportados como GPUs dedicadas ou unidades NVMe específicas via ACPI';

  @override
  String get remark_ssdtRMNE =>
      'Falsifica dispositivo Ethernet (Para laptops sem Ethernet)';

  @override
  String get note_ssdtRMNE =>
      '• Injeta um dispositivo NullEthernet (en0)\n• Necessário para serviços Apple (iMessage, Facetime, iCloud) em laptops sem uma porta Ethernet';

  @override
  String get remark_ssdtGPI0 => 'Corrige problemas no trackpad I2C (Laptops)';

  @override
  String get note_ssdtGPI0 =>
      '• Habilita o dispositivo GPI0 no ACPI para macOS\n• Necessário para que muitos trackpads I2C funcionem corretamente';

  @override
  String get remark_ssdtCPUR =>
      'Renomeação de CPU para chipsets B850, B650, B550, A520 (apenas Ryzen)';

  @override
  String get note_ssdtCPUR =>
      '• Renomeia a CPU AMD no ACPI para corrigir travamentos de inicialização em chipsets AMD mais recentes';

  @override
  String get remark_ssdtPLUGALT =>
      'Correção de gerenciamento de energia (Intel 12ª Geração+ e alguns AMD Ryzen)';

  @override
  String get note_ssdtPLUGALT =>
      '• Injeta plugin-type=1 em processadores mais recentes\n• Necessário para o gerenciamento de energia da CPU macOS no Intel Alder Lake e mais recentes, e algumas plataformas AMD';

  @override
  String get remark_ssdtAWAC =>
      'Desativa AWAC (Temporizador Moderno) (Intel 8ª Geração+)';

  @override
  String get note_ssdtAWAC =>
      '• Desativa o temporizador moderno AWAC e habilita o RTC herdado\n• Necessário no Intel Coffee Lake (8ª Geração) e mais recentes';

  @override
  String get remark_ssdtUNC =>
      'Necessário para placas-mãe X99 nativas (C612) e a maioria das X79 (C602)';

  @override
  String get note_ssdtUNC =>
      '• Desativa dispositivos não utilizados em ACPI para evitar pânicos do kernel IOPCIFamily em placas X99/X79';

  @override
  String get remark_ssdtRTC0RANGE =>
      'Habilita/falsifica temporizador RTC legado e corrige intervalo de RTC (X99 e X299)';

  @override
  String get note_ssdtRTC0RANGE =>
      '• Habilita o temporizador RTC legado e corrige erros de intervalo de RTC em placas X99 e X299';

  @override
  String get remark_ssdtDTGP => 'Adiciona suporte DTGP';

  @override
  String get note_ssdtDTGP =>
      '• Injeta propriedades de hardware para GPUs, áudio, placas Thunderbolt';

  @override
  String get remark_ssdtDMAC => 'Falsifica um controlador DMA padrão';

  @override
  String get note_ssdtDMAC =>
      '• Falsifica um Controlador DMA (PNP0200)\n• Completa a tabela de recursos ACPI para barramento LPC e DMA';

  @override
  String get remark_ssdtPWRB => 'Falsifica um controlador PWRB padrão';

  @override
  String get note_ssdtPWRB =>
      '• Falsifica um dispositivo Power Button (PNP0C0C)\n• Garante que o macOS identifique corretamente o botão liga/desliga';

  @override
  String get remark_ssdtSLPB => 'Falsifica um controlador SLPB padrão';

  @override
  String get note_ssdtSLPB =>
      '• Falsifica um dispositivo Sleep Button (PNP0C0E)\n• Garante que o macOS identifique corretamente o botão de repouso';

  @override
  String get remark_ssdtMEM2 =>
      'Falsifica dispositivo MEM2 necessário para iGPU';

  @override
  String get note_ssdtMEM2 =>
      '• Adiciona o dispositivo ACPI MEM2 necessário para os gráficos integrados Intel do Haswell ao Kaby Lake';

  @override
  String get corePatches => 'Patches Centrais';

  @override
  String get corePatchesRemark =>
      'Patches essenciais para inicialização normal do sistema e gerenciamento de energia';

  @override
  String get functionPatches => 'Patches de Função';

  @override
  String get functionPatchesRemark =>
      'Patches que fornecem funções adicionais ou corrigem problemas específicos';

  @override
  String get devicePatches => 'Patches de Dispositivos';

  @override
  String get devicePatchesRemark =>
      'Patches específicos para hardware de vídeo';

  @override
  String get specialPatches => 'Patches Especiais';

  @override
  String get specialPatchesRemark =>
      'Patches necessários apenas para placas-mãe ou arquiteturas específicas';

  @override
  String get sleepPatches => 'Patches de Repouso';

  @override
  String get sleepPatchesRemark =>
      'Opcional, usado para corrigir problemas de repouso/despertar';

  @override
  String get auxiliaryPatches => 'Patches Auxiliares';

  @override
  String get auxiliaryPatchesRemark =>
      'Opcional, completa a estrutura ACPI ou melhora a compatibilidade';

  @override
  String get prebuiltPatches => 'Patches Pré-construídos';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appName => 'RapidSSDT';

  @override
  String get dumpAcpi => 'Extrair ACPI';

  @override
  String get selectAcpisFolder => 'Selecionar ACPIs';

  @override
  String get generateSsdt => 'Gerar SSDT';

  @override
  String get clearConfig => 'Limpar Configuração';

  @override
  String get selectDmar => 'Selec. DMAR';

  @override
  String get hintDmar => 'Selecione a tabela DMAR';

  @override
  String get selectApic => 'Selec. APIC';

  @override
  String get hintApic => 'Selecione a tabela APIC';

  @override
  String get selectFacp => 'Selecionar FACP';

  @override
  String get hintFacp => 'Selecione a tabela FACP';

  @override
  String get selectOutputPath => 'Caminho de Saída';

  @override
  String get oneClickSelect => 'Seleção Rápida';

  @override
  String get clearSelection => 'Limpar Seleção';

  @override
  String get about => 'Sobre';

  @override
  String get checkUpdate => 'Procurar Atualizações';

  @override
  String get guide => 'Guia';

  @override
  String get platformPreset => 'Predefinições de Plataforma';

  @override
  String get customAcpiOptions => 'Opções ACPI Personalizadas';

  @override
  String get legacyIrqConflict => 'Conflito de IRQ HPET';

  @override
  String get keepOriginalIrq => 'Manter IRQs Originais';

  @override
  String get gpuSpoofModel => 'Modelo de GPU Falsificada';

  @override
  String get pciPath => 'Caminho do Dispositivo PCI';

  @override
  String get spoofGpuId => 'ID da GPU Falsificada';

  @override
  String get disablePciDevices => 'Desativar Dispositivos PCI';

  @override
  String get brightnessPatch => 'Correção de Brilho do Ecrã (PNLF)';

  @override
  String get usbxPowerProperties => 'Propriedades de Energia USB (USBX)';

  @override
  String get xosiWindowsVersion => 'Versão Emulada do Windows (XOSI)';

  @override
  String get language => 'Idioma';

  @override
  String get languagePortugueseBR => 'Português (Brasil)';

  @override
  String get languagePortuguesePT => 'Português (Portugal)';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageChinese => 'Chinês';

  @override
  String get languageJapanese => 'Japonês';

  @override
  String get newVersionFound => 'Nova versão encontrada';

  @override
  String get versionNumber => 'Versão: ';

  @override
  String get releaseTime => 'Lançamento: ';

  @override
  String get visitGithub => 'Acessar GitHub';

  @override
  String get downloadNow => 'Baixar Agora';

  @override
  String get close => 'Fechar';

  @override
  String get log => 'Log do Sistema';

  @override
  String get clearLog => 'Limpar Log';

  @override
  String get exportLog => 'Exportar Log';

  @override
  String get executePatch => 'Executar Patch';

  @override
  String get mergeConfig => 'Mesclar config';

  @override
  String get selectConfig => 'Selecionar config';

  @override
  String get hintConfig => 'Por favor, selecione o arquivo config.plist';

  @override
  String get selectPatch => 'Selecionar patch';

  @override
  String get generatingSsdt => 'Gerando SSDT, aguarde!';

  @override
  String get noSsdtSelected => 'Nenhum SSDT selecionado';

  @override
  String get platformInfo => 'Plataforma:';

  @override
  String get prebuiltSsdt => 'SSDT Pré-construído';

  @override
  String get customSsdt => 'SSDT Customizado';

  @override
  String get cpuType => 'Tipo de CPU:';

  @override
  String get platformType => 'Fator de Forma:';

  @override
  String get platformDesktop => 'Desktop';

  @override
  String get platformLaptop => 'Laptop';

  @override
  String get platformNuc => 'Mini PC / NUC';

  @override
  String get platformServer => 'Servidor';

  @override
  String get checkAll => 'Marcar Todos';

  @override
  String get coreOfficialRec => 'Core (Rec. Oficial)';

  @override
  String get recommendedFixes => 'Recomendado';

  @override
  String get optionalEnhancements => 'Opcional';

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
      'Resolve conflitos de IRQ, normalmente usado para correções de áudio';

  @override
  String get note_ssdtHPET =>
      '• Resolve conflitos de IRQ em IRQs legados\n• Frequentemente necessário para o áudio integrado funcionar corretamente\n• Selecione apenas se recomendado ou se estiver enfrentando problemas de áudio';

  @override
  String get remark_ssdtECUSBXDesktop =>
      'Falsifica EC e injeta propriedades de energia USB (Desktop Intel 6ª Geração+)';

  @override
  String get note_ssdtECUSBXDesktop =>
      '• Falsifica o EC para permitir o carregamento do gerenciamento de energia do macOS\n• Injeta propriedades de energia USB para o fornecimento correto de energia USB\n• Adequado para plataformas desktop Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtECUSBXLaptop =>
      'Falsifica EC, não afeta EC existente, injeta propriedades de energia USB (Laptop Intel 6ª Geração+)';

  @override
  String get note_ssdtECUSBXLaptop =>
      '• Falsifica o EC (Controlador Embutido) sem afetar o existente\n• Injeta propriedades de energia USB para laptops\n• Adequado para plataformas de laptop Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtECDesktop =>
      'Falsifica EC (Desktop Intel 5ª Geração e anteriores)';

  @override
  String get note_ssdtECDesktop =>
      '• Falsifica o EC para permitir o carregamento do gerenciamento de energia do macOS\n• Adequado para plataformas desktop Intel Broadwell (5ª Geração) e anteriores';

  @override
  String get remark_ssdtECLaptop =>
      'Falsifica EC, não afeta EC existente (Laptop Intel 5ª Geração e anteriores)';

  @override
  String get note_ssdtECLaptop =>
      '• Falsifica o EC (Controlador Embutido) sem afetar o existente\n• Adequado para plataformas de laptop Intel Broadwell (5ª Geração) e anteriores';

  @override
  String get remark_ssdtUSBX =>
      'Correção de propriedades de energia USB (Intel 6ª Geração+)';

  @override
  String get note_ssdtUSBX =>
      '• Injeta propriedades de energia USB para o fornecimento correto de energia USB\n• Adequado para plataformas Intel Skylake (6ª Geração) e mais recentes';

  @override
  String get remark_ssdtPLUG =>
      'Reconhecimento de núcleo da CPU, permite dimensionamento de frequência e economia de energia';

  @override
  String get note_ssdtPLUG =>
      '• Injeta plugin-type=1 no primeiro processador\n• Permite o gerenciamento de energia da CPU nativo do macOS e o dimensionamento de frequência\n• Necessário do Intel Haswell (4ª Geração) ao Comet Lake (10ª Geração)';

  @override
  String get remark_ssdtPMC =>
      'Habilita suporte a NVRAM (Normalmente placas-mãe nativas Intel série 300)';

  @override
  String get note_ssdtPMC =>
      '• Adiciona o dispositivo PMC ausente para suporte NVRAM nativo\n• Necessário em placas-mãe Intel série 300 (Z390, B360, etc.)';

  @override
  String get remark_ssdtPNLF =>
      'Adiciona dispositivo PNLF para suporte a luz de fundo (Laptops e AIOs)';

  @override
  String get note_ssdtPNLF =>
      '• Injeta o dispositivo PNLF necessário para o controle de brilho da tela no macOS\n• Essencial para Laptops e dispositivos All-in-One';

  @override
  String get remark_ssdtALS0 =>
      'Fornece suporte ao sensor de luz ambiente (Laptops e AIOs)';

  @override
  String get note_ssdtALS0 =>
      '• Falsifica um sensor de luz ambiente (ALS0)\n• Ajuda com a persistência do brilho da tela e brilho automático em laptops';

  @override
  String get remark_ssdtXOSI =>
      'macOS se disfarça de Windows, desbloqueia dispositivos ocultos (ex: trackpad I2C)';

  @override
  String get note_ssdtXOSI =>
      '• Falsifica a versão do Windows durante a verificação do sistema operacional ACPI\n• Desbloqueia dispositivos ocultos pela BIOS (como trackpads I2C)\n• Requer o patch de renomeação de _OSI para XOSI';

  @override
  String get remark_ssdtRHUB => 'Redefinição e correção de porta USB';

  @override
  String get note_ssdtRHUB =>
      '• Desativa o dispositivo RHUB original e força o macOS a enumerar as portas USB novamente\n• Útil para placas-mãe Asus em chipsets da série 400';

  @override
  String get remark_ssdtBridge =>
      'Cria pontes para caminhos de dispositivo PCI ausentes';

  @override
  String get note_ssdtBridge =>
      '• Adiciona pontes PCI ausentes à árvore ACPI\n• Garante que os dispositivos sejam montados corretamente no macOS';

  @override
  String get remark_ssdtDMAR =>
      'Remove região de memória reservada DMAR, corrige problemas de inicialização e rede';

  @override
  String get note_ssdtDMAR =>
      '• Descarta a tabela DMAR original e a substitui sem a região de memória reservada\n• Corrige problemas com Ethernet Intel I225-V e certas placas Wi-Fi';

  @override
  String get remark_ssdtAPIC =>
      'Adiciona entradas APIC ausentes para mais de 255 threads';

  @override
  String get note_ssdtAPIC =>
      '• Necessário em sistemas com mais de 255 threads para iniciar o macOS';

  @override
  String get remark_ssdtSBUSMCHC => 'Adiciona suporte a SMBus';

  @override
  String get note_ssdtSBUSMCHC =>
      '• Completa a árvore ACPI para SMBus (System Management Bus)\n• Habilita AppleSMBus e corrige os sensores de temperatura';

  @override
  String get remark_ssdtIMEI =>
      'Corrige falha de aceleração de iGPU (Normalmente Ivy Bridge e Sandy Bridge)';

  @override
  String get note_ssdtIMEI =>
      '• Adiciona ou corrige o dispositivo IMEI (Intel Management Engine Interface)\n• Necessário para aceleração de gráficos Intel HD 3000/4000';

  @override
  String get remark_ssdtFixShutdown =>
      'Corrige a reinicialização após desligamento ou falha de desligamento';

  @override
  String get note_ssdtFixShutdown =>
      '• Corrige o problema em que o PC reinicia em vez de desligar\n• Geralmente requer um patch de renomeação ACPI (_PTS para ZPTS)';

  @override
  String get remark_checkSystemState => 'Verificar Estado do Sistema';

  @override
  String get note_checkSystemState =>
      '• Verifica o estado ACPI do sistema para compatibilidade';

  @override
  String get remark_checkAOAC => 'Verificar AOAC';

  @override
  String get note_checkAOAC =>
      '• Verifica a compatibilidade do Always-On Always-Connected';

  @override
  String get remark_ssdtGPRW =>
      'Corrige despertar instantâneo causado por controladores USB';

  @override
  String get note_ssdtGPRW =>
      '• Impede que dispositivos USB despertem instantaneamente o sistema do modo de repouso\n• Requer o patch de renomeação de GPRW para XPRW';

  @override
  String get remark_ssdtUPRW =>
      'Corrige despertar instantâneo causado por controladores USB';

  @override
  String get note_ssdtUPRW =>
      '• Alternativa ao patch GPRW para evitar despertar instantâneo';

  @override
  String get remark_ssdtLID =>
      'Corrige problemas de repouso/despertar com a tampa do laptop';

  @override
  String get note_ssdtLID =>
      '• Garante que o sistema entre no modo de repouso corretamente quando a tampa é fechada e desperte quando aberta';

  @override
  String get remark_ssdtWakeScreen =>
      'Corrige tela que não liga após despertar';

  @override
  String get note_ssdtWakeScreen =>
      '• Injeta o pressionamento do botão liga/desliga para ativar a tela';

  @override
  String get remark_ssdtLED =>
      'Corrige indicadores de status LED do laptop após despertar';

  @override
  String get note_ssdtLED =>
      '• Corrige a luz de respiração e o LED do botão liga/desliga em laptops Lenovo após despertar';

  @override
  String get remark_ssdtS3Disable =>
      'Desativa estado de repouso S3 (Corrige travamento, reinicialização ou desligamento ao despertar)';

  @override
  String get note_ssdtS3Disable =>
      '• Desativa o estado de repouso S3 do macOS para evitar travamentos ao despertar\n• Requer o patch de renomeação de _S3 para XS3';

  @override
  String get remark_ssdtFACP =>
      'Altera reinicialização a quente para fria, corrige hardware desativado';

  @override
  String get note_ssdtFACP =>
      '• Altera reinicialização a quente para reinicialização a fria\n• Corrige problemas em que Wi-Fi, Bluetooth ou Áudio são desativados após reiniciar do Windows para o macOS';

  @override
  String get remark_ssdtGPUSPOOF => 'Falsifica GPU';

  @override
  String get note_ssdtGPUSPOOF =>
      '• Modifica o ID do dispositivo para GPUs AMD não suportadas (como RX 550 Lexa, RX 6650XT) para um modelo suportado para habilitar a aceleração';

  @override
  String get remark_ssdtPCIDISABLE =>
      'Desativa dispositivos PCI (GPUs não suportadas, SSDs NVMe, etc.)';

  @override
  String get note_ssdtPCIDISABLE =>
      '• Desativa dispositivos PCIe não suportados como GPUs dedicadas ou unidades NVMe específicas via ACPI';

  @override
  String get remark_ssdtRMNE =>
      'Falsifica dispositivo Ethernet (Para laptops sem Ethernet)';

  @override
  String get note_ssdtRMNE =>
      '• Injeta um dispositivo NullEthernet (en0)\n• Necessário para serviços Apple (iMessage, Facetime, iCloud) em laptops sem uma porta Ethernet';

  @override
  String get remark_ssdtGPI0 => 'Corrige problemas no trackpad I2C (Laptops)';

  @override
  String get note_ssdtGPI0 =>
      '• Habilita o dispositivo GPI0 no ACPI para macOS\n• Necessário para que muitos trackpads I2C funcionem corretamente';

  @override
  String get remark_ssdtCPUR =>
      'Renomeação de CPU para chipsets B850, B650, B550, A520 (apenas Ryzen)';

  @override
  String get note_ssdtCPUR =>
      '• Renomeia a CPU AMD no ACPI para corrigir travamentos de inicialização em chipsets AMD mais recentes';

  @override
  String get remark_ssdtPLUGALT =>
      'Correção de gerenciamento de energia (Intel 12ª Geração+ e alguns AMD Ryzen)';

  @override
  String get note_ssdtPLUGALT =>
      '• Injeta plugin-type=1 em processadores mais recentes\n• Necessário para o gerenciamento de energia da CPU macOS no Intel Alder Lake e mais recentes, e algumas plataformas AMD';

  @override
  String get remark_ssdtAWAC =>
      'Desativa AWAC (Temporizador Moderno) (Intel 8ª Geração+)';

  @override
  String get note_ssdtAWAC =>
      '• Desativa o temporizador moderno AWAC e habilita o RTC herdado\n• Necessário no Intel Coffee Lake (8ª Geração) e mais recentes';

  @override
  String get remark_ssdtUNC =>
      'Necessário para placas-mãe X99 nativas (C612) e a maioria das X79 (C602)';

  @override
  String get note_ssdtUNC =>
      '• Desativa dispositivos não utilizados em ACPI para evitar pânicos do kernel IOPCIFamily em placas X99/X79';

  @override
  String get remark_ssdtRTC0RANGE =>
      'Habilita/falsifica temporizador RTC legado e corrige intervalo de RTC (X99 e X299)';

  @override
  String get note_ssdtRTC0RANGE =>
      '• Habilita o temporizador RTC legado e corrige erros de intervalo de RTC em placas X99 e X299';

  @override
  String get remark_ssdtDTGP => 'Adiciona suporte DTGP';

  @override
  String get note_ssdtDTGP =>
      '• Injeta propriedades de hardware para GPUs, áudio, placas Thunderbolt';

  @override
  String get remark_ssdtDMAC => 'Falsifica um controlador DMA padrão';

  @override
  String get note_ssdtDMAC =>
      '• Falsifica um Controlador DMA (PNP0200)\n• Completa a tabela de recursos ACPI para barramento LPC e DMA';

  @override
  String get remark_ssdtPWRB => 'Falsifica um controlador PWRB padrão';

  @override
  String get note_ssdtPWRB =>
      '• Falsifica um dispositivo Power Button (PNP0C0C)\n• Garante que o macOS identifique corretamente o botão liga/desliga';

  @override
  String get remark_ssdtSLPB => 'Falsifica um controlador SLPB padrão';

  @override
  String get note_ssdtSLPB =>
      '• Falsifica um dispositivo Sleep Button (PNP0C0E)\n• Garante que o macOS identifique corretamente o botão de repouso';

  @override
  String get remark_ssdtMEM2 =>
      'Falsifica dispositivo MEM2 necessário para iGPU';

  @override
  String get note_ssdtMEM2 =>
      '• Adiciona o dispositivo ACPI MEM2 necessário para os gráficos integrados Intel do Haswell ao Kaby Lake';

  @override
  String get corePatches => 'Patches Centrais';

  @override
  String get corePatchesRemark =>
      'Patches essenciais para inicialização normal do sistema e gerenciamento de energia';

  @override
  String get functionPatches => 'Patches de Função';

  @override
  String get functionPatchesRemark =>
      'Patches que fornecem funções adicionais ou corrigem problemas específicos';

  @override
  String get devicePatches => 'Patches de Dispositivos';

  @override
  String get devicePatchesRemark =>
      'Patches específicos para hardware de vídeo';

  @override
  String get specialPatches => 'Patches Especiais';

  @override
  String get specialPatchesRemark =>
      'Patches necessários apenas para placas-mãe ou arquiteturas específicas';

  @override
  String get sleepPatches => 'Patches de Repouso';

  @override
  String get sleepPatchesRemark =>
      'Opcional, usado para corrigir problemas de repouso/despertar';

  @override
  String get auxiliaryPatches => 'Patches Auxiliares';

  @override
  String get auxiliaryPatchesRemark =>
      'Opcional, completa a estrutura ACPI ou melhora a compatibilidade';

  @override
  String get prebuiltPatches => 'Patches Pré-construídos';
}
