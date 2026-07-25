import re

with open('lib/pages/model/ssdt_platform.dart', 'r', encoding='utf-8') as f:
    content = f.read()

def replacer(match):
    full_str = match.group(1)
    # Parse full_str
    parts = full_str.split('-')
    if len(parts) == 3:
        gen = parts[0].replace('代', ' Gen')
        codename = parts[1]
        platform = parts[2].replace('平台', '').replace('笔记本', 'Laptop')
        if platform == 'Laptop':
            return f"'{gen} - {codename} (Laptop)'"
        else:
            if 'HEDT' in platform:
                return f"'{gen} - {codename} (HEDT)'"
            else:
                return f"'{gen} - {codename} ({platform})'"
    elif len(parts) == 2:
        # Something like 'AMD-桌面端', 'AMD-笔记本端'
        if '桌面' in parts[1]:
            return f"'{parts[0]} - Desktop'"
        elif '笔记' in parts[1]:
            return f"'{parts[0]} - Laptop'"
        elif '线程撕裂者' in parts[1]:
            return f"'{parts[0]} - Threadripper'"
        else:
            return f"'{parts[0]} - {parts[1]}'"
    else:
        return f"'{full_str}'"

# Replace strings within the maps. They look like '0代-Penryn-775平台':
new_content = re.sub(r"'([^']*(?:代|平台|笔记|桌面|端|线程)[^']*)'", replacer, content)

with open('lib/pages/model/ssdt_platform.dart', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Done")
