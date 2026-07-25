Detailed patch guide reference: [SSDT Patch Guide](https://github.com/JeoJay127/RapidSSDT/blob/main/wiki/SSDT-补丁指南.md)

### 1. Tool Compatibility

- **Windows**: Supports Windows 10 and above (Windows 8, 7 and earlier are not supported). It is recommended to disable security software during operation to avoid interference.

- **macOS**: Supports macOS 10.15 and above with Metal GPU support (extracting ACPI on macOS is NOT recommended; please use Windows or Linux instead).

- **Linux**: Supports Debian 10+ and Ubuntu 20.04 LTS ~ 24.04 LTS.

### 2. ACPI Dump (Extraction)

##### **Important Notes:**

If you change any of the following, you MUST re-dump and re-patch your ACPI tables because they can significantly alter native ACPI addresses (especially SystemMemory regions):

- Updating BIOS
- Changing any BIOS setting
- Changing hardware or RAM configuration

##### 2.1 Extracting on Windows (Recommended)
- Ensure Windows was booted natively via Boot Manager. If you booted via OpenCore/Clover, your ACPI tables have already been modified by bootloader patches and are not raw!

##### 2.2 Extracting on Linux (Optional)
- If you have Linux installed, you can extract ACPI tables easily. Installing Linux solely for extraction is not required.

##### 2.3 Extracting on macOS (Not Recommended)
- Extracting on macOS is discouraged because in most cases OpenCore has already injected ACPI patches into the system memory.
