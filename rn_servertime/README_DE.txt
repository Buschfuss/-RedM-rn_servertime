-----------------------------------------------------------------------
--                    Servertime v1.2.0 by Buschfuss©
--                www.respawn-nation.de / discord.gg/rnmg
-----------------------------------------------------------------------

Ein professionelles, mehrsprachiges Servertime- & Realtime-System für RedM, entwickelt für Respawn Nation.  
Das Script ermöglicht die vollständige Kontrolle über die Ingame-Zeit – inklusive Echtzeit, manueller Zeit, Zeitzonen, Timescale-Steuerung, Admin-Rechten und automatischer Synchronisation für alle Spieler.

Entwickler: Buschfuss©  
Website: https://www.respawn-nation.de  
Discord: https://discord.gg/rnmg  

---

## ✅ Features

- Echtzeit-Modus (Realtime)
- Manuelle Zeitsetzung
- Zeitzonen-Support (DE, UK, US, USW, AU, JP, UTC)
- Einstellbarer Timescale (Zeitgeschwindigkeit)
- Admin-System mit Identifier-Prüfung
- Mehrsprachig (DE, EN, JP)
- Automatischer Fallback bei Sprachfehlern
- Automatische Zeitsynchronisation für neu joinende Spieler
- Live-Realtime-Update jede Minute
- Debug-Modus
- Schutzsystem falls lang.lua nicht lädt
- Professioneller Startbanner
- Vollständig serverseitig gesteuert

---

## 📦 Installation

1. Lege den Ordner rn_servertime in:
   resources/

2. Trage das Script in deine server.cfg ein:
   ensure rn_servertime

3. Server neu starten

---

## ⚙️ Konfiguration (config.lua)

Config.Version = "1.2.0"  
Aktuelle Script-Version

Config.AdminList = {  
    "steam:110000108789138",  
    "steam:1100001573fbf37",  
    "steam:110000111991a43"  
}  
Liste der Admin-Identifiers (Steam, License, Discord möglich)

Config.Language = "de"  
Sprache = gleichzeitig Standard-Zeitzone  
Erlaubt: de, uk, us, usw, au, jp, utc

Config.UseRealtimeOnStart = true  
Aktiviert Echtzeit automatisch beim Serverstart

Config.DefaultTimescale = 1.0  
Config.MinTimescale = 0.1  
Config.MaxTimescale = 5.0  
Standard-Zeitgeschwindigkeit & Limits

Config.Debug = false  
Aktiviert internen Debug-Output in der Konsole

---

## 🌍 Sprachsystem (lang.lua)

Aktuell unterstützt:

- Deutsch  
- Englisch  
- Japanisch  

Jede Sprache enthält:

- Eigenen Prefix ([RN-Zeit], [RN-Time], [RN-時間])
- Startmeldungen
- Fehlertexte
- Hilfe-Texte
- Info-Texte
- Admin-Meldungen

Das System wählt die Sprache automatisch anhand von Config.Language.

---

## 🧠 Funktionsweise – Kurz erklärt

- Der Server steuert immer die Zeit
- Spieler erhalten Zeit & Timescale automatisch bei:
  - Serverstart
  - Realtime-Wechsel
  - Join
- Im Realtime-Modus:
  - Jede Minute wird die echte Uhrzeit neu gesetzt
- Im manuellen Modus:
  - Zeit läuft anhand des Timescale-Faktors weiter

---

## 🔑 Admin-System

Nur Spieler mit gültigem Identifier in Config.AdminList dürfen:

- Zeit setzen
- Realtime ändern
- Timescale ändern
- Infos abrufen
- Hilfe abrufen

Alle anderen erhalten automatisch eine Keine-Berechtigung-Meldung in ihrer Sprache.

---

## 🕹️ Befehle (Commands)

Realtime setzen:
 /rntime_setrealtime <code>

Beispiele:
 /rntime_setrealtime de  
 /rntime_setrealtime us  
 /rntime_setrealtime jp  

Manuelle Zeit setzen:
 /rntime_settime HH:MM

Beispiel:
 /rntime_settime 14:30  

Zeitgeschwindigkeit ändern:
 /rntime_timescale <0.1 - 5.0>

Beispiel:
 /rntime_timescale 2.0  

Hilfe anzeigen:
 /rntime_help  

Server-Zeitinfos anzeigen:
 /rntime_info  

Zeigt:
- Modus (Realtime / Manuell)
- Zeitzone
- Sprache
- Timescale
- Aktuelle Uhrzeit

---

## ⏱️ Zeitzonen

de   = Deutschland  
uk   = England  
us   = Ostküste USA  
usw  = Westküste USA  
au   = Australien  
jp   = Japan  
utc  = Weltzeit  

---

## 🔁 Synchronisation

- Jeder Spieler erhält die richtige Zeit beim Join
- Bei Realtime wird die Uhr jede Minute neu synchronisiert
- Kein Desync möglich

---

## ⚠️ WICHTIG – WeatherSync Kompatibilität

Wenn du ein WeatherSync- oder Weather-Control-Script verwendest,  
MÜSSEN alle Funktionen in diesem Script deaktiviert werden, die die Uhrzeit steuern.

Wenn beide Systeme gleichzeitig die Zeit kontrollieren, kommt es zu:
- Konflikten bei der Zeitsteuerung
- Gegenseitigem Überschreiben der Uhrzeit
- Desynchronisation
- Fehlerhaften Tag-/Nachtzyklen

RN Servertime muss das EINZIGE Script sein, das die Zeit auf dem Server steuert.

Andernfalls kommt es zwangsläufig zu falschem Zeitverhalten.

---

## ❗ Fehler- & Sicherheitssysteme

- Sicheres manuelles Laden von lang.lua
- Fallback-Sprachsystem bei Fehler
- Schutz vor fehlerhaften Config-Werten
- Automatische Warnungen bei ungültiger Sprache
- Script startet stabil selbst bei Fehlern

---

## 🧩 Dateistruktur

rn_servertime/
├── fxmanifest.lua
├── config.lua
├── server.lua
├── client.lua
└── lang.lua

---

## 📜 Lizenz

Dieses Script ist Eigentum von Respawn Nation.  
Eine Weitergabe, Bearbeitung oder kommerzielle Nutzung ist nur mit ausdrücklicher Genehmigung erlaubt.

---

## 📞 Support

Website: https://www.respawn-nation.de  
Discord: https://discord.gg/rnmg  
Entwickler: Buschfuss©  

---

## 🚀 Changelog

v1.2.0
- Mehrsprachiges System
- Versionsanzeige im Startlog
- Realtime & Timescale optimiert
- Admin-System integriert
- Stabilitäts- & Sicherheitsverbesserungen
