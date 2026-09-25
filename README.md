# macKey_lay

AutoHotkey v2 script that maps your Windows keyboard to behave like a Mac keyboard layout.

| Windows key | Acts as |
|---|---|
| Alt | Cmd |
| Win | Option |
| Ctrl | Ctrl (unchanged) |

Remapping is **local Windows only** — automatically suspended when Chrome Remote Desktop, RDP, TeamViewer, or any other remote session window is active.

---

## Requirements

- Windows 10 or 11
- [AutoHotkey v2](https://www.autohotkey.com/download/) (v2.0 or later — v1 will not work)

---

## Setup on a new machine

**1. Install AutoHotkey v2**

Download and run the installer from https://www.autohotkey.com/download/

During install, make sure **AutoHotkey v2** is selected (not v1).

**2. Copy the script**

Place `mapMacLayout.ahk` anywhere you prefer, e.g.:

```
C:\Users\<you>\Scripts\mapMacLayout.ahk
```

**3. Run the script**

Double-click `mapMacLayout.ahk`. A green H icon will appear in the system tray — that means it's running.

**4. Run as Administrator (required for Win key remapping)**

Win+Arrow and other Win key combos are system-level shortcuts. AHK must run elevated to override them.

- Right-click `mapMacLayout.ahk` → **Run as administrator**

To make this permanent, create a Task Scheduler task (see step 6) or use a shortcut with elevated privileges.

**5. Auto-start on login**

To have the script start automatically with Windows:

- Press `Win+R`, type `shell:startup`, hit Enter
- Create a shortcut to `mapMacLayout.ahk` in that folder

For elevated auto-start (so Win key remapping works on every boot without a UAC prompt):

1. Open **Task Scheduler** → Create Task
2. Name it `macKey_lay`
3. **General** tab → check **Run with highest privileges**
4. **Triggers** tab → New → At log on
5. **Actions** tab → New → Start a program
   - Program: `C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe`
   - Arguments: `"C:\Users\<you>\Scripts\mapMacLayout.ahk"`
6. **Conditions** tab → uncheck "Start only if on AC power"
7. Save

---

## Hotkeys

| Shortcut | Action |
|---|---|
| F10 | Show active window title + remote session status (debug) |
| F11 | Reload script |
| F12 | Exit script |

---

## Key mappings summary

### Global (all apps)

| You press | Sends | Mac equivalent |
|---|---|---|
| Alt+C / V / X / Z | Ctrl+C/V/X/Z | Cmd+C/V/X/Z |
| Alt+A | Ctrl+A | Select all |
| Alt+S | Ctrl+S | Save |
| Alt+W | Ctrl+W | Close tab |
| Alt+N | Ctrl+N | New |
| Alt+T | Ctrl+T | New tab |
| Alt+F | Ctrl+F | Find |
| Alt+Left/Right | Home/End | Line start/end |
| Alt+Up/Down | Ctrl+Home/End | Document top/bottom |
| Win+Left/Right | Ctrl+Left/Right | Word jump |
| Win+Up/Down | Alt+Up/Down | Option+Up/Down |
| Win+Backspace | Ctrl+Backspace | Delete word left |

### VSCode / Cursor / VSCodium

| You press | Action |
|---|---|
| Alt+P | Quick Open |
| Alt+Shift+P | Command Palette |
| Alt+B | Toggle sidebar |
| Alt+J / backtick | Toggle terminal |
| Alt+Shift+F | Format document |
| Win+D | Add next occurrence |
| Win+Up/Down | Move line up/down |
| Win+Shift+Up/Down | Copy line up/down |

### Browsers (Chrome, Edge, Firefox)

| You press | Action |
|---|---|
| Alt+R | Reload |
| Alt+L | Focus address bar |
| Alt+T / W | New tab / Close tab |
| Alt+[ / ] | Back / Forward |

---

## Remote sessions

The script automatically detects and suspends remapping when any of these are active:

- Chrome Remote Desktop
- Microsoft Remote Desktop (mstsc.exe)
- TeamViewer, AnyDesk, VNC
- Citrix, VMware, VirtualBox

Use F10 to verify detection is working — it shows `IsRemoteSessionActive: Yes/No` for the current window.
