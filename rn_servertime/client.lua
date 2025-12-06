-----------------------------------------------------------------------
--                    Servertime v1.2.0 by Buschfuss©
--                www.respawn-nation.de / discord.gg/rnmg
-----------------------------------------------------------------------


-- Variables
local timeScale = 1.0
local currentHour = 12
local currentMinute = 0
local currentSecond = 0
local timeInitialized = false



-- event: server sets time (eg. realtime or set manual)
RegisterNetEvent("rn_servertime:applyTime")
AddEventHandler("rn_servertime:applyTime", function(h, m, s)

    currentHour   = h
    currentMinute = m
    currentSecond = s
    timeInitialized = true

    Citizen.InvokeNative(0x669E223E64B1903C, h, m, s, 0.0, true)
end)



-- event: server sets timescale
RegisterNetEvent("rn_servertime:applyTimescale")
AddEventHandler("rn_servertime:applyTimescale", function(scale)
    timeScale = scale
end)


-- time-simulation
CreateThread(function()
    while true do

        local interval = 1000 / timeScale
        Wait(interval)

        if timeInitialized then
            -- Sekunde erhöhen
            currentSecond = (currentSecond or 0) + (1 * timeScale)

            if currentSecond >= 60 then
                currentSecond = 0
                currentMinute = currentMinute + 1
            end

            if currentMinute >= 60 then
                currentMinute = 0
                currentHour = currentHour + 1
            end

            if currentHour >= 24 then
                currentHour = 0
            end

            Citizen.InvokeNative(
                0x669E223E64B1903C,
                currentHour,
                currentMinute,
                currentSecond,
                0.0,
                true
            )
        end
    end
end)
