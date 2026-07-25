import json
import re

bad_keys = ["ssdtMsg744", "ssdtMsg754", "ssdtMsg762", "ssdtMsg807", "ssdtMsg813", "ssdtMsg814", "ssdtMsg602", "ssdtMsg608", "ssdtMsg633"]

langs = ["zh", "en", "pt", "pt_BR", "pt_PT", "ja"]

for lang in langs:
    arb_file = f"lib/l10n/app_{lang}.arb"
    try:
        with open(arb_file, "r", encoding="utf-8") as f:
            data = json.load(f)
        
        for k in bad_keys:
            if k in data:
                del data[k]
            if f"@{k}" in data:
                del data[f"@{k}"]
                
        # For Japanese, fix translated arguments if any remain
        if lang == "ja":
            for k, v in data.items():
                if not k.startswith("@") and isinstance(v, str):
                    v = v.replace("{引数0}", "{arg0}")
                    v = v.replace("{引数1}", "{arg1}")
                    v = v.replace("{引数2}", "{arg2}")
                    v = v.replace("{引数3}", "{arg3}")
                    v = v.replace("{引数4}", "{arg4}")
                    v = v.replace("{キー}", "{arg0}") # Just in case
                    data[k] = v
                    
        with open(arb_file, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            
    except Exception as e:
        print(f"Error on {lang}: {e}")

print("Cleaned up final ICU syntax errors.")
