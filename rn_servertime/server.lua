-----------------------------------------------------------------------
--                    Servertime v1.2.0 by Buschfuss©
--                www.respawn-nation.de / discord.gg/rnmg
-----------------------------------------------------------------------


Config = Config or {}

CreateThread(function()
    Wait(500)

    print("^6")
    print("                      ██████╗ ███╗   ██╗")
    print("                      ██╔══██╗████╗  ██║")
    print("                      ██████╔╝██╔██╗ ██║")
    print("                      ██╔══██╗██║╚██╗██║")
    print("                      ██║  ██║██║ ╚████║")
    print("                      ╚═╝  ╚═╝╚═╝  ╚═══╝")
    print("^3                        Respawn-Nation")
    print("^2                     www.respawn-nation.de")
    print("^7           ----------------------------------------^0")
end)

-- 🔒 hard security: lang.lua manual load, if redm isnt loading properly
local resourceName = GetCurrentResourceName()
local langFile = LoadResourceFile(resourceName, "lang.lua")

if not langFile then
    print("^1[RN] FATAL ERROR: lang.lua could NOT be found in resource folder!^0")
else
    local fn, err = load(langFile)
    if not fn then
        print("^1[RN] FATAL ERROR while loading lang.lua:^0 " .. tostring(err))
    else
        fn()
    end
end


-- language-mapping (countrycode → langpack)
local LanguageMap = {
    de  = "de",
    en  = "en",
    uk  = "en",
    us  = "en",
    usw = "en",
    au  = "en",
    utc = "en",
    jp  = "jp"
}

local warnedInvalidLang = false

local function GetLang()
    local region = Config.Language or "en"

    if not LanguageMap[region] then
        if not warnedInvalidLang then
            print("[RN] WARNING: Invalid Config.Language value: '" .. tostring(region) .. "'")
            print("[RN] Falling back to English (en). Allowed: de, en, uk, us, usw, au, jp, utc")
            warnedInvalidLang = true
        end
        region = "en"
    end

    local langKey = LanguageMap[region] or "en"

-- if Lang.lua isnt loading: fallback language
    if not Lang then
        print("[RN] CRITICAL ERROR: Lang table is NIL! lang.lua was NOT loaded!")
        return {
            prefix = "^3[RN-Time]^0 ",
            no_permission = "No permission.",
            invalid_timezone = "Invalid timezone.",
            realtime_set = "Realtime set.",
            manual_time_set = "Manual time set.",
            invalid_format = "Invalid format.",
            timescale_set = "Timescale set.",
            timescale_usage = "Usage: /rntime_timescale <0.1 - 5.0>",
            settime_usage = "Usage: /rntime_settime HH:MM",
            help_header = "^2RN Time – Commands:^0",
            help_realtime = "/rntime_setrealtime <code>",
            help_settime = "/rntime_settime HH:MM",
            help_timescale = "/rntime_timescale <0.1 - 5.0>",
            help_help = "/rntime_help",
            info_header = "^2RN Time – Info:^0",
            info_mode_rt = "Mode: Realtime",
            info_mode_manual = "Mode: Manual",
            info_timezone = "Timezone: %s",
            info_language = "Language: %s",
            info_timescale = "Timescale: %.2f",
            info_currenttime = "Current Time: %02d:%02d:%02d"
        }
    end

    -- standardpick
    if Lang[langKey] then
        return Lang[langKey]
    end

    -- ✅ if de is missing clean fallback
    print("[RN] ERROR: Language table for '" .. tostring(langKey) .. "' not found! Using EN as fallback.")
    return Lang["en"]
end


-- Shortcut for texts
local function L(key)
    local t = GetLang()
    return t[key] or ("missing lang: " .. tostring(key))
end

local function Prefix()
    local t = GetLang()
    return t.prefix or "^3[RN-Time]^0 "
end

-- RN-Time Startup Logs (Language + Prefix of Config & lang.lua)
CreateThread(function()
    Wait(200)

    local t = GetLang()
    local prefix = Prefix()
    local langUpper = string.upper(Config.Language or "EN")
    local version = Config.Version or "UNKNOWN"

    if t.language_loaded then
        print(prefix .. t.language_loaded)
    end

    if t.language_selected then
        print(prefix .. t.language_selected)
    end

    if t.version_info then
        print(prefix .. string.format(t.version_info, version))
    end
end)


-- Debug
local function DebugLog(msg)
    if Config.Debug then
        print("[RN-DEBUG] " .. msg)
    end
end

-- Chat-Output
local function ChatMsg(source, msg)
    if source == 0 then
        print("[RN] " .. msg)
    else
        TriggerClientEvent("chat:addMessage", source, { args = { Prefix(), msg } })
    end
end


-- adminsystem
local function IsAdmin(source)
    if source == 0 then return true end

    local ids = GetPlayerIdentifiers(source)
    for _, id in ipairs(ids) do
        for _, admin in ipairs(Config.AdminList) do
            if string.lower(id) == string.lower(admin) then
                return true
            end
        end
    end
    return false
end

-----------------------------------------------------------------------
-- timezones
-----------------------------------------------------------------------
local Timezones = {
    de  = 1,
    uk  = 0,
    us  = -5,
    usw = -8,
    au  = 10,
    jp  = 9,
    utc = 0
}

