-----------------------------------------------------------------------
--                    Servertime v1.2.0 by Buschfuss©
--                www.respawn-nation.de / discord.gg/rnmg
-----------------------------------------------------------------------

Lang = Lang or {}

Lang["de"] = {
    prefix = "^3[RN-Zeit]^0 ",
	language_loaded = "Sprachdatei erfolgreich geladen",
	language_selected = "Sprache: DE",
	version_info = "Version: %s",
	
    no_permission    = "Du hast keine Berechtigung diesen Befehl zu nutzen.",
    invalid_timezone = "Unbekannter Zeitzonen-Code! Beispiele: de, uk, us, usw, au, jp, utc",
    realtime_set     = "Echtzeit für %s gesetzt: %02d:%02d:%02d",
    manual_time_set  = "Manuelle Zeit gesetzt auf: %02d:%02d",
    invalid_format   = "Ungültiges Format! Beispiel: /rntime_settime 14:30",
    timescale_set    = "Zeitgeschwindigkeit gesetzt auf: %.2f",
    timescale_usage  = "Nutzung: /rntime_timescale <0.1 - 5.0>",
    settime_usage    = "Nutzung: /rntime_settime HH:MM",

    help_header     = "^2RN Zeit – Befehle:^0",
    help_realtime   = "/rntime_setrealtime <code> - Echtzeit setzen",
    help_settime    = "/rntime_settime HH:MM - Manuell Zeit setzen",
    help_timescale  = "/rntime_timescale <0.1 - 5.0> - Zeitgeschwindigkeit ändern",
    help_help       = "/rntime_help - Hilfe anzeigen",
	help_info 		= "/rntime_info - Zeigt aktuelle Server-Zeitinformationen",

    info_header     = "^2RN Zeit – Server-Informationen:^0",
    info_mode_rt    = "Modus: Echtzeit",
    info_mode_manual= "Modus: Manuelle Zeit",
    info_timezone   = "Zeitzone: %s",
    info_language   = "Sprache: %s",
    info_timescale  = "Zeitgeschwindigkeit: %.2f",
    info_currenttime= "Aktuelle Zeit: %02d:%02d:%02d"
}

Lang["en"] = {
    prefix = "^3[RN-Time]^0 ",
	language_loaded = "Language-File loaded successfully.",
	language_selected = "Language: EN",
	version_info = "Version: %s",
	
    no_permission    = "You are not allowed to use this command.",
    invalid_timezone = "Unknown timezone code! Examples: de, uk, us, usw, au, jp, utc",
    realtime_set     = "Realtime for %s set to: %02d:%02d:%02d",
    manual_time_set  = "Manual time set to: %02d:%02d",
    invalid_format   = "Invalid format! Example: /rntime_settime 14:30",
    timescale_set    = "Timescale set to: %.2f",
    timescale_usage  = "Usage: /rntime_timescale <0.1 - 5.0>",
    settime_usage    = "Usage: /rntime_settime HH:MM",

    help_header     = "^2RN Time – Commands:^0",
    help_realtime   = "/rntime_setrealtime <code> - Set realtime",
    help_settime    = "/rntime_settime HH:MM - Set manual time",
    help_timescale  = "/rntime_timescale <0.1 - 5.0> - Set timescale",
    help_help       = "/rntime_help - Show help",
	help_info = "/rntime_info - Shows current server time information",

    info_header     = "^2RN Time – Server Info:^0",
    info_mode_rt    = "Mode: Realtime",
    info_mode_manual= "Mode: Manual Time",
    info_timezone   = "Timezone: %s",
    info_language   = "Language: %s",
    info_timescale  = "Timescale: %.2f",
    info_currenttime= "Current Time: %02d:%02d:%02d"
}

Lang["jp"] = {
    prefix = "^3[RN-時間]^0 ",

    no_permission    = "このコマンドを使用する権限がありません。",
    invalid_timezone = "無効なタイムゾーンコードです！ 例: de, uk, us, usw, au, jp, utc",
    realtime_set     = "リアルタイム（%s）を設定: %02d:%02d:%02d",
    manual_time_set  = "手動時間を設定: %02d:%02d",
    invalid_format   = "無効な形式です！ 例: /rntime_settime 14:30",
    timescale_set    = "タイムスケールを設定: %.2f",
    timescale_usage  = "使用方法: /rntime_timescale <0.1 - 5.0>",
    settime_usage    = "使用方法: /rntime_settime HH:MM",

    help_header     = "^2RN 時間 – コマンド:^0",
    help_realtime   = "/rntime_setrealtime <code> - リアルタイムを設定",
    help_settime    = "/rntime_settime HH:MM - 手動時間を設定",
    help_timescale  = "/rntime_timescale <0.1 - 5.0> - タイムスケールを設定",
    help_help       = "/rntime_help - ヘルプを表示",

    info_header     = "^2RN 時間 – サーバー情報:^0",
    info_mode_rt    = "モード: リアルタイム",
    info_mode_manual= "モード: 手動時間",
    info_timezone   = "タイムゾーン: %s",
    info_language   = "言語: %s",
    info_timescale  = "タイムスケール: %.2f",
    info_currenttime= "現在の時間: %02d:%02d:%02d"
}