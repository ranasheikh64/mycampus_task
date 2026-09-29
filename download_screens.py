import json
import os
import urllib.request

with open('/Users/ranasheikh/.gemini/antigravity-ide/brain/a1055996-8687-4eba-9151-315eee63b1cf/.system_generated/steps/21/output.txt', 'r') as f:
    data = json.load(f)

os.makedirs('screens', exist_ok=True)

for screen in data.get('screens', []):
    title = screen.get('title', 'Untitled').replace(' ', '_').replace('-', '').replace('__', '_')
    print(f"Downloading {title}...")
    
    html_url = screen.get('htmlCode', {}).get('downloadUrl')
    if html_url:
        try:
            urllib.request.urlretrieve(html_url, f"screens/{title}.html")
        except Exception as e:
            print(f"Error HTML for {title}: {e}")
            
    screenshot_url = screen.get('screenshot', {}).get('downloadUrl')
    if screenshot_url:
        try:
            urllib.request.urlretrieve(screenshot_url, f"screens/{title}.png")
        except Exception as e:
            print(f"Error PNG for {title}: {e}")

print("Done downloading screens.")