local function GetTimezoneTime(code)
    local utc = os.date("!*t")
    local offset = Timezones[string.lower(code)]

    if not offset then
        return nil, nil, nil, true
    end

    return (utc.hour + offset) % 24, utc.min, utc.sec, false
end

-----------------------------------------------------------------------
-- time-management
-----------------------------------------------------------------------
local useRealtime = Config.UseRealtimeOnStart
local currentTimezone = (Timezones[Config.Language] and Config.Language) or "utc"

local currentHour = 12
local currentMinute = 0
local currentSecond = 0

local timeScale = Config.DefaultTimescale

local function ApplyTime(h, m, s)
    currentHour = h
    currentMinute = m
    currentSecond = s
    TriggerClientEvent("rn_servertime:applyTime", -1, h, m, s)
end

-----------------------------------------------------------------------
-- /rntime_setrealtime
-----------------------------------------------------------------------
RegisterCommand("rntime_setrealtime", function(src, args)
    if not IsAdmin(src) then ChatMsg(src, L("no_permission")) return end

    local code = args[1] and string.lower(args[1]) or Config.Language
    local h, m, s, err = GetTimezoneTime(code)

    if err then
        ChatMsg(src, L("invalid_timezone"))
        return
    end

    useRealtime = true
    currentTimezone = code
    ApplyTime(h, m, s)

    ChatMsg(src, string.format(L("realtime_set"), code, h, m, s))
end)

-----------------------------------------------------------------------
-- /rntime_settime HH:MM
-----------------------------------------------------------------------
RegisterCommand("rntime_settime", function(src, args)
    if not IsAdmin(src) then ChatMsg(src, L("no_permission")) return end
    if #args < 1 then ChatMsg(src, L("settime_usage")) return end

    local h, m = args[1]:match("^(%d%d?):(%d%d)$")
    h = tonumber(h)
    m = tonumber(m)

    if not h or not m or h > 23 or m > 59 then
        ChatMsg(src, L("invalid_format"))
        return
    end

    useRealtime = false
    ApplyTime(h, m, 0)

    ChatMsg(src, string.format(L("manual_time_set"), h, m))
end)

-----------------------------------------------------------------------
-- /rntime_timescale
-----------------------------------------------------------------------
RegisterCommand("rntime_timescale", function(src, args)
    if not IsAdmin(src) then ChatMsg(src, L("no_permission")) return end

    local scale = tonumber(args[1])
    if not scale then ChatMsg(src, L("timescale_usage")) return end

    if scale < Config.MinTimescale then scale = Config.MinTimescale end
    if scale > Config.MaxTimescale then scale = Config.MaxTimescale end

    timeScale = scale
    TriggerClientEvent("rn_servertime:applyTimescale", -1, scale)

    ChatMsg(src, string.format(L("timescale_set"), scale))
end)

-----------------------------------------------------------------------
-- /rntime_help
-----------------------------------------------------------------------
RegisterCommand("rntime_help", function(src)
    if not IsAdmin(src) then ChatMsg(src, L("no_permission")) return end

    ChatMsg(src, L("help_header"))
    ChatMsg(src, L("help_realtime"))
    ChatMsg(src, L("help_settime"))
    ChatMsg(src, L("help_timescale"))
    ChatMsg(src, L("help_info"))
    ChatMsg(src, L("help_help"))
end)


-----------------------------------------------------------------------
-- /rntime_info
-----------------------------------------------------------------------
RegisterCommand("rntime_info", function(src)
    if not IsAdmin(src) then
        ChatMsg(src, L("no_permission"))
        return
    end

    ChatMsg(src, L("info_header"))

    -- Modus
    if useRealtime then
        ChatMsg(src, L("info_mode_rt"))
    else
        ChatMsg(src, L("info_mode_manual"))
    end

    -- Zeitzone
    ChatMsg(src, string.format(L("info_timezone"), currentTimezone))

    -- Sprache
    ChatMsg(src, string.format(L("info_language"), Config.Language))

    -- Timescale
    ChatMsg(src, string.format(L("info_timescale"), timeScale))

    -- Zeit
    ChatMsg(src, string.format(L("info_currenttime"), currentHour, currentMinute, currentSecond))
end)


-----------------------------------------------------------------------
-- Join Sync
-----------------------------------------------------------------------
AddEventHandler("playerJoining", function()
    local src = source

    if useRealtime then
        local h, m, s = GetTimezoneTime(currentTimezone)
        TriggerClientEvent("rn_servertime:applyTime", src, h, m, s)
    else
        TriggerClientEvent("rn_servertime:applyTime", src, currentHour, currentMinute, currentSecond)
    end

    TriggerClientEvent("rn_servertime:applyTimescale", src, timeScale)
end)

-----------------------------------------------------------------------
-- realtime every minute check
-----------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(60000)

        if useRealtime then
            local h, m, s = GetTimezoneTime(currentTimezone)
            ApplyTime(h, m, s)
        end
    end
end)

-----------------------------------------------------------------------
-- serverstart sync
-----------------------------------------------------------------------
CreateThread(function()
    Wait(5000)

    if Config.UseRealtimeOnStart then
        local h, m, s = GetTimezoneTime(currentTimezone)
        ApplyTime(h, m, s)
    end
end)
