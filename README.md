-----------------------------------------------------------------------
--                    Servertime v1.2.0 by Buschfuss©
--                www.respawn-nation.de / discord.gg/rnmg
-----------------------------------------------------------------------

A professional, multilingual servertime & realtime system for RedM, developed for Respawn Nation.  
This script provides full control over the in-game time – including realtime, manual time setting, timezones, timescale control, admin permissions, and automatic synchronization for all players.

Developer: Buschfuss©  
Website: https://www.respawn-nation.de  
Discord: https://discord.gg/rnmg  

---

## ✅ Features

- Realtime mode
- Manual time setting
- Timezone support (DE, UK, US, USW, AU, JP, UTC)
- Adjustable timescale (time speed)
- Admin system with identifier validation
- Multilingual (DE, EN, JP)
- Automatic fallback if language loading fails
- Automatic time synchronization for joining players
- Live realtime update every minute
- Debug mode
- Protection system if lang.lua fails to load
- Professional startup banner
- Fully server-side controlled

---

## 📦 Installation

1. Place the folder rn_servertime into:
   resources/

2. Add the script to your server.cfg:
   ensure rn_servertime

3. Restart your server

---

## ⚙️ Configuration (config.lua)

Config.Version = "1.2.0"  
Current script version

Config.AdminList = {  
    "steam:110000108789138",  
    "steam:1100001573fbf37",  
    "steam:110000111991a43"  
}  
List of admin identifiers (Steam, License, Discord supported)

Config.Language = "en"  
Language also defines the default timezone  
Allowed values: de, uk, us, usw, au, jp, utc

Config.UseRealtimeOnStart = true  
Automatically enables realtime on server start

Config.DefaultTimescale = 1.0  
Config.MinTimescale = 0.1  
Config.MaxTimescale = 5.0  
Default time speed and limits

Config.Debug = false  
Enables internal debug output in the console

---

## 🌍 Language System (lang.lua)

Currently supported:

- German  
- English  
- Japanese  

Each language contains:

- Its own prefix ([RN-Zeit], [RN-Time], [RN-時間])
- Startup messages
- Error messages
- Help texts
- Info texts
- Admin messages

The system automatically selects the language based on Config.Language.

---

## 🧠 How It Works – Short Explanation

- The server always controls the time
- Players automatically receive the correct time & timescale on:
  - Server start
  - Realtime switch
  - Player join
- In realtime mode:
  - The real-world time is re-synced every minute
- In manual mode:
  - Time progresses according to the timescale factor

---

## 🔑 Admin System

Only players with a valid identifier in Config.AdminList are allowed to:

- Set the time
- Change realtime mode
- Change the timescale
- View server time info
- View help

All others automatically receive a no-permission message in their selected language.

---

## 🕹️ Commands

Set realtime:
 /rntime_setrealtime <code>

Examples:
 /rntime_setrealtime de  
 /rntime_setrealtime us  
 /rntime_setrealtime jp  

Set manual time:
 /rntime_settime HH:MM

Example:
 /rntime_settime 14:30  

Change timescale:
 /rntime_timescale <0.1 - 5.0>

Example:
 /rntime_timescale 2.0  

Show help:
 /rntime_help  

Show server time information:
 /rntime_info  

Displays:
- Mode (Realtime / Manual)
- Timezone
- Language
- Timescale
- Current server time

---

## ⏱️ Timezones

de   = Germany  
uk   = United Kingdom  
us   = USA East Coast  
usw  = USA West Coast  
au   = Australia  
jp   = Japan  
utc  = Coordinated Universal Time  

---

## 🔁 Synchronization

- Every player receives the correct time when joining
- In realtime mode, the time is re-synced every minute
- No desync possible

---

## ⚠️ IMPORTANT – WeatherSync Compatibility

If you are using a WeatherSync or Weather Control script:

You MUST disable ALL functions inside the WeatherSync script that control the time.

If both systems control the time at the same time, they will:
- Fight for time authority
- Override each other
- Cause desynchronization
- Create unstable day/night cycles

RN Servertime must be the ONLY script controlling the time on your server.

Failure to do this will result in incorrect time behavior.

---

## ❗ Error & Safety Systems

- Secure manual loading of lang.lua
- Fallback language system on error
- Protection against invalid config values
- Automatic warnings for invalid language settings
- Script starts safely even if errors occur

---

## 🧩 File Structure

rn_servertime/
├── fxmanifest.lua
├── config.lua
├── server.lua
├── client.lua
└── lang.lua

---

## 📜 License

This script is property of Respawn Nation.  
Redistribution, modification or commercial use is only permitted with explicit permission.

---

## 📞 Support

Website: https://www.respawn-nation.de  
Discord: https://discord.gg/rnmg  
Developer: Buschfuss©  

---

## 🚀 Changelog

v1.2.0
- Multilingual system
- Version display in startup log
- Realtime & timescale improvements
- Admin system integrated
- Stability & security improvements
