<div align="center">
  <h1>RapidSSDT</h1>
  <p>
    <a href="#english">English</a> | 
    <a href="#português-brasil">Português (Brasil)</a> | 
    <a href="#中文">中文</a>
  </p>
</div>

---

<h2 id="english">🇬🇧 English</h2>

### Origin, Credits & Translation
This project was originally created by **[JeoJay127](https://github.com/JeoJay127)**. All original logic and development credits belong to him.

**About the Translation:**
I am **Alessandro ([alebypegasus](https://github.com/alebypegasus))**. I found this incredible tool, absolutely loved its capabilities for the Hackintosh community, and took the initiative to completely translate and internationalize it into English, Portuguese, and more. 
If you want to support this translation effort or my other works, please check out my GitHub. We are also currently translating and improving **[RapidEFI](https://github.com/alebypegasus/RapidEFI-Tool)**, another excellent tool for automated OpenCore configurations!

### Table of Contents
- [Project Intent](#project-intent)
- [1. Introduction to RapidSSDT](#1-introduction-to-rapidssdt)
- [2. Software Preview](#2-software-preview)
- [3. Features](#3-features)
- [4. System Compatibility](#4-system-compatibility)
- [5. Supported SSDTs](#5-supported-ssdts)
- [6. ACPI Extraction](#6-acpi-extraction)
- [7. User Guide](#7-user-guide)
- [8. Acknowledgments](#8-acknowledgments)

### Project Intent
During the traditional Hackintosh configuration process:
- The barrier to entry for writing SSDT / DSDT patches is high.
- Requires frequent consultation of ACPI specifications, example repositories, and forum posts.
- Manually editing ASL is error-prone and hard to maintain.
- Beginners often don't know "which patches are required and which are optional".

The goal of RapidSSDT is: **To consolidate "fragmented ACPI experience" and "repetitive patching work" into a visual, structured, and reusable workflow.**

### 1. Introduction to RapidSSDT
**RapidSSDT** is an open-source, cross-platform graphical tool developed with **Flutter** (supporting **Windows / macOS / Linux**).
It is designed to **simplify the generation and customization of SSDT / DSDT patches** in Hackintosh environments, lowering the barrier for ACPI customization.

### 2. Software Preview
Windows Version:
<img src="wiki/images/preview-win.png" alt="Windows" width="100%" />

macOS Version:
<img src="wiki/images/preview-mac.png" alt="macOS" width="100%" />

Linux Version:
<img src="wiki/images/preview-linux.png" alt="Linux" width="100%" />

### 3. Features
- 🚀 **Out of the Box**
  - No complex environment configuration required.
  - Download and run directly.
- 🧩 **Patch Modularity**
  - Common SSDT functions are categorized by modules.
  - Required SSDTs are listed by platform, allowing one-click retrieval of all necessary SSDTs and patches.
- 📄 **Automated Generation**
  - Generates corresponding SSDT / DSDT patches based on user selection.
  - Reduces the need for manual ASL editing.
  - Lowers the risk of syntax and logic errors.
- 🖥 **Consistent Cross-Platform Experience**
  - Developed using Flutter.
  - Provides a consistent interface and operation logic across Windows, macOS, and Linux.

### 4. System Compatibility
- **Windows**: Supports Windows 10 and above only (Windows 8, 7 and earlier are not supported). It is recommended to completely close security software like 360, Tencent PC Manager, or Huorong to avoid interception during the process.
- **macOS**: Supports macOS 10.15 and above, and the graphics card must support Metal (ACPI extraction on macOS is not recommended, please use Windows or Linux). Note: Allow apps downloaded from anywhere in Security & Privacy settings.
- **Linux**: Supports Debian 10+ and Ubuntu 20.04 LTS ~ 24.04 LTS (Older versions and 24.10+ are not supported).

### 5. Supported SSDTs
- **SSDT-HPET**: Eliminates IRQ conflicts, typically used for audio fixes.
- **SSDT-EC-USBX-DESKTOP**: Spoofs EC and injects USB power properties (for Intel 6th Gen+ desktops).
- **SSDT-EC-USBX-LAPTOP**: Spoofs EC without affecting the existing one, injecting USB power properties (for Intel 6th Gen+ laptops).
- **SSDT-EC-DESKTOP**: Spoofs EC (for Intel 5th Gen and older desktops).
- **SSDT-EC-LAPTOP**: Spoofs EC without affecting the existing one (for Intel 5th Gen and older laptops).
- **SSDT-USBX**: USB power property fix (for Intel 6th Gen+ platforms).
- **SSDT-PLUG**: CPU core recognition, enables frequency scaling and power management fixes.
- **SSDT-PLUG-ALT**: Power management fix (for Intel 12th Gen+ and some AMD Ryzen platforms).
- **SSDT-PMC**: Adds missing PMCR device, enabling NVRAM support (typically for Intel native 300 series motherboards).
- **SSDT-PNLF**: Adds PNLF device to provide backlight support (Laptops and AIOs only).
- **SSDT-ALS0**: Provides sensor support for screen backlight adjustment (Laptops and AIOs only).
- **SSDT-XOSI**: Spoofs macOS as Windows to unlock hidden devices (like I2C trackpads).
- **SSDT-RHUB**: USB port reset and fixes.
- **SSDT-Bridge**: Creates a bridge for missing PCI device paths.
- **SSDT-DMAR**: Removes DMAR reserved memory regions, fixing system boot and NIC compatibility issues.
- **SSDT-SBUS-MCHC**: Adds System Management Bus (SMBus) support, defining SMBus compatible MCHC and BUS0 devices.
- **SSDT-IMEI**: Fixes IMEI issues (typically for Ivy Bridge and Sandy Bridge iGPU acceleration).
- **SSDT-FixShutdown**: Fixes restart on shutdown or power not cutting off on shutdown.
- **SSDT-GPRW**: Fixes instant wake caused by USB controllers.
- **SSDT-UPRW**: Fixes instant wake caused by USB controllers.
- **SSDT-LID**: Fixes sleep button issues (Laptops only).
- **SSDT-LED**: Fixes abnormal power button breathing light after wake (Lenovo laptops).
- **SSDT-S3-DISABLE**: Disables system S3 sleep state (fixes crash, restart, or shutdown issues on S3 wake).
- **SSDT-WakeScreen**: Fixes the issue of needing to press any key to turn on the screen after wake.
- **SSDT-FACP**: Changes warm reboot to cold reboot, fixing unavailable hardware (Audio, WiFi, Bluetooth) when rebooting from Windows to macOS on some platforms.
- **SSDT-GPU-SPOOF**: AMD GPU spoofing. Modifies the device ID read by macOS to enable acceleration (RX 550 Lexa core, RX 6650XT, RX 6950XT, etc.).
- **SSDT-PCI-DISABLE**: Disables PCI devices, including unsupported GPUs, NVMe SSDs, WiFi, etc.
- **SSDT-RMNE**: Spoofs a wired network card device (for laptops without an ethernet port).
- **SSDT-GPI0**: Fixes I2C trackpad issues (Laptops only).
- **SSDT-CPUR**: CPU rename for B850, B650, B550, A520 chipsets, fixing crashes caused by unrecognized CPUs on AMD platforms.
- **SSDT-AWAC**: Disables AWAC clock (Modern Timer) (for Intel Coffee Lake 8th Gen+).
- **SSDT-UNC**: Required for all native X99 (C612) and most native X79 (C602) motherboards.
- **SSDT-APIC**: Fixes or rewrites Processor ID in the APIC table, ensuring macOS correctly identifies CPU cores to avoid kernel panics.
- **SSDT-RTC0-RANGE**: Enables or spoofs legacy RTC timer and fixes RTC ranges (for all native X99/X299).
- **SSDT-DMAC**: Spoofs a standard DMA controller (Adds missing parts, perfectionist approach, not strictly necessary!).
- **SSDT-PWRB**: Spoofs a standard PWRB controller (Perfectionist approach, not strictly necessary!).
- **SSDT-SLPB**: Spoofs a standard SLPB controller (Perfectionist approach, not strictly necessary!).
- **SSDT-MEM2**: Spoofs a MEM2 device required by IGPU (Perfectionist approach, not strictly necessary!).

### 6. ACPI Extraction
##### **Important Notes:**
If you change any of the following, you must re-extract and re-patch, as these changes may cause significant alterations to the native ACPI (especially the SystemMemory region):
- Update BIOS
- Change any BIOS options
- Change hardware or memory configuration

##### Extraction using Windows (Recommended)
- Make sure to boot Windows using the native Boot Manager. If you use a third-party bootloader like OpenCore, the extracted ACPI tables are likely polluted by injected patches and are NOT original!
**Open RapidSSDT in Windows, run rapidssdt.exe, and click the [Dump ACPI] button to extract SSDT and DSDT.**
<img src="wiki/images/dump-win-1.png" alt="Windows" width="100%" />

**After extraction, output defaults to the ACPIs folder on the Desktop, and the [Select ACPIs] path is automatically updated. No manual selection is required!!!**
<img src="wiki/images/dump-win-2.png" alt="Windows" width="100%" />

##### Extraction using Linux (Optional)
- If you already have Linux installed, you can use it to extract ACPI tables. (Not recommended to install Linux solely for this purpose).
**In Linux, click the [Dump ACPI] button, enter the sudo password, and extract.**
<img src="wiki/images/dump-linux-1.png" alt="Linux" width="100%" />

##### Extraction using macOS (Not Recommended)
- ACPI extraction on macOS is highly discouraged because the bootloader (like OpenCore) has likely injected patches, polluting the tables.

### 7. User Guide
Please refer to the detailed guide: **[RapidSSDT Detailed Guide](wiki/SSDT-补丁指南.md)**

### 8. Acknowledgments
- [JeoJay127](https://github.com/JeoJay127) - Original Creator
- [CorpNewt](https://github.com/CorpNewt) - ACPI patch guides and examples
- [RehabMan](https://github.com/RehabMan) - ACPI patches and tools like iasl
- [acidanthera](https://github.com/acidanthera) - ACPI patch guides and examples
- [dortania](https://github.com/dortania) - ACPI patch guides and examples

---

<h2 id="português-brasil">🇧🇷 Português (Brasil)</h2>

### Origem, Créditos e Tradução
Este projeto foi criado originalmente por **[JeoJay127](https://github.com/JeoJay127)**. Toda a lógica, engenharia e os créditos de desenvolvimento pertencem a ele.

**Sobre a Tradução e Internacionalização:**
Eu sou **Alessandro ([alebypegasus](https://github.com/alebypegasus))**. Encontrei esta ferramenta incrível, vi um potencial enorme para a comunidade Hackintosh, e tomei a iniciativa de internacionalizá-la e traduzi-la de forma minuciosa para o Inglês, Português e outros idiomas.
Se quiser apoiar este esforço de tradução ou acompanhar meus projetos, visite o meu GitHub. Também estamos traduzindo o **[RapidEFI](https://github.com/alebypegasus/RapidEFI-Tool)**, outra ferramenta espetacular para configurações automatizadas do OpenCore!

### Índice
- [Intenção do Projeto](#intenção-do-projeto)
- [1. Introdução ao RapidSSDT](#1-introdução-ao-rapidssdt)
- [2. Prévia do Software](#2-prévia-do-software)
- [3. Características](#3-características)
- [4. Compatibilidade do Sistema](#4-compatibilidade-do-sistema)
- [5. SSDTs Suportados](#5-ssdts-suportados)
- [6. Extração de ACPI](#6-extração-de-acpi)
- [7. Guia de Uso](#7-guia-de-uso)
- [8. Agradecimentos](#8-agradecimentos)

### Intenção do Projeto
No processo tradicional de configuração de um Hackintosh:
- A barreira de entrada para escrever patches SSDT / DSDT é muito alta.
- Exige consultas frequentes às especificações ACPI, repositórios de exemplos e fóruns.
- Modificar manualmente o ASL é propenso a erros e difícil de manter.
- Iniciantes muitas vezes não sabem "quais patches são obrigatórios e quais são opcionais".

O objetivo do RapidSSDT é: **Consolidar "experiências fragmentadas de ACPI" e "trabalhos repetitivos de patch" em um fluxo de trabalho visual, estruturado e reutilizável.**

### 1. Introdução ao RapidSSDT
O **RapidSSDT** é uma ferramenta gráfica de código aberto e multiplataforma desenvolvida em **Flutter** (suportando **Windows / macOS / Linux**).
Foi concebido para **simplificar a geração e personalização de patches SSDT / DSDT** em ambientes Hackintosh, baixando a barreira de personalização ACPI.

### 2. Prévia do Software
Versão Windows:
<img src="wiki/images/preview-win.png" alt="Windows" width="100%" />

Versão macOS:
<img src="wiki/images/preview-mac.png" alt="macOS" width="100%" />

Versão Linux:
<img src="wiki/images/preview-linux.png" alt="Linux" width="100%" />

### 3. Características
- 🚀 **Pronto para Uso**
  - Nenhuma configuração complexa de ambiente é necessária.
  - Baixe e execute diretamente.
- 🧩 **Modularidade de Patches**
  - As funções comuns de SSDT são categorizadas por módulos.
  - Os SSDTs necessários são listados por plataforma para obtenção em 1 clique.
- 📄 **Geração Automatizada**
  - Gera os patches correspondentes com base na seleção do usuário.
  - Reduz a necessidade de edição manual de ASL e os riscos de erros de sintaxe.
- 🖥 **Experiência Multiplataforma Consistente**
  - Interface e lógica de operação padronizadas no Windows, macOS e Linux.

### 4. Compatibilidade do Sistema
- **Windows**: Suporta apenas Windows 10 e superior. Recomenda-se fechar totalmente softwares de segurança e antivírus para evitar bloqueios durante o processo.
- **macOS**: Suporta macOS 10.15 e superior (Placa de vídeo deve suportar Metal). A extração de ACPI no macOS não é recomendada; prefira Windows ou Linux.
- **Linux**: Suporta Debian 10+, Ubuntu 20.04 LTS ~ 24.04 LTS.

### 5. SSDTs Suportados
*(Mantendo a lista completa do projeto original, todos agora detalhados em Português)*
- **SSDT-HPET**: Elimina conflitos IRQ, normalmente usado para correções de áudio.
- **SSDT-EC-USBX-DESKTOP**: Emula o EC e injeta propriedades de energia USB (Desktops Intel 6ª Geração+).
- **SSDT-EC-USBX-LAPTOP**: Emula o EC sem afetar o existente, injetando energia USB (Laptops Intel 6ª Geração+).
- **SSDT-EC-DESKTOP**: Emula o EC (Desktops Intel 5ª Geração ou anteriores).
- **SSDT-EC-LAPTOP**: Emula o EC sem afetar o existente (Laptops Intel 5ª Geração ou anteriores).
- **SSDT-USBX**: Correção de energia USB (Intel 6ª Geração+).
- **SSDT-PLUG**: Reconhecimento de núcleo da CPU, ativa gerenciamento de energia e frequência.
- **SSDT-PLUG-ALT**: Correção de gerenciamento de energia (Intel 12ª Geração+ e AMD Ryzen).
- **SSDT-PMC**: Adiciona dispositivo PMCR ausente para NVRAM (Placas nativas Intel série 300).
- **SSDT-PNLF**: Suporte a controle de brilho (Apenas Laptops/AIOs).
- **SSDT-ALS0**: Suporte a sensor de luz para ajuste de brilho (Apenas Laptops/AIOs).
- **SSDT-XOSI**: Mascara o macOS como Windows para desbloquear dispositivos ocultos (Trackpads I2C).
- **SSDT-RHUB**: Redefinição e correções de portas USB.
- **SSDT-Bridge**: Cria uma ponte para caminhos de dispositivos PCI ausentes.
- **SSDT-DMAR**: Remove regiões de memória reservadas DMAR (Corrige inicialização e redes).
- **SSDT-SBUS-MCHC**: Adiciona suporte ao barramento SMBus (Dispositivos MCHC e BUS0).
- **SSDT-IMEI**: Corrige problemas IMEI (Aceleração de iGPU Ivy e Sandy Bridge).
- **SSDT-FixShutdown**: Corrige problemas do PC reiniciar em vez de desligar.
- **SSDT-GPRW / SSDT-UPRW**: Corrige despertar instantâneo causado por USB.
- **SSDT-LID**: Corrige problemas no botão de repouso da tampa (Laptops).
- **SSDT-LED**: Corrige luz pulsante anômala do botão power após o despertar (Laptops Lenovo).
- **SSDT-S3-DISABLE**: Desativa o repouso S3 do sistema (Evita crashes ao acordar).
- **SSDT-WakeScreen**: Corrige a necessidade de pressionar tecla para a tela acender ao acordar.
- **SSDT-FACP**: Muda reinicialização quente para fria (Corrige perda de Áudio/WiFi de Win para Mac).
- **SSDT-GPU-SPOOF**: Spoof de GPU AMD para enganar o macOS e ativar aceleração nativa.
- **SSDT-PCI-DISABLE**: Bloqueia dispositivos PCI (GPUs incompatíveis, NVMe, WiFi).
- **SSDT-RMNE**: Emula rede com fio (Para laptops sem porta de rede RJ45).
- **SSDT-GPI0**: Corrige Trackpad I2C (Laptops).
- **SSDT-CPUR**: Renomeia CPU em chipsets B850, B650, etc., para evitar crashes na plataforma AMD.
- **SSDT-AWAC**: Desativa o relógio AWAC (Intel 8ª Geração+).
- **SSDT-UNC**: Necessário para placas nativas X99 e a maioria X79.
- **SSDT-APIC**: Reescreve Processor ID para evitar Kernel Panics de contagem de núcleos da CPU.
- **SSDT-RTC0-RANGE**: Emula timer RTC antigo (X99 e X299).
- **SSDT-DMAC / PWRB / SLPB / MEM2**: Adiciona peças padrão ausentes (Correções perfeccionistas).

### 6. Extração de ACPI
##### **Avisos Importantes:**
Se você alterar qualquer uma das opções abaixo, DEVE extrair e gerar os patches novamente, pois afetam diretamente a tabela ACPI (SystemMemory):
- Atualização da BIOS
- Alteração de opções da BIOS
- Mudança de Hardware ou RAM

##### Extração usando Windows (Recomendado)
- Inicie pelo Boot Manager nativo. Se usar o OpenCore para iniciar o Windows, a tabela já estará poluída!
**Abra o RapidSSDT.exe no Windows e clique no botão [Extrair ACPI]. Ele jogará as tabelas nativas direto na pasta ACPIs do desktop e selecionará o caminho automaticamente.**

##### Extração usando Linux (Opcional)
- Apenas se você já tiver o Linux. Não instale apenas para isso.

##### Extração usando macOS (Não Recomendado)
- Extrair pelo Mac quase sempre resulta em tabelas poluídas pelos patches do OpenCore, a menos que você esteja rodando o Mac nativamente sem patches (raro).

### 7. Guia de Uso
Consulte o guia (em chinês/inglês) original na Wiki: **[RapidSSDT Guia Detalhado](wiki/SSDT-补丁指南.md)**

### 8. Agradecimentos
- [JeoJay127](https://github.com/JeoJay127) - Criador Original
- [CorpNewt](https://github.com/CorpNewt) - Guias e exemplos
- [RehabMan](https://github.com/RehabMan) - Ferramentas iasl e ACPI
- [acidanthera](https://github.com/acidanthera) - Guias e exemplos
- [dortania](https://github.com/dortania) - Guias e exemplos

---

<h2 id="中文">🇨🇳 中文 (Original)</h2>

### 项目由来与翻译说明 (Translation Note)
本项目最初由 **[JeoJay127](https://github.com/JeoJay127)** 创建。所有底层逻辑与开发归功于原作者。
我是 **Alessandro ([alebypegasus](https://github.com/alebypegasus))**。我发现并非常喜爱这个项目，因此主动进行了多语言翻译（英语/葡萄牙语）和国际化改造。如果您想支持翻译工作，或者查看我们正在翻译的另一个优秀项目 **[RapidEFI-Tool](https://github.com/alebypegasus/RapidEFI-Tool)**，欢迎访问我的 GitHub主页！

### 目录
- [项目初衷](#项目初衷)
- [1.RapidSSDT简介](#1rapidssdt简介)
- [2.RapidSSDT软件预览](#2rapidssdt软件预览)
- [3.RapidSSDT特点](#3rapidssdt特点)
- [4.RapidSSDT系统兼容性](#4rapidssdt系统兼容性)
- [5.支持SSDTs](#5支持ssdts)
- [6.提取ACPI](#6提取acpi)
- [7.工具使用指南](#7工具使用指南)
- [8.致谢](#8致谢)

### 项目初衷
在传统 Hackintosh 配置过程中：
- SSDT / DSDT 补丁编写门槛高
- 需要频繁查阅 ACPI 规范、示例仓库和论坛帖子
- 手工修改 ASL，容易出错且难以维护
- 新手往往不知道「哪些补丁是必须的，哪些是可选的」

RapidSSDT 的目标是：**把“零散的 ACPI 经验”和“重复的补丁工作”，整合为可视化、结构化、可复用的流程。**

### 1.RapidSSDT简介
**RapidSSDT** 是一个使用 **Flutter** 开发的开源跨平台图形化工具（支持 **Windows / macOS / Linux**），旨在**简化黑苹果（Hackintosh）环境下 SSDT / DSDT 补丁的生成与定制**，降低 ACPI 定制门槛。

### 2.RapidSSDT软件预览
Windows版本:
<img src="wiki/images/preview-win.png" alt="Windows" width="100%" />

macOS版本:
<img src="wiki/images/preview-mac.png" alt="macOS" width="100%" />

Linux版本:
<img src="wiki/images/preview-linux.png" alt="Linux" width="100%" />

### 3.RapidSSDT特点
- 🚀 **开箱即用**
  - 无需复杂环境配置
  - 下载后即可直接运行
- 🧩 **补丁模块化**
  - 常见 SSDT 功能按模块分类
  - 按平台分类列出对应平台所需SSDT,可一键获取所有SSDT及补丁
- 📄 **自动化生成**
  - 根据用户选择生成对应的 SSDT / DSDT 补丁
  - 减少手工编辑 ASL 的需求
  - 降低语法错误和逻辑错误风险
- 🖥 **跨平台一致体验**
  - 使用 Flutter 开发
  - 在 Windows、macOS、Linux 上提供一致的界面和操作逻辑

### 4.RapidSSDT系统兼容性
- **Windows**: 仅支持 Windows 10及以上 (不支持 Windows 8、7及更早版本).建议彻底关闭360，腾讯电脑管家，火绒等安全软件,以免操作过程中被拦截.
- **macOS**: 仅支持 macOS 10.15及以上,且显卡需支持 Metal (不建议macOS提取ACPI,请使用Windows或者Linux提取).注意在系统设置中【安全与隐私】- 【安全性】允许安装任何来源的软件
- **Linux**: 支持Debian 10及以上, Ubuntu 20.04 LTS ~  24.04 LTS (不支持20.04之前的老版本，24.10及以上版本)

### 5.支持SSDTs
 •  **SSDT-HPET**: 消除IRQ冲突,通常用于声卡修复
 •  **SSDT-EC-USBX-DESKTOP**: 仿冒EC并注入USB电源属性(适用于Intel 6代及以上台式机)
 •  **SSDT-EC-USBX-LAPTOP**: 仅仿冒EC,不影响现有EC，同时注入USB电源属性（适用于Intel 6代及以上笔记本）
 •  **SSDT-EC-DESKTOP**: 仿冒EC(适用于Intel 5代及以下台式机)
 •  **SSDT-EC-LAPTOP**: 仅仿冒EC,不影响现有EC（适用于Intel 5代及以下笔记本）
 •  **SSDT-USBX**: USB电源属性修正(适用于Intel 6代及更新平台)
 •  **SSDT-PLUG**: CPU核心识别,启用频率调节与节能修正
 •  **SSDT-PLUG-ALT**: 修复电源管理(适用于Intel 12代及以上，部分AMD Ryzen等平台)
 •  **SSDT-PMC**: 添加缺失的PMCR设备,启用NVRAM支持(通常适用于Intel原生300系列主板)
 •  **SSDT-PNLF**: 添加PNLF设备以提供背光支持(仅适用于笔记本和一体机)
 •  **SSDT-ALS0**: 提供屏幕背光调节所需的传感器支持(仅适用于笔记本和一体机)
 •  **SSDT-XOSI**: macOS伪装成Windows,解锁被屏蔽的设备(如I2C触摸板)
 •  **SSDT-RHUB**: USB端口重置与修正
 •  **SSDT-Bridge**: 为缺失的 PCI 设备路径创建桥接
 •  **SSDT-DMAR**: 移除DMAR保留内存区域,修复系统启动问题,网卡兼容性问题
 •  **SSDT-SBUS-MCHC**: 添加系统总线SMBus支持,定义SMBus兼容性的MCHC和BUS0设备
 •  **SSDT-IMEI**: 修复IMEI问题(通常适用于Ivy Bridge和 Sandy Bridge 核显加速修复)
 •  **SSDT-FixShutdown**: 修复关机变重启或关机不断电问题
 •  **SSDT-GPRW**: 修复由于USB控制器导致睡眠即醒问题
 •  **SSDT-UPRW**: 修复由于USB控制器导致睡眠即醒问题
 •  **SSDT-LID**: 修复睡眠按键睡眠问题(适用于笔记本)
 •  **SSDT-LED**: 修复唤醒后电源键呼吸灯异常问题(适用于联想笔记本)
 •  **SSDT-S3-DISABLE**: 禁用系统 S3 睡眠状态(修复S3睡眠唤醒崩溃,重启或关机问题)
 •  **SSDT-WakeScreen**: 修复唤醒后需按任意键亮屏问题
 •  **SSDT-FACP**: 热重启修改为冷重启，修复部分平台从Windows重启到macOS后,导致部分硬件不可用的问题。
 •  **SSDT-GPU-SPOOF**: AMD 显卡仿冒,通过修改 macOS 读取的设备 ID，让 macOS 误以为该显卡是支持的型号。
 •  **SSDT-PCI-DISABLE**: 屏蔽PCI设备,包括不支持的显卡、NVMe固态硬盘,WiFi等
 •  **SSDT-RMNE**: 仿冒有线网卡设备(适用于没有有线网卡的笔记本)
 •  **SSDT-GPI0**: 修复笔记本I2C触摸板问题(适用于笔记本)
 •  **SSDT-CPUR**: B850,B650,B550,A520等芯片组的CPU重命名,修复AMD平台崩溃问题
 •  **SSDT-AWAC**: 禁用AWAC时钟(现代计时器)(适用于Intel Coffee Lake 8代及以上)
 •  **SSDT-UNC**: 所有原生X99(C612)主板和大多数原生X79(C602)主板需要
 •  **SSDT-APIC**: 修复或重写 APIC 表中的 Processor ID,确保 macOS 能正确识别 CPU 核心数量和编号。
 •	**SSDT-RTC0-RANGE**: 启用或仿冒传统RTC计时器,并修复RTC范围(原生X99和X299主板)
 •	**SSDT-DMAC**: 仿冒一个标准DMA控制器（非必要!）
 •	**SSDT-PWRB**: 仿冒一个标准PWRB控制器（非必要!）
 •	**SSDT-SLPB**: 仿冒一个标准SLPB控制器（非必要!）
 •	**SSDT-MEM2**: 仿冒一个IGPU所需的MEM2设备（非必要!）

### 6.提取ACPI
##### **注意事项:** 
如果更改了以下任何一项，您必须重新提取、重新补丁，因为这些更改可能会导致本机ACPI（特别是SystemMemory区域）发生重大更改：
- 更新BIOS
- 更改任何BIOS选项
- 更改硬件或内存配置

##### 使用Windows提取(推荐)
- 确保使用原生Boot Manager 方式来启动Windows，如果你使用了三方引导，那么提取的ACPI表已经被污染！
**Win下打开RapidSSDT,双击运行rapidssdt.exe,点击【提取ACPI】按钮.**
<img src="wiki/images/dump-win-1.png" alt="Windows" width="100%" />

**默认输出在Desktop桌面ACPIs文件夹, 同时会自动选择该文件夹。**
<img src="wiki/images/dump-win-2.png" alt="Windows" width="100%" />

##### 使用Linux提取(可选)  
- 已经安装好Linux的情况下可以使用.不建议专门安装Linux来提取ACPI表.
<img src="wiki/images/dump-linux-1.png" alt="Linux" width="100%" />

##### 使用macOS提取(不推荐)  
- 不建议在macOS上提取ACPI表,因为绝大多数启动场景下都已被污染,并非原始ACPI表!

### 7.工具使用指南
**工具详细指南请参考 [RapidSSDT 详细指南](wiki/SSDT-补丁指南.md)**

### 8.致谢:
- [JeoJay127](https://github.com/JeoJay127) - Original Creator
- [CorpNewt](https://github.com/CorpNewt) 相关ACPI补丁指南与示例
- [Rehabman](https://github.com/RehabMan) 相关ACPI补丁以及iasl等工具
- [acidanthera](https://github.com/acidanthera) 相关ACPI补丁指南与示例
- [dortania](https://github.com/dortania) 相关ACPI补丁指南与示例 
