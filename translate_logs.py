import re
import os
from collections import OrderedDict

# This dictionary should cover common technical terms used in the logs.
# For missing translations, we'll try to apply regex generic translations.
translation_map = {
    '未找到任何 Processor 对象': 'No Processor objects found',
    '未找到 ACPI0007 设备': 'ACPI0007 device not found',
    '已找到': 'Found',
    '个 ACPI0007 设备': 'ACPI0007 devices',
    '不存在 PLTF 设备,当前Intel平台不需要此SSDT!已终止操作': 'PLTF device not found, this SSDT is not required for the current Intel platform! Operation aborted',
    '在': 'In',
    '找到父设备，正在处理': 'found parent device, processing',
    '正在检查': 'Checking',
    '未找到！跳过': 'Not found! Skipping',
    '正在处理': 'Processing',
    '个有效的处理器设备': 'valid processor devices',
    '未发现符合要求的 CPU 设备,无需 SSDT-CPUR 补丁!已终止操作!': 'No suitable CPU device found, SSDT-CPUR patch is not required! Operation aborted!',
    '正在创建预编译': 'Creating pre-compiled',
    '正在收集仿冒device-id方案': 'Collecting spoofed device-id schemes',
    '仿冒为7系主板IMEI': 'Spoofing as 7-series motherboard IMEI',
    '以匹配第3代 Ivy Bridge处理器': 'to match 3rd Gen Ivy Bridge processor',
    '仿冒为6系主板IMEI': 'Spoofing as 6-series motherboard IMEI',
    '以匹配第2代Sandy Bridge处理器': 'to match 2nd Gen Sandy Bridge processor',
    '未启用 SSDT 仿冒 IMEI，必须通过 DeviceProperties 设置 device-id!': 'SSDT spoofing for IMEI is not enabled, device-id must be set via DeviceProperties!',
    '未提供有效PCI设备路径! 已终止操作!': 'No valid PCI device path provided! Operation aborted!',
    '是否存在 _ON 或 _OFF 方法': 'whether it has _ON or _OFF method',
    '在 DSDT 或 SSDT 中未找到': 'Not found in DSDT or SSDT for',
    '对应的 _ON 或 _OFF 方法! 已终止操作!': 'corresponding _ON or _OFF method! Operation aborted!',
    '是否存在 _PS3 或 _DSM 方法': 'whether it has _PS3 or _DSM method',
    '对应的 _PS3 或 _DSM 方法! 已终止操作!': 'corresponding _PS3 or _DSM method! Operation aborted!',
    '对应的 _PRT 方法!': 'corresponding _PRT method!',
    '存在 _PRT 方法,可能已隐藏真实设备,将注入一个 BRG0 桥接设备!': 'has _PRT method, real device might be hidden, injecting a BRG0 bridge device!',
    '不存在!': 'does not exist!',
    '当前设备路径': 'Current device path',
    '可能隐藏真实设备!': 'might hide the real device!',
    '的 _ADR 地址存在溢出情况!': 'has _ADR address overflow!',
    '回溯至父设备路径': 'Backtracking to parent device path',
    '并注入一个 BRG0 桥接设备!': 'and injecting a BRG0 bridge device!',
    '需要屏蔽的': 'Needs to disable',
    '设备路径': 'device path',
    '屏蔽方法': 'Disable method',
    '方法': 'method',
    '设备相对路径已转换成绝对路径': 'Device relative path converted to absolute path',
    '未知的屏蔽方法': 'Unknown disable method',
    '操作已终止': 'Operation aborted',
    '找到': 'found',
    '部分方法未找到': 'Some methods not found',
    '正在收集可能的总线设备': 'Collecting possible bus devices',
    '未能找到有效的总线设备,已终止操作!': 'Failed to find a valid bus device, operation aborted!',
    '中根据地址': 'based on address',
    '未提供有效的显卡ACPI路径! 已终止操作!': 'No valid graphics ACPI path provided! Operation aborted!',
    '未提供有效的仿冒显卡ID! 已终止操作!': 'No valid spoofed graphics ID provided! Operation aborted!',
    '未提供有效的仿冒显卡名称！不会注入仿冒名称!': 'No valid spoofed graphics name provided! Will not inject spoofed name!',
    '显卡设备': 'graphics device',
    '存在 _PRT 方法,可能已隐藏真实设备,将注入一个 GFX0 设备!': 'has _PRT method, real device might be hidden, injecting a GFX0 device!',
    '已终止操作': 'Operation aborted',
    '并注入一个 GFX0 设备!': 'and injecting a GFX0 device!',
    '正在创建': 'Creating',
    '显卡设备路径': 'Graphics device path',
    '仿冒显卡ID': 'Spoofed graphics ID',
    '仿冒显卡名称': 'Spoofed graphics name',
    '未找到!': 'Not found!',
    '已匹配到PCI路径': 'Matched PCI path',
    '设备路径中存在地址 _ADR 溢出的情况!': 'Address _ADR overflow in device path!',
    '以下设备可能会影响属性注入': 'The following devices may affect property injection',
    '已成功保存文件到': 'Successfully saved file to',
    '保存失败': 'Failed to save',
    '读取文件': 'Reading file',
    '创建文件': 'Creating file',
    '更新': 'Updating',
    '到': 'to',
    '已存在于': 'already exists in',
    '跳过': 'skipping',
    '添加': 'Adding',
    '键': 'Key',
    '的值为': 'value is',
    '于': 'in',
    '的值已是最新': 'value is already up to date',
    '值': 'value',
    '路径': 'Path',
    '既不是 List 也不是 Map，而是': 'is neither List nor Map, but',
    '否则返回空': 'otherwise returning empty',
    '默认使用 acpiMatchMode': 'using default acpiMatchMode',
    '临时目录已创建于': 'Temp directory created at',
    '临时目录已存在于': 'Temp directory exists at',
    '执行命令': 'Executing command',
    '命令执行失败': 'Command execution failed',
    '以下桥接无法解析': 'The following bridges could not be parsed',
    '无法找到有效的 DSDT.aml，请通过 OpenCore 提取。': 'Could not find a valid DSDT.aml, please extract via OpenCore.',
    '当前目录中未找到': 'Not found in current directory',
    '正在下载': 'Downloading',
    '下载失败': 'Download failed'
}

def translate_str(text):
    for zh, en in translation_map.items():
        text = text.replace(zh, en)
    # Remove any remaining Chinese punctuation
    text = text.replace('，', ', ').replace('！', '!').replace('：', ': ').replace('。', '.').replace('、', ', ').replace('？', '?').replace('（', '(').replace('）', ')')
    text = text.replace('…', '...')
    # Use regex to strip out any remaining chinese characters if any
    text = re.sub(r'[\u4e00-\u9fff]+', '', text)
    return text

def translate_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    def replacer(match):
        prefix = match.group(1)
        string_content = match.group(2)
        suffix = match.group(3)
        translated = translate_str(string_content)
        return prefix + translated + suffix

    # Match Log('...') or debugPrint('...')
    new_content = re.sub(r'((?:Log|debugPrint)\s*(?:\.\w+)?\s*\(\s*[\'\"])(.*?)([\'\"]\s*\))', replacer, content)
    
    # Check if there are still any left due to complex string interpolations
    # like Log("something ${var} something") - the regex above handles the whole string, so it should work.

    with open(filepath, 'w') as f:
        f.write(new_content)

for root, dirs, files in os.walk('lib/'):
    for file in files:
        if file.endswith('.dart'):
            translate_file(os.path.join(root, file))

print("Done translations")
