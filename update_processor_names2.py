import re

with open('lib/pages/model/ssdt_platform.dart', 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('迷你主机', 'NUC/Mini PC')
content = content.replace('高端服务器', 'High-End Server')

with open('lib/pages/model/ssdt_platform.dart', 'w', encoding='utf-8') as f:
    f.write(content)

print("Done")
