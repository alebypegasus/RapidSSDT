Guia detalhado de correções ACPI: [Guia de Patches SSDT](https://github.com/JeoJay127/RapidSSDT/blob/main/wiki/SSDT-补丁指南.md)

### 1. Compatibilidade de Ferramentas

- **Windows**: Suporta Windows 10 e superior (Windows 8, 7 e anteriores não são suportados). Recomenda-se desativar temporariamente antivírus durante o processo para evitar interrupções.

- **macOS**: Suporta macOS 10.15 e superior com suporte a GPU Metal (Não é recomendado extrair ACPI no macOS; utilize Windows ou Linux).

- **Linux**: Suporta Debian 10+ e Ubuntu 20.04 LTS ~ 24.04 LTS.

### 2. Extração de ACPI (Dump)

##### **Observações Importantes:**

Se você alterar qualquer um dos itens abaixo, **DEVE** extrair e patchear as tabelas ACPI novamente, pois tais mudanças podem alterar o mapa de memória nativo (especialmente regiões `SystemMemory`):

- Atualizar o BIOS
- Alterar qualquer opção de configuração do BIOS
- Alterar hardware ou memória RAM

##### 2.1 Extraindo no Windows (Recomendado)
- Certifique-se de iniciar o Windows diretamente pelo Boot Manager nativo. Se você iniciou via OpenCore/Clover, as tabelas ACPI já foram alteradas e poluídas por patches do bootloader!

##### 2.2 Extraindo no Linux (Opcional)
- Se você já possui Linux instalado, pode utilizá-lo para extrair as tabelas ACPI nativas com facilidade.

##### 2.3 Extraindo no macOS (Não Recomendado)
- Não é recomendado extrair no macOS, pois na maioria das inicializações o OpenCore já injetou patches ACPI na memória do sistema.
