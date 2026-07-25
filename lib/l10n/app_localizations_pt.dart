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

  @override
  String get ssdtMsg500 => 'Caminho ACPI do dispositivo:';

  @override
  String get ssdtMsg501 =>
      'Selecione o dispositivo de placa gráfica a ser falsificado';

  @override
  String get ssdtMsg502 => 'Modelo de placa gráfica desconhecido';

  @override
  String get ssdtMsg503 => 'Banco de dados de ID de placa gráfica falsificada:';

  @override
  String ssdtMsg504(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg505 => 'Por exemplo: 73BF';

  @override
  String get ssdtMsg506 => 'Requer 4 caracteres hexadecimais';

  @override
  String ssdtMsg507(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg508 => 'Opcional, nome da placa gráfica';

  @override
  String get ssdtMsg509 => 'ID da placa gráfica falsificada:';

  @override
  String get ssdtMsg510 => 'Nome da placa gráfica falsificada:';

  @override
  String ssdtMsg511(String arg0) {
    return 'Se deseja excluir o arquivo .dsl de origem: $arg0';
  }

  @override
  String ssdtMsg512(String arg0) {
    return 'Se deve forçar a compilação: $arg0';
  }

  @override
  String ssdtMsg513(String arg0) {
    return 'Se deve substituir o EFI de destino: $arg0';
  }

  @override
  String ssdtMsg514(String arg0) {
    return 'Padrão de correspondência: $arg0';
  }

  @override
  String ssdtMsg515(String arg0) {
    return 'Falha ao carregar dados HPET: $arg0';
  }

  @override
  String ssdtMsg516(String arg0) {
    return 'Falha ao inicializar dados HPET: $arg0';
  }

  @override
  String ssdtMsg517(String arg0) {
    return 'Falha ao inicializar o caminho ACPI: $arg0';
  }

  @override
  String get ssdtMsg518 => 'Sem notas de patch';

  @override
  String get ssdtMsg519 => 'Sem notas de patch';

  @override
  String ssdtMsg520(String arg0) {
    return 'Falha ao obter notas do patch: $arg0';
  }

  @override
  String get ssdtMsg521 => 'Falha ao obter notas do patch';

  @override
  String ssdtMsg522(String arg0) {
    return '$arg0 Limpar caminho de configuração';
  }

  @override
  String ssdtMsg523(String arg0, String arg1) {
    return '$arg0 selecionou um arquivo inválido: $arg1';
  }

  @override
  String ssdtMsg524(String arg0) {
    return 'Nenhuma configuração de patch encontrada para $arg0';
  }

  @override
  String get ssdtMsg525 =>
      'Selecione o SSDT que precisa ser personalizado antes de continuar!';

  @override
  String ssdtMsg526(String arg0) {
    return 'Falha ao executar o patch: $arg0';
  }

  @override
  String ssdtMsg527(String arg0, String arg1) {
    return 'Falha ao executar o patch [$arg0]: $arg1';
  }

  @override
  String get ssdtMsg528 => 'SSDT está sendo gerado, não repita a operação!';

  @override
  String get ssdtMsg529 => 'A lista de patches está vazia!';

  @override
  String get ssdtMsg530 =>
      'A extração está em andamento, não repita a operação!';

  @override
  String ssdtMsg531(String arg0) {
    return 'É muito provável que a tabela ACPI extraída pela plataforma $arg0 atual esteja contaminada por patches ACPI injetados por OpenCore e outros. É altamente recomendável operar na plataforma Windows/Linux!';
  }

  @override
  String get ssdtMsg532 => 'Falha ao extrair ACPI!';

  @override
  String get ssdtMsg533 => 'Extração de ACPI bem-sucedida!';

  @override
  String ssdtMsg534(String arg0) {
    return 'Falha ao preparar o patch: $arg0';
  }

  @override
  String ssdtMsg535(String arg0) {
    return 'Falha ao carregar DSDT/ACPI: $arg0';
  }

  @override
  String ssdtMsg536(String arg0) {
    return 'O arquivo config.plist não existe: $arg0';
  }

  @override
  String get ssdtMsg537 => 'Formato de arquivo plist não reconhecido';

  @override
  String ssdtMsg538(String arg0) {
    return 'O tipo config.plist é \"$arg0\"';
  }

  @override
  String ssdtMsg539(String arg0) {
    return 'Falha ao analisar o tipo plist: $arg0';
  }

  @override
  String get ssdtMsg540 => 'Selecione o diretório ACPIs primeiro!';

  @override
  String get ssdtMsg541 =>
      'Selecione primeiro o arquivo config.plist no diretório EFI!';

  @override
  String ssdtMsg542(String arg0) {
    return 'Caminho ACPI inválido: $arg0';
  }

  @override
  String ssdtMsg543(String arg0) {
    return 'O arquivo config.plist não existe: $arg0';
  }

  @override
  String ssdtMsg544(String arg0) {
    return 'Falha ao mesclar arquivos plist: $arg0';
  }

  @override
  String get ssdtMsg545 => 'sim';

  @override
  String get ssdtMsg546 => 'não';

  @override
  String get ssdtMsg547 => 'sim';

  @override
  String get ssdtMsg548 => 'não';

  @override
  String get ssdtMsg549 => 'sim';

  @override
  String get ssdtMsg550 => 'não';

  @override
  String get ssdtMsg551 => 'embutido';

  @override
  String get ssdtMsg552 => 'remoto';

  @override
  String get ssdtMsg553 => 'Nova versão do iasl';

  @override
  String get ssdtMsg554 => 'Versão antiga iasl-legacy';

  @override
  String get ssdtMsg555 => 'sim';

  @override
  String get ssdtMsg556 => 'não';

  @override
  String get ssdtMsg557 => 'Preferências';

  @override
  String get ssdtMsg558 => 'modo iasl';

  @override
  String get ssdtMsg559 => 'tipo de compilação iasl';

  @override
  String get ssdtMsg560 => 'Exclua arquivos .dsl descompilados';

  @override
  String get ssdtMsg561 => 'Forçar compilação';

  @override
  String get ssdtMsg562 => 'Se deve substituir o EFI de destino';

  @override
  String get ssdtMsg563 => 'Modo de correspondência ACPI';

  @override
  String get ssdtMsg564 => 'patch principal';

  @override
  String get ssdtMsg565 => 'Patches de recursos';

  @override
  String get ssdtMsg566 => 'Patches de dispositivos';

  @override
  String get ssdtMsg567 => 'patch dedicado';

  @override
  String get ssdtMsg568 => 'adesivo para dormir';

  @override
  String get ssdtMsg569 => 'Patches auxiliares';

  @override
  String get ssdtMsg570 => 'Patches pré-fabricados';

  @override
  String get ssdtMsg571 =>
      'Patches básicos necessários para inicialização normal do sistema e gerenciamento de energia';

  @override
  String get ssdtMsg572 =>
      'Patches que fornecem funcionalidades adicionais ou corrigem problemas de recursos';

  @override
  String get ssdtMsg573 => 'Patches para hardware de placa gráfica';

  @override
  String get ssdtMsg574 =>
      'Patches necessários apenas em placas-mãe ou arquiteturas específicas';

  @override
  String get ssdtMsg575 => 'Opcional, usado para corrigir problemas de sono';

  @override
  String get ssdtMsg576 =>
      'Não é obrigatório, mas pode completar a estrutura ACPI ou melhorar a compatibilidade';

  @override
  String get ssdtMsg577 => 'Selecione DMAR';

  @override
  String get ssdtMsg578 =>
      'Selecione a tabela DMAR que precisa ser personalizada';

  @override
  String get ssdtMsg579 => 'Selecione APIC';

  @override
  String get ssdtMsg580 =>
      'Selecione a tabela APIC que precisa ser personalizada';

  @override
  String get ssdtMsg581 => 'Selecione FACP';

  @override
  String get ssdtMsg582 => 'Selecione o formulário FACP';

  @override
  String get ssdtMsg583 => 'Selecione FACP';

  @override
  String get ssdtMsg584 => 'Selecione o formulário FACP';

  @override
  String get ssdtMsg585 => 'registro';

  @override
  String get ssdtMsg586 => 'limpar registro';

  @override
  String get ssdtMsg587 => 'Exportar registro';

  @override
  String get ssdtMsg588 => 'Patches pré-fabricados';

  @override
  String get ssdtMsg589 => 'Executar correção';

  @override
  String get ssdtMsg590 => 'Selecione um arquivo/diretório';

  @override
  String get ssdtMsg591 => 'Extrair ACPI';

  @override
  String get ssdtMsg592 => 'diretório de saída';

  @override
  String get ssdtMsg593 => 'Selecione o arquivo DSDT ou o diretório ACPIs';

  @override
  String get ssdtMsg594 => 'Selecione ACPIs';

  @override
  String get ssdtMsg595 => 'configuração de mesclagem';

  @override
  String get ssdtMsg596 => 'Selecione a configuração';

  @override
  String get ssdtMsg597 => 'Selecione o arquivo config.plist';

  @override
  String get ssdtMsg598 => 'Preferências';

  @override
  String get ssdtMsg599 => 'Patches de plataforma';

  @override
  String get ssdtMsg600 => 'Guia de patches';

  @override
  String get ssdtMsg601 => 'Sobre o aplicativo';

  @override
  String ssdtMsg602(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String get ssdtMsg603 => 'Selecione o patch';

  @override
  String get ssdtMsg604 => 'Área de trabalho';

  @override
  String get ssdtMsg605 => 'servidor';

  @override
  String get ssdtMsg606 => 'SSDT está sendo gerado, não repita a operação!';

  @override
  String get ssdtMsg607 => 'Nenhum SSDT selecionado';

  @override
  String ssdtMsg608(String arg0, String arg1) {
    return '$arg0 $arg1';
  }

  @override
  String ssdtMsg609(String arg0, String arg1) {
    return 'lista $arg0: $arg1';
  }

  @override
  String get ssdtMsg610 => 'SSDT pré-fabricado';

  @override
  String get ssdtMsg611 => 'SSDT personalizado';

  @override
  String get ssdtMsg612 => 'Tipo de CPU:';

  @override
  String get ssdtMsg613 => 'Tipo de plataforma:';

  @override
  String get ssdtMsg614 => 'Área de trabalho';

  @override
  String get ssdtMsg615 => 'Área de trabalho';

  @override
  String get ssdtMsg616 => 'caderno';

  @override
  String get ssdtMsg617 => 'caderno';

  @override
  String get ssdtMsg618 => 'Mini-anfitrião';

  @override
  String get ssdtMsg619 => 'Mini-anfitrião';

  @override
  String get ssdtMsg620 => 'servidor';

  @override
  String get ssdtMsg621 => 'servidor';

  @override
  String ssdtMsg622(String arg0) {
    return 'Lista SSDT atualmente selecionada: $arg0';
  }

  @override
  String get ssdtMsg623 => 'Informações da plataforma:';

  @override
  String get ssdtMsg624 => 'Verifique tudo';

  @override
  String get ssdtMsg625 => 'Núcleo (recomendação oficial)';

  @override
  String get ssdtMsg626 => 'Recomendar (correção de função)';

  @override
  String get ssdtMsg627 => 'Opcional (completo com funções)';

  @override
  String get ssdtMsg628 => 'Informações da plataforma:';

  @override
  String get ssdtMsg629 => 'SSDT pré-fabricado';

  @override
  String get ssdtMsg630 => 'SSDT personalizado';

  @override
  String get ssdtMsg631 => 'SSDT personalizado';

  @override
  String get ssdtMsg632 => 'SSDT pré-fabricado';

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
  String get ssdtMsg636 => 'Visite GitHub';

  @override
  String get ssdtMsg637 => 'Baixe agora';

  @override
  String get ssdtMsg638 => 'encerramento';

  @override
  String get ssdtMsg639 => 'nova versão encontrada';

  @override
  String get ssdtMsg640 => 'Número da versão:';

  @override
  String get ssdtMsg641 => 'Tempo de lançamento:';

  @override
  String get ssdtMsg642 => 'A conexão com o servidor expirou';

  @override
  String get ssdtMsg643 => 'A conexão com o servidor expirou';

  @override
  String get ssdtMsg644 => 'Download cancelado';

  @override
  String get ssdtMsg645 => 'Download cancelado';

  @override
  String get ssdtMsg646 => 'Tempo limite de resposta de leitura';

  @override
  String get ssdtMsg647 => 'Tempo limite de resposta de leitura';

  @override
  String ssdtMsg648(String arg0) {
    return 'Ocorreu uma exceção ao obter informações do servidor! Código de status: $arg0';
  }

  @override
  String ssdtMsg649(String arg0) {
    return 'Falha na solicitação, código de status: $arg0';
  }

  @override
  String ssdtMsg650(String arg0) {
    return 'Tempo limite de download esgotado, sem progresso por $arg0 segundos, tarefa cancelada';
  }

  @override
  String ssdtMsg651(String arg0) {
    return 'O canal de registro não existe: $arg0';
  }

  @override
  String ssdtMsg652(String arg0, String arg1, String arg2) {
    return 'Exportação bem-sucedida! Caminho do arquivo: $arg0$arg1$arg2';
  }

  @override
  String ssdtMsg653(String arg0) {
    return 'Falha na exportação! Mensagem de erro: $arg0';
  }

  @override
  String ssdtMsg654(String arg0) {
    return 'O arquivo não existe! Falha na exportação! Caminho do arquivo: $arg0';
  }

  @override
  String ssdtMsg655(String arg0) {
    return 'Falha na inicialização do arquivo de log: $arg0';
  }

  @override
  String get ssdtMsg656 => 'desconhecido';

  @override
  String get ssdtMsg657 => 'mais solto';

  @override
  String get ssdtMsg658 => 'comprimento apenas';

  @override
  String get ssdtMsg659 =>
      'ID e comprimento da tabela, desabilitar cabeçalhos normalizados';

  @override
  String get ssdtMsg660 =>
      'ID e comprimento da tabela, habilite cabeçalhos normalizados';

  @override
  String get ssdtMsg661 =>
      'Intel Arrandale de 1ª geração, Sandy Bridge de 2ª geração, Ivy Bridge de 3ª geração';

  @override
  String get ssdtMsg662 =>
      'Intel Haswell de 4ª geração, Broadwell de 5ª geração';

  @override
  String get ssdtMsg663 =>
      'Intel Skylake de 6ª geração, Kaby Lake de 7ª geração, alguns Haswell de 4ª geração';

  @override
  String get ssdtMsg664 =>
      'Brilho personalizado, geralmente usado para alguns equipamentos não padrão ou configurações de necessidades especiais';

  @override
  String get ssdtMsg665 =>
      'Brilho personalizado, geralmente usado para alguns equipamentos não padrão ou configurações de necessidades especiais';

  @override
  String get ssdtMsg666 =>
      'Intel CoffeeLake de 8ª geração ~ 10ª geração e notebooks AMD';

  @override
  String get ssdtMsg667 =>
      'Outros (requer propriedades personalizadas do dispositivo applbkl-name / applbkl-data), podem não ser suportados';

  @override
  String ssdtMsg668(String arg0) {
    return 'A tabela não existe: $arg0';
  }

  @override
  String ssdtMsg669(String arg0) {
    return 'O comprimento dos dados recebidos é inferior a 4 bytes: $arg0';
  }

  @override
  String ssdtMsg670(String arg0) {
    return 'O conteúdo do arquivo tem menos de 4 bytes: $arg0';
  }

  @override
  String ssdtMsg671(String arg0, String arg1) {
    return 'Erro ao ler assinatura: $arg0, caminho do arquivo: $arg1';
  }

  @override
  String ssdtMsg672(String arg0) {
    return 'O diretório temporário foi criado em: $arg0';
  }

  @override
  String ssdtMsg673(String arg0) {
    return 'O diretório temporário já existe em: $arg0';
  }

  @override
  String ssdtMsg674(String arg0) {
    return 'Descompilando arquivo $arg0...';
  }

  @override
  String get ssdtMsg675 => 'Descompilando arquivos SSDT.aml em lotes...';

  @override
  String get ssdtMsg676 =>
      'Descompilando arquivos DSDT.aml e SSDT.aml em lotes...';

  @override
  String ssdtMsg677(String arg0) {
    return '=> $arg0 descompilação falhou!';
  }

  @override
  String ssdtMsg678(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg679(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg680(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String get ssdtMsg681 =>
      'Descompilando arquivos .aml com falha individualmente...';

  @override
  String ssdtMsg682(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg683(String arg0) {
    return '=> $arg0 descompilação falhou!';
  }

  @override
  String get ssdtMsg684 => 'Descompilando outros arquivos .aml...';

  @override
  String ssdtMsg685(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String get ssdtMsg686 =>
      'Nota: Tente não incluir caracteres chineses ou especiais no caminho ou nome do arquivo, caso contrário, poderá causar problemas inesperados!';

  @override
  String ssdtMsg687(String arg0) {
    return 'Ocorreu um erro: $arg0';
  }

  @override
  String ssdtMsg688(String arg0, String arg1) {
    return 'Ocorreu um erro ao processar caminhos no método getDevicePathsWithId $arg0: $arg1';
  }

  @override
  String ssdtMsg689(String arg0) {
    return 'Skip: $arg0, que foi descompilado corretamente antes!';
  }

  @override
  String ssdtMsg690(String arg0) {
    return 'O arquivo de destino está na lista de exclusão: $arg0';
  }

  @override
  String ssdtMsg691(String arg0) {
    return 'Caminho inválido: $arg0';
  }

  @override
  String get ssdtMsg692 => 'Caminho inválido';

  @override
  String ssdtMsg693(String arg0) {
    return 'Nenhum arquivo .aml ou .dat válido encontrado em $arg0!';
  }

  @override
  String get ssdtMsg694 => 'Nenhum arquivo .aml ou .dat válido encontrado';

  @override
  String ssdtMsg695(String arg0) {
    return 'Falha na descompilação: $arg0';
  }

  @override
  String get ssdtMsg696 =>
      'A ferramenta acpidump não está pronta! Operação encerrada!';

  @override
  String get ssdtMsg697 => 'Exportando tabelas ACPI...';

  @override
  String get ssdtMsg698 => 'A plataforma atual não suporta isso!';

  @override
  String get ssdtMsg699 => 'Aguardando autorização de senha do sudo...';

  @override
  String get platformName1000 => 'Plataforma Geração 0-Penryn-775';

  @override
  String get platformName1001 => 'Geração 0-Penryn-Notebook';

  @override
  String get platformName1002 => 'Host Geração 0-Penryn-mini';

  @override
  String get platformName1003 =>
      'Plataforma Cascade Lake-X&W-X599 de 10ª Geração';

  @override
  String get platformName1004 => 'Plataforma Comet Lake-1200 de 10ª Geração';

  @override
  String get platformName1005 => '10ª Geração-Comet Lake-Laptop';

  @override
  String get platformName1006 => 'Mini hospedeiro Comet Lake de 10ª geração';

  @override
  String get platformName1007 => '10ª Geração-Ice Lake-Laptop';

  @override
  String get platformName1008 => 'Mini hospedeiro Ice Lake de 10ª geração';

  @override
  String get platformName1009 => 'Plataforma Rocket Lake-1200 de 11ª geração';

  @override
  String get platformName1010 => '11ª Geração-Rocket Lake-Laptop';

  @override
  String get platformName1011 => 'Mini hospedeiro Tiger Lake de 11ª geração';

  @override
  String get platformName1012 => 'Plataforma Alder Lake-1700 de 12ª geração';

  @override
  String get platformName1013 => 'Caderno Alder Lake de 12ª geração';

  @override
  String get platformName1014 => 'Mini hospedeiro Alder Lake de 12ª geração';

  @override
  String get platformName1015 => 'Plataforma Raptor Lake-1700 de 13ª geração';

  @override
  String get platformName1016 => 'Caderno Raptor Lake de 13ª geração';

  @override
  String get platformName1017 => 'Anfitrião mini-Raptor Lake de 13ª geração';

  @override
  String get platformName1018 => 'Plataforma Raptor Lake-1700 de 14ª geração';

  @override
  String get platformName1019 => 'Caderno Raptor Lake de 14ª geração';

  @override
  String get platformName1020 => 'Anfitrião mini-Raptor Lake de 14ª geração';

  @override
  String get platformName1021 => 'Plataforma Arrow Lake-1851 de 15ª Geração';

  @override
  String get platformName1022 => 'Notebook Arrow Lake de 15ª geração';

  @override
  String get platformName1023 => 'Host Arrow Lake-mini de 15ª geração';

  @override
  String get platformName1024 => 'Geração 1-Arrandale-Notebook';

  @override
  String get platformName1025 => 'Host Geração 1-Arrandale-mini';

  @override
  String get platformName1026 => 'Plataforma Geração 1-Lynnfield-1156';

  @override
  String get platformName1027 => 'Plataforma Geração 1-Nehalem&Westmere-X58';

  @override
  String get platformName1028 => 'Plataforma Sandy Bridge-1155 de 2ª geração';

  @override
  String get platformName1029 => 'Plataforma Sandy Bridge-E-X79 de 2ª geração';

  @override
  String get platformName1030 => 'Notebook Sandy Bridge de 2ª geração';

  @override
  String get platformName1031 => 'Mini host Sandy Bridge de 2ª geração';

  @override
  String get platformName1032 => 'Plataforma Ivy Bridge-1155 de 3ª geração';

  @override
  String get platformName1033 => 'Plataforma Ivy Bridge-E-X79 de 3ª geração';

  @override
  String get platformName1034 => 'Notebook Ivy Bridge de 3ª geração';

  @override
  String get platformName1035 => 'Mini host Ivy Bridge de 3ª geração';

  @override
  String get platformName1036 => 'Plataforma Haswell-1150 de 4ª geração';

  @override
  String get platformName1037 => 'Plataforma Haswell-E-X99 de 4ª geração';

  @override
  String get platformName1038 => '4ª Geração-Haswell-Laptop';

  @override
  String get platformName1039 => 'Host Haswell-mini de 4ª geração';

  @override
  String get platformName1040 => 'Plataforma Broadwell-1150 de 5ª geração';

  @override
  String get platformName1041 => 'Plataforma Broadwell-E-X99 de 5ª geração';

  @override
  String get platformName1042 => 'Notebook Broadwell de 5ª geração';

  @override
  String get platformName1043 => 'Host Broadwell-mini de 5ª geração';

  @override
  String get platformName1044 => 'Plataforma Skylake-1151 de 6ª geração';

  @override
  String get platformName1045 => 'Plataforma Skylake-X&W-X299 de 6ª geração';

  @override
  String get platformName1046 => 'Notebook Skylake de 6ª geração';

  @override
  String get platformName1047 => 'Host Skylake-mini de 6ª geração';

  @override
  String get platformName1048 => 'Plataforma Kaby Lake-1151 de 7ª Geração';

  @override
  String get platformName1049 => '7ª Geração-Kaby Lake-Notebook';

  @override
  String get platformName1050 => '7ª geração-Kaby Lake-mini host';

  @override
  String get platformName1051 => 'Plataforma Coffee Lake-1151 de 8ª geração';

  @override
  String get platformName1052 => '8ª Geração-Lago Café-Caderno';

  @override
  String get platformName1053 => 'Mini anfitrião Coffee Lake de 8ª geração';

  @override
  String get platformName1054 => 'Plataforma Coffee Lake-1151 de 9ª geração';

  @override
  String get platformName1055 => '9ª Geração-Café Lago-Caderno';

  @override
  String get platformName1056 => 'Mini-anfitrião Coffee Lake de 9ª geração';

  @override
  String get platformName1057 => 'Bulldozer(15h) e Jaguar(16h)';

  @override
  String get platformName1058 => 'Bulldozer(15h) e Jaguar(16h)-Notebook';

  @override
  String get platformName1059 => 'Bulldozer(15h) e Jaguar(16h)-mini anfitrião';

  @override
  String get platformName1060 => 'Ryzen e Threadripper(17h e 19h)';

  @override
  String get platformName1061 =>
      'Ryzen e Threadripper(17h e 19h)-servidores topo de linha';

  @override
  String get platformName1062 => 'Notebook Ryzen';

  @override
  String get platformName1063 => 'Host Ryzen-mini';

  @override
  String get platformName1064 => 'servidor';

  @override
  String get platformName1065 => 'caderno';

  @override
  String get platformName1066 => 'Mini-anfitrião';
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

  @override
  String get ssdtMsg500 => 'Caminho ACPI do dispositivo:';

  @override
  String get ssdtMsg501 =>
      'Selecione o dispositivo de placa gráfica a ser falsificado';

  @override
  String get ssdtMsg502 => 'Modelo de placa gráfica desconhecido';

  @override
  String get ssdtMsg503 => 'Banco de dados de ID de placa gráfica falsificada:';

  @override
  String ssdtMsg504(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg505 => 'Por exemplo: 73BF';

  @override
  String get ssdtMsg506 => 'Requer 4 caracteres hexadecimais';

  @override
  String ssdtMsg507(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg508 => 'Opcional, nome da placa gráfica';

  @override
  String get ssdtMsg509 => 'ID da placa gráfica falsificada:';

  @override
  String get ssdtMsg510 => 'Nome da placa gráfica falsificada:';

  @override
  String ssdtMsg511(String arg0) {
    return 'Se deseja excluir o arquivo .dsl de origem: $arg0';
  }

  @override
  String ssdtMsg512(String arg0) {
    return 'Se deve forçar a compilação: $arg0';
  }

  @override
  String ssdtMsg513(String arg0) {
    return 'Se deve substituir o EFI de destino: $arg0';
  }

  @override
  String ssdtMsg514(String arg0) {
    return 'Padrão de correspondência: $arg0';
  }

  @override
  String ssdtMsg515(String arg0) {
    return 'Falha ao carregar dados HPET: $arg0';
  }

  @override
  String ssdtMsg516(String arg0) {
    return 'Falha ao inicializar dados HPET: $arg0';
  }

  @override
  String ssdtMsg517(String arg0) {
    return 'Falha ao inicializar o caminho ACPI: $arg0';
  }

  @override
  String get ssdtMsg518 => 'Sem notas de patch';

  @override
  String get ssdtMsg519 => 'Sem notas de patch';

  @override
  String ssdtMsg520(String arg0) {
    return 'Falha ao obter notas do patch: $arg0';
  }

  @override
  String get ssdtMsg521 => 'Falha ao obter notas do patch';

  @override
  String ssdtMsg522(String arg0) {
    return '$arg0 Limpar caminho de configuração';
  }

  @override
  String ssdtMsg523(String arg0, String arg1) {
    return '$arg0 selecionou um arquivo inválido: $arg1';
  }

  @override
  String ssdtMsg524(String arg0) {
    return 'Nenhuma configuração de patch encontrada para $arg0';
  }

  @override
  String get ssdtMsg525 =>
      'Selecione o SSDT que precisa ser personalizado antes de continuar!';

  @override
  String ssdtMsg526(String arg0) {
    return 'Falha ao executar o patch: $arg0';
  }

  @override
  String ssdtMsg527(String arg0, String arg1) {
    return 'Falha ao executar o patch [$arg0]: $arg1';
  }

  @override
  String get ssdtMsg528 => 'SSDT está sendo gerado, não repita a operação!';

  @override
  String get ssdtMsg529 => 'A lista de patches está vazia!';

  @override
  String get ssdtMsg530 =>
      'A extração está em andamento, não repita a operação!';

  @override
  String ssdtMsg531(String arg0) {
    return 'É muito provável que a tabela ACPI extraída pela plataforma $arg0 atual esteja contaminada por patches ACPI injetados por OpenCore e outros. É altamente recomendável operar na plataforma Windows/Linux!';
  }

  @override
  String get ssdtMsg532 => 'Falha ao extrair ACPI!';

  @override
  String get ssdtMsg533 => 'Extração de ACPI bem-sucedida!';

  @override
  String ssdtMsg534(String arg0) {
    return 'Falha ao preparar o patch: $arg0';
  }

  @override
  String ssdtMsg535(String arg0) {
    return 'Falha ao carregar DSDT/ACPI: $arg0';
  }

  @override
  String ssdtMsg536(String arg0) {
    return 'O arquivo config.plist não existe: $arg0';
  }

  @override
  String get ssdtMsg537 => 'Formato de arquivo plist não reconhecido';

  @override
  String ssdtMsg538(String arg0) {
    return 'O tipo config.plist é \"$arg0\"';
  }

  @override
  String ssdtMsg539(String arg0) {
    return 'Falha ao analisar o tipo plist: $arg0';
  }

  @override
  String get ssdtMsg540 => 'Selecione o diretório ACPIs primeiro!';

  @override
  String get ssdtMsg541 =>
      'Selecione primeiro o arquivo config.plist no diretório EFI!';

  @override
  String ssdtMsg542(String arg0) {
    return 'Caminho ACPI inválido: $arg0';
  }

  @override
  String ssdtMsg543(String arg0) {
    return 'O arquivo config.plist não existe: $arg0';
  }

  @override
  String ssdtMsg544(String arg0) {
    return 'Falha ao mesclar arquivos plist: $arg0';
  }

  @override
  String get ssdtMsg545 => 'sim';

  @override
  String get ssdtMsg546 => 'não';

  @override
  String get ssdtMsg547 => 'sim';

  @override
  String get ssdtMsg548 => 'não';

  @override
  String get ssdtMsg549 => 'sim';

  @override
  String get ssdtMsg550 => 'não';

  @override
  String get ssdtMsg551 => 'embutido';

  @override
  String get ssdtMsg552 => 'remoto';

  @override
  String get ssdtMsg553 => 'Nova versão do iasl';

  @override
  String get ssdtMsg554 => 'Versão antiga iasl-legacy';

  @override
  String get ssdtMsg555 => 'sim';

  @override
  String get ssdtMsg556 => 'não';

  @override
  String get ssdtMsg557 => 'Preferências';

  @override
  String get ssdtMsg558 => 'modo iasl';

  @override
  String get ssdtMsg559 => 'tipo de compilação iasl';

  @override
  String get ssdtMsg560 => 'Exclua arquivos .dsl descompilados';

  @override
  String get ssdtMsg561 => 'Forçar compilação';

  @override
  String get ssdtMsg562 => 'Se deve substituir o EFI de destino';

  @override
  String get ssdtMsg563 => 'Modo de correspondência ACPI';

  @override
  String get ssdtMsg564 => 'patch principal';

  @override
  String get ssdtMsg565 => 'Patches de recursos';

  @override
  String get ssdtMsg566 => 'Patches de dispositivos';

  @override
  String get ssdtMsg567 => 'patch dedicado';

  @override
  String get ssdtMsg568 => 'adesivo para dormir';

  @override
  String get ssdtMsg569 => 'Patches auxiliares';

  @override
  String get ssdtMsg570 => 'Patches pré-fabricados';

  @override
  String get ssdtMsg571 =>
      'Patches básicos necessários para inicialização normal do sistema e gerenciamento de energia';

  @override
  String get ssdtMsg572 =>
      'Patches que fornecem funcionalidades adicionais ou corrigem problemas de recursos';

  @override
  String get ssdtMsg573 => 'Patches para hardware de placa gráfica';

  @override
  String get ssdtMsg574 =>
      'Patches necessários apenas em placas-mãe ou arquiteturas específicas';

  @override
  String get ssdtMsg575 => 'Opcional, usado para corrigir problemas de sono';

  @override
  String get ssdtMsg576 =>
      'Não é obrigatório, mas pode completar a estrutura ACPI ou melhorar a compatibilidade';

  @override
  String get ssdtMsg577 => 'Selecione DMAR';

  @override
  String get ssdtMsg578 =>
      'Selecione a tabela DMAR que precisa ser personalizada';

  @override
  String get ssdtMsg579 => 'Selecione APIC';

  @override
  String get ssdtMsg580 =>
      'Selecione a tabela APIC que precisa ser personalizada';

  @override
  String get ssdtMsg581 => 'Selecione FACP';

  @override
  String get ssdtMsg582 => 'Selecione o formulário FACP';

  @override
  String get ssdtMsg583 => 'Selecione FACP';

  @override
  String get ssdtMsg584 => 'Selecione o formulário FACP';

  @override
  String get ssdtMsg585 => 'registro';

  @override
  String get ssdtMsg586 => 'limpar registro';

  @override
  String get ssdtMsg587 => 'Exportar registro';

  @override
  String get ssdtMsg588 => 'Patches pré-fabricados';

  @override
  String get ssdtMsg589 => 'Executar correção';

  @override
  String get ssdtMsg590 => 'Selecione um arquivo/diretório';

  @override
  String get ssdtMsg591 => 'Extrair ACPI';

  @override
  String get ssdtMsg592 => 'diretório de saída';

  @override
  String get ssdtMsg593 => 'Selecione o arquivo DSDT ou o diretório ACPIs';

  @override
  String get ssdtMsg594 => 'Selecione ACPIs';

  @override
  String get ssdtMsg595 => 'configuração de mesclagem';

  @override
  String get ssdtMsg596 => 'Selecione a configuração';

  @override
  String get ssdtMsg597 => 'Selecione o arquivo config.plist';

  @override
  String get ssdtMsg598 => 'Preferências';

  @override
  String get ssdtMsg599 => 'Patches de plataforma';

  @override
  String get ssdtMsg600 => 'Guia de patches';

  @override
  String get ssdtMsg601 => 'Sobre o aplicativo';

  @override
  String ssdtMsg602(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String get ssdtMsg603 => 'Selecione o patch';

  @override
  String get ssdtMsg604 => 'Área de trabalho';

  @override
  String get ssdtMsg605 => 'servidor';

  @override
  String get ssdtMsg606 => 'SSDT está sendo gerado, não repita a operação!';

  @override
  String get ssdtMsg607 => 'Nenhum SSDT selecionado';

  @override
  String ssdtMsg608(String arg0, String arg1) {
    return '$arg0 $arg1';
  }

  @override
  String ssdtMsg609(String arg0, String arg1) {
    return 'lista $arg0: $arg1';
  }

  @override
  String get ssdtMsg610 => 'SSDT pré-fabricado';

  @override
  String get ssdtMsg611 => 'SSDT personalizado';

  @override
  String get ssdtMsg612 => 'Tipo de CPU:';

  @override
  String get ssdtMsg613 => 'Tipo de plataforma:';

  @override
  String get ssdtMsg614 => 'Área de trabalho';

  @override
  String get ssdtMsg615 => 'Área de trabalho';

  @override
  String get ssdtMsg616 => 'caderno';

  @override
  String get ssdtMsg617 => 'caderno';

  @override
  String get ssdtMsg618 => 'Mini-anfitrião';

  @override
  String get ssdtMsg619 => 'Mini-anfitrião';

  @override
  String get ssdtMsg620 => 'servidor';

  @override
  String get ssdtMsg621 => 'servidor';

  @override
  String ssdtMsg622(String arg0) {
    return 'Lista SSDT atualmente selecionada: $arg0';
  }

  @override
  String get ssdtMsg623 => 'Informações da plataforma:';

  @override
  String get ssdtMsg624 => 'Verifique tudo';

  @override
  String get ssdtMsg625 => 'Núcleo (recomendação oficial)';

  @override
  String get ssdtMsg626 => 'Recomendar (correção de função)';

  @override
  String get ssdtMsg627 => 'Opcional (completo com funções)';

  @override
  String get ssdtMsg628 => 'Informações da plataforma:';

  @override
  String get ssdtMsg629 => 'SSDT pré-fabricado';

  @override
  String get ssdtMsg630 => 'SSDT personalizado';

  @override
  String get ssdtMsg631 => 'SSDT personalizado';

  @override
  String get ssdtMsg632 => 'SSDT pré-fabricado';

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
  String get ssdtMsg636 => 'Visite GitHub';

  @override
  String get ssdtMsg637 => 'Baixe agora';

  @override
  String get ssdtMsg638 => 'encerramento';

  @override
  String get ssdtMsg639 => 'nova versão encontrada';

  @override
  String get ssdtMsg640 => 'Número da versão:';

  @override
  String get ssdtMsg641 => 'Tempo de lançamento:';

  @override
  String get ssdtMsg642 => 'A conexão com o servidor expirou';

  @override
  String get ssdtMsg643 => 'A conexão com o servidor expirou';

  @override
  String get ssdtMsg644 => 'Download cancelado';

  @override
  String get ssdtMsg645 => 'Download cancelado';

  @override
  String get ssdtMsg646 => 'Tempo limite de resposta de leitura';

  @override
  String get ssdtMsg647 => 'Tempo limite de resposta de leitura';

  @override
  String ssdtMsg648(String arg0) {
    return 'Ocorreu uma exceção ao obter informações do servidor! Código de status: $arg0';
  }

  @override
  String ssdtMsg649(String arg0) {
    return 'Falha na solicitação, código de status: $arg0';
  }

  @override
  String ssdtMsg650(String arg0) {
    return 'Tempo limite de download esgotado, sem progresso por $arg0 segundos, tarefa cancelada';
  }

  @override
  String ssdtMsg651(String arg0) {
    return 'O canal de registro não existe: $arg0';
  }

  @override
  String ssdtMsg652(String arg0, String arg1, String arg2) {
    return 'Exportação bem-sucedida! Caminho do arquivo: $arg0$arg1$arg2';
  }

  @override
  String ssdtMsg653(String arg0) {
    return 'Falha na exportação! Mensagem de erro: $arg0';
  }

  @override
  String ssdtMsg654(String arg0) {
    return 'O arquivo não existe! Falha na exportação! Caminho do arquivo: $arg0';
  }

  @override
  String ssdtMsg655(String arg0) {
    return 'Falha na inicialização do arquivo de log: $arg0';
  }

  @override
  String get ssdtMsg656 => 'desconhecido';

  @override
  String get ssdtMsg657 => 'mais solto';

  @override
  String get ssdtMsg658 => 'comprimento apenas';

  @override
  String get ssdtMsg659 =>
      'ID e comprimento da tabela, desabilitar cabeçalhos normalizados';

  @override
  String get ssdtMsg660 =>
      'ID e comprimento da tabela, habilite cabeçalhos normalizados';

  @override
  String get ssdtMsg661 =>
      'Intel Arrandale de 1ª geração, Sandy Bridge de 2ª geração, Ivy Bridge de 3ª geração';

  @override
  String get ssdtMsg662 =>
      'Intel Haswell de 4ª geração, Broadwell de 5ª geração';

  @override
  String get ssdtMsg663 =>
      'Intel Skylake de 6ª geração, Kaby Lake de 7ª geração, alguns Haswell de 4ª geração';

  @override
  String get ssdtMsg664 =>
      'Brilho personalizado, geralmente usado para alguns equipamentos não padrão ou configurações de necessidades especiais';

  @override
  String get ssdtMsg665 =>
      'Brilho personalizado, geralmente usado para alguns equipamentos não padrão ou configurações de necessidades especiais';

  @override
  String get ssdtMsg666 =>
      'Intel CoffeeLake de 8ª geração ~ 10ª geração e notebooks AMD';

  @override
  String get ssdtMsg667 =>
      'Outros (requer propriedades personalizadas do dispositivo applbkl-name / applbkl-data), podem não ser suportados';

  @override
  String ssdtMsg668(String arg0) {
    return 'A tabela não existe: $arg0';
  }

  @override
  String ssdtMsg669(String arg0) {
    return 'O comprimento dos dados recebidos é inferior a 4 bytes: $arg0';
  }

  @override
  String ssdtMsg670(String arg0) {
    return 'O conteúdo do arquivo tem menos de 4 bytes: $arg0';
  }

  @override
  String ssdtMsg671(String arg0, String arg1) {
    return 'Erro ao ler assinatura: $arg0, caminho do arquivo: $arg1';
  }

  @override
  String ssdtMsg672(String arg0) {
    return 'O diretório temporário foi criado em: $arg0';
  }

  @override
  String ssdtMsg673(String arg0) {
    return 'O diretório temporário já existe em: $arg0';
  }

  @override
  String ssdtMsg674(String arg0) {
    return 'Descompilando arquivo $arg0...';
  }

  @override
  String get ssdtMsg675 => 'Descompilando arquivos SSDT.aml em lotes...';

  @override
  String get ssdtMsg676 =>
      'Descompilando arquivos DSDT.aml e SSDT.aml em lotes...';

  @override
  String ssdtMsg677(String arg0) {
    return '=> $arg0 descompilação falhou!';
  }

  @override
  String ssdtMsg678(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg679(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg680(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String get ssdtMsg681 =>
      'Descompilando arquivos .aml com falha individualmente...';

  @override
  String ssdtMsg682(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg683(String arg0) {
    return '=> $arg0 descompilação falhou!';
  }

  @override
  String get ssdtMsg684 => 'Descompilando outros arquivos .aml...';

  @override
  String ssdtMsg685(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String get ssdtMsg686 =>
      'Nota: Tente não incluir caracteres chineses ou especiais no caminho ou nome do arquivo, caso contrário, poderá causar problemas inesperados!';

  @override
  String ssdtMsg687(String arg0) {
    return 'Ocorreu um erro: $arg0';
  }

  @override
  String ssdtMsg688(String arg0, String arg1) {
    return 'Ocorreu um erro ao processar caminhos no método getDevicePathsWithId $arg0: $arg1';
  }

  @override
  String ssdtMsg689(String arg0) {
    return 'Skip: $arg0, que foi descompilado corretamente antes!';
  }

  @override
  String ssdtMsg690(String arg0) {
    return 'O arquivo de destino está na lista de exclusão: $arg0';
  }

  @override
  String ssdtMsg691(String arg0) {
    return 'Caminho inválido: $arg0';
  }

  @override
  String get ssdtMsg692 => 'Caminho inválido';

  @override
  String ssdtMsg693(String arg0) {
    return 'Nenhum arquivo .aml ou .dat válido encontrado em $arg0!';
  }

  @override
  String get ssdtMsg694 => 'Nenhum arquivo .aml ou .dat válido encontrado';

  @override
  String ssdtMsg695(String arg0) {
    return 'Falha na descompilação: $arg0';
  }

  @override
  String get ssdtMsg696 =>
      'A ferramenta acpidump não está pronta! Operação encerrada!';

  @override
  String get ssdtMsg697 => 'Exportando tabelas ACPI...';

  @override
  String get ssdtMsg698 => 'A plataforma atual não suporta isso!';

  @override
  String get ssdtMsg699 => 'Aguardando autorização de senha do sudo...';

  @override
  String get platformName1000 => 'Plataforma Geração 0-Penryn-775';

  @override
  String get platformName1001 => 'Geração 0-Penryn-Notebook';

  @override
  String get platformName1002 => 'Host Geração 0-Penryn-mini';

  @override
  String get platformName1003 =>
      'Plataforma Cascade Lake-X&W-X599 de 10ª Geração';

  @override
  String get platformName1004 => 'Plataforma Comet Lake-1200 de 10ª Geração';

  @override
  String get platformName1005 => '10ª Geração-Comet Lake-Laptop';

  @override
  String get platformName1006 => 'Mini hospedeiro Comet Lake de 10ª geração';

  @override
  String get platformName1007 => '10ª Geração-Ice Lake-Laptop';

  @override
  String get platformName1008 => 'Mini hospedeiro Ice Lake de 10ª geração';

  @override
  String get platformName1009 => 'Plataforma Rocket Lake-1200 de 11ª geração';

  @override
  String get platformName1010 => '11ª Geração-Rocket Lake-Laptop';

  @override
  String get platformName1011 => 'Mini hospedeiro Tiger Lake de 11ª geração';

  @override
  String get platformName1012 => 'Plataforma Alder Lake-1700 de 12ª geração';

  @override
  String get platformName1013 => 'Caderno Alder Lake de 12ª geração';

  @override
  String get platformName1014 => 'Mini hospedeiro Alder Lake de 12ª geração';

  @override
  String get platformName1015 => 'Plataforma Raptor Lake-1700 de 13ª geração';

  @override
  String get platformName1016 => 'Caderno Raptor Lake de 13ª geração';

  @override
  String get platformName1017 => 'Anfitrião mini-Raptor Lake de 13ª geração';

  @override
  String get platformName1018 => 'Plataforma Raptor Lake-1700 de 14ª geração';

  @override
  String get platformName1019 => 'Caderno Raptor Lake de 14ª geração';

  @override
  String get platformName1020 => 'Anfitrião mini-Raptor Lake de 14ª geração';

  @override
  String get platformName1021 => 'Plataforma Arrow Lake-1851 de 15ª Geração';

  @override
  String get platformName1022 => 'Notebook Arrow Lake de 15ª geração';

  @override
  String get platformName1023 => 'Host Arrow Lake-mini de 15ª geração';

  @override
  String get platformName1024 => 'Geração 1-Arrandale-Notebook';

  @override
  String get platformName1025 => 'Host Geração 1-Arrandale-mini';

  @override
  String get platformName1026 => 'Plataforma Geração 1-Lynnfield-1156';

  @override
  String get platformName1027 => 'Plataforma Geração 1-Nehalem&Westmere-X58';

  @override
  String get platformName1028 => 'Plataforma Sandy Bridge-1155 de 2ª geração';

  @override
  String get platformName1029 => 'Plataforma Sandy Bridge-E-X79 de 2ª geração';

  @override
  String get platformName1030 => 'Notebook Sandy Bridge de 2ª geração';

  @override
  String get platformName1031 => 'Mini host Sandy Bridge de 2ª geração';

  @override
  String get platformName1032 => 'Plataforma Ivy Bridge-1155 de 3ª geração';

  @override
  String get platformName1033 => 'Plataforma Ivy Bridge-E-X79 de 3ª geração';

  @override
  String get platformName1034 => 'Notebook Ivy Bridge de 3ª geração';

  @override
  String get platformName1035 => 'Mini host Ivy Bridge de 3ª geração';

  @override
  String get platformName1036 => 'Plataforma Haswell-1150 de 4ª geração';

  @override
  String get platformName1037 => 'Plataforma Haswell-E-X99 de 4ª geração';

  @override
  String get platformName1038 => '4ª Geração-Haswell-Laptop';

  @override
  String get platformName1039 => 'Host Haswell-mini de 4ª geração';

  @override
  String get platformName1040 => 'Plataforma Broadwell-1150 de 5ª geração';

  @override
  String get platformName1041 => 'Plataforma Broadwell-E-X99 de 5ª geração';

  @override
  String get platformName1042 => 'Notebook Broadwell de 5ª geração';

  @override
  String get platformName1043 => 'Host Broadwell-mini de 5ª geração';

  @override
  String get platformName1044 => 'Plataforma Skylake-1151 de 6ª geração';

  @override
  String get platformName1045 => 'Plataforma Skylake-X&W-X299 de 6ª geração';

  @override
  String get platformName1046 => 'Notebook Skylake de 6ª geração';

  @override
  String get platformName1047 => 'Host Skylake-mini de 6ª geração';

  @override
  String get platformName1048 => 'Plataforma Kaby Lake-1151 de 7ª Geração';

  @override
  String get platformName1049 => '7ª Geração-Kaby Lake-Notebook';

  @override
  String get platformName1050 => '7ª geração-Kaby Lake-mini host';

  @override
  String get platformName1051 => 'Plataforma Coffee Lake-1151 de 8ª geração';

  @override
  String get platformName1052 => '8ª Geração-Lago Café-Caderno';

  @override
  String get platformName1053 => 'Mini anfitrião Coffee Lake de 8ª geração';

  @override
  String get platformName1054 => 'Plataforma Coffee Lake-1151 de 9ª geração';

  @override
  String get platformName1055 => '9ª Geração-Café Lago-Caderno';

  @override
  String get platformName1056 => 'Mini-anfitrião Coffee Lake de 9ª geração';

  @override
  String get platformName1057 => 'Bulldozer(15h) e Jaguar(16h)';

  @override
  String get platformName1058 => 'Bulldozer(15h) e Jaguar(16h)-Notebook';

  @override
  String get platformName1059 => 'Bulldozer(15h) e Jaguar(16h)-mini anfitrião';

  @override
  String get platformName1060 => 'Ryzen e Threadripper(17h e 19h)';

  @override
  String get platformName1061 =>
      'Ryzen e Threadripper(17h e 19h)-servidores topo de linha';

  @override
  String get platformName1062 => 'Notebook Ryzen';

  @override
  String get platformName1063 => 'Host Ryzen-mini';

  @override
  String get platformName1064 => 'servidor';

  @override
  String get platformName1065 => 'caderno';

  @override
  String get platformName1066 => 'Mini-anfitrião';
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

  @override
  String get ssdtMsg500 => 'Caminho ACPI do dispositivo:';

  @override
  String get ssdtMsg501 =>
      'Selecione o dispositivo de placa gráfica a ser falsificado';

  @override
  String get ssdtMsg502 => 'Modelo de placa gráfica desconhecido';

  @override
  String get ssdtMsg503 => 'Banco de dados de ID de placa gráfica falsificada:';

  @override
  String ssdtMsg504(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg505 => 'Por exemplo: 73BF';

  @override
  String get ssdtMsg506 => 'Requer 4 caracteres hexadecimais';

  @override
  String ssdtMsg507(String arg0) {
    return '$arg0';
  }

  @override
  String get ssdtMsg508 => 'Opcional, nome da placa gráfica';

  @override
  String get ssdtMsg509 => 'ID da placa gráfica falsificada:';

  @override
  String get ssdtMsg510 => 'Nome da placa gráfica falsificada:';

  @override
  String ssdtMsg511(String arg0) {
    return 'Se deseja excluir o arquivo .dsl de origem: $arg0';
  }

  @override
  String ssdtMsg512(String arg0) {
    return 'Se deve forçar a compilação: $arg0';
  }

  @override
  String ssdtMsg513(String arg0) {
    return 'Se deve substituir o EFI de destino: $arg0';
  }

  @override
  String ssdtMsg514(String arg0) {
    return 'Padrão de correspondência: $arg0';
  }

  @override
  String ssdtMsg515(String arg0) {
    return 'Falha ao carregar dados HPET: $arg0';
  }

  @override
  String ssdtMsg516(String arg0) {
    return 'Falha ao inicializar dados HPET: $arg0';
  }

  @override
  String ssdtMsg517(String arg0) {
    return 'Falha ao inicializar o caminho ACPI: $arg0';
  }

  @override
  String get ssdtMsg518 => 'Sem notas de patch';

  @override
  String get ssdtMsg519 => 'Sem notas de patch';

  @override
  String ssdtMsg520(String arg0) {
    return 'Falha ao obter notas do patch: $arg0';
  }

  @override
  String get ssdtMsg521 => 'Falha ao obter notas do patch';

  @override
  String ssdtMsg522(String arg0) {
    return '$arg0 Limpar caminho de configuração';
  }

  @override
  String ssdtMsg523(String arg0, String arg1) {
    return '$arg0 selecionou um arquivo inválido: $arg1';
  }

  @override
  String ssdtMsg524(String arg0) {
    return 'Nenhuma configuração de patch encontrada para $arg0';
  }

  @override
  String get ssdtMsg525 =>
      'Selecione o SSDT que precisa ser personalizado antes de continuar!';

  @override
  String ssdtMsg526(String arg0) {
    return 'Falha ao executar o patch: $arg0';
  }

  @override
  String ssdtMsg527(String arg0, String arg1) {
    return 'Falha ao executar o patch [$arg0]: $arg1';
  }

  @override
  String get ssdtMsg528 => 'SSDT está sendo gerado, não repita a operação!';

  @override
  String get ssdtMsg529 => 'A lista de patches está vazia!';

  @override
  String get ssdtMsg530 =>
      'A extração está em andamento, não repita a operação!';

  @override
  String ssdtMsg531(String arg0) {
    return 'É muito provável que a tabela ACPI extraída pela plataforma $arg0 atual esteja contaminada por patches ACPI injetados por OpenCore e outros. É altamente recomendável operar na plataforma Windows/Linux!';
  }

  @override
  String get ssdtMsg532 => 'Falha ao extrair ACPI!';

  @override
  String get ssdtMsg533 => 'Extração de ACPI bem-sucedida!';

  @override
  String ssdtMsg534(String arg0) {
    return 'Falha ao preparar o patch: $arg0';
  }

  @override
  String ssdtMsg535(String arg0) {
    return 'Falha ao carregar DSDT/ACPI: $arg0';
  }

  @override
  String ssdtMsg536(String arg0) {
    return 'O arquivo config.plist não existe: $arg0';
  }

  @override
  String get ssdtMsg537 => 'Formato de arquivo plist não reconhecido';

  @override
  String ssdtMsg538(String arg0) {
    return 'O tipo config.plist é \"$arg0\"';
  }

  @override
  String ssdtMsg539(String arg0) {
    return 'Falha ao analisar o tipo plist: $arg0';
  }

  @override
  String get ssdtMsg540 => 'Selecione o diretório ACPIs primeiro!';

  @override
  String get ssdtMsg541 =>
      'Selecione primeiro o arquivo config.plist no diretório EFI!';

  @override
  String ssdtMsg542(String arg0) {
    return 'Caminho ACPI inválido: $arg0';
  }

  @override
  String ssdtMsg543(String arg0) {
    return 'O arquivo config.plist não existe: $arg0';
  }

  @override
  String ssdtMsg544(String arg0) {
    return 'Falha ao mesclar arquivos plist: $arg0';
  }

  @override
  String get ssdtMsg545 => 'sim';

  @override
  String get ssdtMsg546 => 'não';

  @override
  String get ssdtMsg547 => 'sim';

  @override
  String get ssdtMsg548 => 'não';

  @override
  String get ssdtMsg549 => 'sim';

  @override
  String get ssdtMsg550 => 'não';

  @override
  String get ssdtMsg551 => 'embutido';

  @override
  String get ssdtMsg552 => 'remoto';

  @override
  String get ssdtMsg553 => 'Nova versão do iasl';

  @override
  String get ssdtMsg554 => 'Versão antiga iasl-legacy';

  @override
  String get ssdtMsg555 => 'sim';

  @override
  String get ssdtMsg556 => 'não';

  @override
  String get ssdtMsg557 => 'Preferências';

  @override
  String get ssdtMsg558 => 'modo iasl';

  @override
  String get ssdtMsg559 => 'tipo de compilação iasl';

  @override
  String get ssdtMsg560 => 'Exclua arquivos .dsl descompilados';

  @override
  String get ssdtMsg561 => 'Forçar compilação';

  @override
  String get ssdtMsg562 => 'Se deve substituir o EFI de destino';

  @override
  String get ssdtMsg563 => 'Modo de correspondência ACPI';

  @override
  String get ssdtMsg564 => 'patch principal';

  @override
  String get ssdtMsg565 => 'Patches de recursos';

  @override
  String get ssdtMsg566 => 'Patches de dispositivos';

  @override
  String get ssdtMsg567 => 'patch dedicado';

  @override
  String get ssdtMsg568 => 'adesivo para dormir';

  @override
  String get ssdtMsg569 => 'Patches auxiliares';

  @override
  String get ssdtMsg570 => 'Patches pré-fabricados';

  @override
  String get ssdtMsg571 =>
      'Patches básicos necessários para inicialização normal do sistema e gerenciamento de energia';

  @override
  String get ssdtMsg572 =>
      'Patches que fornecem funcionalidades adicionais ou corrigem problemas de recursos';

  @override
  String get ssdtMsg573 => 'Patches para hardware de placa gráfica';

  @override
  String get ssdtMsg574 =>
      'Patches necessários apenas em placas-mãe ou arquiteturas específicas';

  @override
  String get ssdtMsg575 => 'Opcional, usado para corrigir problemas de sono';

  @override
  String get ssdtMsg576 =>
      'Não é obrigatório, mas pode completar a estrutura ACPI ou melhorar a compatibilidade';

  @override
  String get ssdtMsg577 => 'Selecione DMAR';

  @override
  String get ssdtMsg578 =>
      'Selecione a tabela DMAR que precisa ser personalizada';

  @override
  String get ssdtMsg579 => 'Selecione APIC';

  @override
  String get ssdtMsg580 =>
      'Selecione a tabela APIC que precisa ser personalizada';

  @override
  String get ssdtMsg581 => 'Selecione FACP';

  @override
  String get ssdtMsg582 => 'Selecione o formulário FACP';

  @override
  String get ssdtMsg583 => 'Selecione FACP';

  @override
  String get ssdtMsg584 => 'Selecione o formulário FACP';

  @override
  String get ssdtMsg585 => 'registro';

  @override
  String get ssdtMsg586 => 'limpar registro';

  @override
  String get ssdtMsg587 => 'Exportar registro';

  @override
  String get ssdtMsg588 => 'Patches pré-fabricados';

  @override
  String get ssdtMsg589 => 'Executar correção';

  @override
  String get ssdtMsg590 => 'Selecione um arquivo/diretório';

  @override
  String get ssdtMsg591 => 'Extrair ACPI';

  @override
  String get ssdtMsg592 => 'diretório de saída';

  @override
  String get ssdtMsg593 => 'Selecione o arquivo DSDT ou o diretório ACPIs';

  @override
  String get ssdtMsg594 => 'Selecione ACPIs';

  @override
  String get ssdtMsg595 => 'configuração de mesclagem';

  @override
  String get ssdtMsg596 => 'Selecione a configuração';

  @override
  String get ssdtMsg597 => 'Selecione o arquivo config.plist';

  @override
  String get ssdtMsg598 => 'Preferências';

  @override
  String get ssdtMsg599 => 'Patches de plataforma';

  @override
  String get ssdtMsg600 => 'Guia de patches';

  @override
  String get ssdtMsg601 => 'Sobre o aplicativo';

  @override
  String ssdtMsg602(String arg0, String arg1) {
    return '$arg0: $arg1';
  }

  @override
  String get ssdtMsg603 => 'Selecione o patch';

  @override
  String get ssdtMsg604 => 'Área de trabalho';

  @override
  String get ssdtMsg605 => 'servidor';

  @override
  String get ssdtMsg606 => 'SSDT está sendo gerado, não repita a operação!';

  @override
  String get ssdtMsg607 => 'Nenhum SSDT selecionado';

  @override
  String ssdtMsg608(String arg0, String arg1) {
    return '$arg0 $arg1';
  }

  @override
  String ssdtMsg609(String arg0, String arg1) {
    return 'lista $arg0: $arg1';
  }

  @override
  String get ssdtMsg610 => 'SSDT pré-fabricado';

  @override
  String get ssdtMsg611 => 'SSDT personalizado';

  @override
  String get ssdtMsg612 => 'Tipo de CPU:';

  @override
  String get ssdtMsg613 => 'Tipo de plataforma:';

  @override
  String get ssdtMsg614 => 'Área de trabalho';

  @override
  String get ssdtMsg615 => 'Área de trabalho';

  @override
  String get ssdtMsg616 => 'caderno';

  @override
  String get ssdtMsg617 => 'caderno';

  @override
  String get ssdtMsg618 => 'Mini-anfitrião';

  @override
  String get ssdtMsg619 => 'Mini-anfitrião';

  @override
  String get ssdtMsg620 => 'servidor';

  @override
  String get ssdtMsg621 => 'servidor';

  @override
  String ssdtMsg622(String arg0) {
    return 'Lista SSDT atualmente selecionada: $arg0';
  }

  @override
  String get ssdtMsg623 => 'Informações da plataforma:';

  @override
  String get ssdtMsg624 => 'Verifique tudo';

  @override
  String get ssdtMsg625 => 'Núcleo (recomendação oficial)';

  @override
  String get ssdtMsg626 => 'Recomendar (correção de função)';

  @override
  String get ssdtMsg627 => 'Opcional (completo com funções)';

  @override
  String get ssdtMsg628 => 'Informações da plataforma:';

  @override
  String get ssdtMsg629 => 'SSDT pré-fabricado';

  @override
  String get ssdtMsg630 => 'SSDT personalizado';

  @override
  String get ssdtMsg631 => 'SSDT personalizado';

  @override
  String get ssdtMsg632 => 'SSDT pré-fabricado';

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
  String get ssdtMsg636 => 'Visite GitHub';

  @override
  String get ssdtMsg637 => 'Baixe agora';

  @override
  String get ssdtMsg638 => 'encerramento';

  @override
  String get ssdtMsg639 => 'nova versão encontrada';

  @override
  String get ssdtMsg640 => 'Número da versão:';

  @override
  String get ssdtMsg641 => 'Tempo de lançamento:';

  @override
  String get ssdtMsg642 => 'A conexão com o servidor expirou';

  @override
  String get ssdtMsg643 => 'A conexão com o servidor expirou';

  @override
  String get ssdtMsg644 => 'Download cancelado';

  @override
  String get ssdtMsg645 => 'Download cancelado';

  @override
  String get ssdtMsg646 => 'Tempo limite de resposta de leitura';

  @override
  String get ssdtMsg647 => 'Tempo limite de resposta de leitura';

  @override
  String ssdtMsg648(String arg0) {
    return 'Ocorreu uma exceção ao obter informações do servidor! Código de status: $arg0';
  }

  @override
  String ssdtMsg649(String arg0) {
    return 'Falha na solicitação, código de status: $arg0';
  }

  @override
  String ssdtMsg650(String arg0) {
    return 'Tempo limite de download esgotado, sem progresso por $arg0 segundos, tarefa cancelada';
  }

  @override
  String ssdtMsg651(String arg0) {
    return 'O canal de registro não existe: $arg0';
  }

  @override
  String ssdtMsg652(String arg0, String arg1, String arg2) {
    return 'Exportação bem-sucedida! Caminho do arquivo: $arg0$arg1$arg2';
  }

  @override
  String ssdtMsg653(String arg0) {
    return 'Falha na exportação! Mensagem de erro: $arg0';
  }

  @override
  String ssdtMsg654(String arg0) {
    return 'O arquivo não existe! Falha na exportação! Caminho do arquivo: $arg0';
  }

  @override
  String ssdtMsg655(String arg0) {
    return 'Falha na inicialização do arquivo de log: $arg0';
  }

  @override
  String get ssdtMsg656 => 'desconhecido';

  @override
  String get ssdtMsg657 => 'mais solto';

  @override
  String get ssdtMsg658 => 'comprimento apenas';

  @override
  String get ssdtMsg659 =>
      'ID e comprimento da tabela, desabilitar cabeçalhos normalizados';

  @override
  String get ssdtMsg660 =>
      'ID e comprimento da tabela, habilite cabeçalhos normalizados';

  @override
  String get ssdtMsg661 =>
      'Intel Arrandale de 1ª geração, Sandy Bridge de 2ª geração, Ivy Bridge de 3ª geração';

  @override
  String get ssdtMsg662 =>
      'Intel Haswell de 4ª geração, Broadwell de 5ª geração';

  @override
  String get ssdtMsg663 =>
      'Intel Skylake de 6ª geração, Kaby Lake de 7ª geração, alguns Haswell de 4ª geração';

  @override
  String get ssdtMsg664 =>
      'Brilho personalizado, geralmente usado para alguns equipamentos não padrão ou configurações de necessidades especiais';

  @override
  String get ssdtMsg665 =>
      'Brilho personalizado, geralmente usado para alguns equipamentos não padrão ou configurações de necessidades especiais';

  @override
  String get ssdtMsg666 =>
      'Intel CoffeeLake de 8ª geração ~ 10ª geração e notebooks AMD';

  @override
  String get ssdtMsg667 =>
      'Outros (requer propriedades personalizadas do dispositivo applbkl-name / applbkl-data), podem não ser suportados';

  @override
  String ssdtMsg668(String arg0) {
    return 'A tabela não existe: $arg0';
  }

  @override
  String ssdtMsg669(String arg0) {
    return 'O comprimento dos dados recebidos é inferior a 4 bytes: $arg0';
  }

  @override
  String ssdtMsg670(String arg0) {
    return 'O conteúdo do arquivo tem menos de 4 bytes: $arg0';
  }

  @override
  String ssdtMsg671(String arg0, String arg1) {
    return 'Erro ao ler assinatura: $arg0, caminho do arquivo: $arg1';
  }

  @override
  String ssdtMsg672(String arg0) {
    return 'O diretório temporário foi criado em: $arg0';
  }

  @override
  String ssdtMsg673(String arg0) {
    return 'O diretório temporário já existe em: $arg0';
  }

  @override
  String ssdtMsg674(String arg0) {
    return 'Descompilando arquivo $arg0...';
  }

  @override
  String get ssdtMsg675 => 'Descompilando arquivos SSDT.aml em lotes...';

  @override
  String get ssdtMsg676 =>
      'Descompilando arquivos DSDT.aml e SSDT.aml em lotes...';

  @override
  String ssdtMsg677(String arg0) {
    return '=> $arg0 descompilação falhou!';
  }

  @override
  String ssdtMsg678(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg679(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg680(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String get ssdtMsg681 =>
      'Descompilando arquivos .aml com falha individualmente...';

  @override
  String ssdtMsg682(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String ssdtMsg683(String arg0) {
    return '=> $arg0 descompilação falhou!';
  }

  @override
  String get ssdtMsg684 => 'Descompilando outros arquivos .aml...';

  @override
  String ssdtMsg685(String arg0) {
    return '=> $arg0 descompilado com sucesso!';
  }

  @override
  String get ssdtMsg686 =>
      'Nota: Tente não incluir caracteres chineses ou especiais no caminho ou nome do arquivo, caso contrário, poderá causar problemas inesperados!';

  @override
  String ssdtMsg687(String arg0) {
    return 'Ocorreu um erro: $arg0';
  }

  @override
  String ssdtMsg688(String arg0, String arg1) {
    return 'Ocorreu um erro ao processar caminhos no método getDevicePathsWithId $arg0: $arg1';
  }

  @override
  String ssdtMsg689(String arg0) {
    return 'Skip: $arg0, que foi descompilado corretamente antes!';
  }

  @override
  String ssdtMsg690(String arg0) {
    return 'O arquivo de destino está na lista de exclusão: $arg0';
  }

  @override
  String ssdtMsg691(String arg0) {
    return 'Caminho inválido: $arg0';
  }

  @override
  String get ssdtMsg692 => 'Caminho inválido';

  @override
  String ssdtMsg693(String arg0) {
    return 'Nenhum arquivo .aml ou .dat válido encontrado em $arg0!';
  }

  @override
  String get ssdtMsg694 => 'Nenhum arquivo .aml ou .dat válido encontrado';

  @override
  String ssdtMsg695(String arg0) {
    return 'Falha na descompilação: $arg0';
  }

  @override
  String get ssdtMsg696 =>
      'A ferramenta acpidump não está pronta! Operação encerrada!';

  @override
  String get ssdtMsg697 => 'Exportando tabelas ACPI...';

  @override
  String get ssdtMsg698 => 'A plataforma atual não suporta isso!';

  @override
  String get ssdtMsg699 => 'Aguardando autorização de senha do sudo...';

  @override
  String get platformName1000 => 'Plataforma Geração 0-Penryn-775';

  @override
  String get platformName1001 => 'Geração 0-Penryn-Notebook';

  @override
  String get platformName1002 => 'Host Geração 0-Penryn-mini';

  @override
  String get platformName1003 =>
      'Plataforma Cascade Lake-X&W-X599 de 10ª Geração';

  @override
  String get platformName1004 => 'Plataforma Comet Lake-1200 de 10ª Geração';

  @override
  String get platformName1005 => '10ª Geração-Comet Lake-Laptop';

  @override
  String get platformName1006 => 'Mini hospedeiro Comet Lake de 10ª geração';

  @override
  String get platformName1007 => '10ª Geração-Ice Lake-Laptop';

  @override
  String get platformName1008 => 'Mini hospedeiro Ice Lake de 10ª geração';

  @override
  String get platformName1009 => 'Plataforma Rocket Lake-1200 de 11ª geração';

  @override
  String get platformName1010 => '11ª Geração-Rocket Lake-Laptop';

  @override
  String get platformName1011 => 'Mini hospedeiro Tiger Lake de 11ª geração';

  @override
  String get platformName1012 => 'Plataforma Alder Lake-1700 de 12ª geração';

  @override
  String get platformName1013 => 'Caderno Alder Lake de 12ª geração';

  @override
  String get platformName1014 => 'Mini hospedeiro Alder Lake de 12ª geração';

  @override
  String get platformName1015 => 'Plataforma Raptor Lake-1700 de 13ª geração';

  @override
  String get platformName1016 => 'Caderno Raptor Lake de 13ª geração';

  @override
  String get platformName1017 => 'Anfitrião mini-Raptor Lake de 13ª geração';

  @override
  String get platformName1018 => 'Plataforma Raptor Lake-1700 de 14ª geração';

  @override
  String get platformName1019 => 'Caderno Raptor Lake de 14ª geração';

  @override
  String get platformName1020 => 'Anfitrião mini-Raptor Lake de 14ª geração';

  @override
  String get platformName1021 => 'Plataforma Arrow Lake-1851 de 15ª Geração';

  @override
  String get platformName1022 => 'Notebook Arrow Lake de 15ª geração';

  @override
  String get platformName1023 => 'Host Arrow Lake-mini de 15ª geração';

  @override
  String get platformName1024 => 'Geração 1-Arrandale-Notebook';

  @override
  String get platformName1025 => 'Host Geração 1-Arrandale-mini';

  @override
  String get platformName1026 => 'Plataforma Geração 1-Lynnfield-1156';

  @override
  String get platformName1027 => 'Plataforma Geração 1-Nehalem&Westmere-X58';

  @override
  String get platformName1028 => 'Plataforma Sandy Bridge-1155 de 2ª geração';

  @override
  String get platformName1029 => 'Plataforma Sandy Bridge-E-X79 de 2ª geração';

  @override
  String get platformName1030 => 'Notebook Sandy Bridge de 2ª geração';

  @override
  String get platformName1031 => 'Mini host Sandy Bridge de 2ª geração';

  @override
  String get platformName1032 => 'Plataforma Ivy Bridge-1155 de 3ª geração';

  @override
  String get platformName1033 => 'Plataforma Ivy Bridge-E-X79 de 3ª geração';

  @override
  String get platformName1034 => 'Notebook Ivy Bridge de 3ª geração';

  @override
  String get platformName1035 => 'Mini host Ivy Bridge de 3ª geração';

  @override
  String get platformName1036 => 'Plataforma Haswell-1150 de 4ª geração';

  @override
  String get platformName1037 => 'Plataforma Haswell-E-X99 de 4ª geração';

  @override
  String get platformName1038 => '4ª Geração-Haswell-Laptop';

  @override
  String get platformName1039 => 'Host Haswell-mini de 4ª geração';

  @override
  String get platformName1040 => 'Plataforma Broadwell-1150 de 5ª geração';

  @override
  String get platformName1041 => 'Plataforma Broadwell-E-X99 de 5ª geração';

  @override
  String get platformName1042 => 'Notebook Broadwell de 5ª geração';

  @override
  String get platformName1043 => 'Host Broadwell-mini de 5ª geração';

  @override
  String get platformName1044 => 'Plataforma Skylake-1151 de 6ª geração';

  @override
  String get platformName1045 => 'Plataforma Skylake-X&W-X299 de 6ª geração';

  @override
  String get platformName1046 => 'Notebook Skylake de 6ª geração';

  @override
  String get platformName1047 => 'Host Skylake-mini de 6ª geração';

  @override
  String get platformName1048 => 'Plataforma Kaby Lake-1151 de 7ª Geração';

  @override
  String get platformName1049 => '7ª Geração-Kaby Lake-Notebook';

  @override
  String get platformName1050 => '7ª geração-Kaby Lake-mini host';

  @override
  String get platformName1051 => 'Plataforma Coffee Lake-1151 de 8ª geração';

  @override
  String get platformName1052 => '8ª Geração-Lago Café-Caderno';

  @override
  String get platformName1053 => 'Mini anfitrião Coffee Lake de 8ª geração';

  @override
  String get platformName1054 => 'Plataforma Coffee Lake-1151 de 9ª geração';

  @override
  String get platformName1055 => '9ª Geração-Café Lago-Caderno';

  @override
  String get platformName1056 => 'Mini-anfitrião Coffee Lake de 9ª geração';

  @override
  String get platformName1057 => 'Bulldozer(15h) e Jaguar(16h)';

  @override
  String get platformName1058 => 'Bulldozer(15h) e Jaguar(16h)-Notebook';

  @override
  String get platformName1059 => 'Bulldozer(15h) e Jaguar(16h)-mini anfitrião';

  @override
  String get platformName1060 => 'Ryzen e Threadripper(17h e 19h)';

  @override
  String get platformName1061 =>
      'Ryzen e Threadripper(17h e 19h)-servidores topo de linha';

  @override
  String get platformName1062 => 'Notebook Ryzen';

  @override
  String get platformName1063 => 'Host Ryzen-mini';

  @override
  String get platformName1064 => 'servidor';

  @override
  String get platformName1065 => 'caderno';

  @override
  String get platformName1066 => 'Mini-anfitrião';
}
