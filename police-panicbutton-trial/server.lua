-- Trial Version Console Message
print("^3[Panic Button] Trial Version Loaded - Limited Features Active^0")

local QBCore = exports['qb-core']:GetCoreObject()
local lastUse = 0
local cooldown = 45 -- 45 second cooldown for trial version

RegisterNetEvent('panicbutton:server:activate')
AddEventHandler('panicbutton:server:activate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local currentTime = os.time()

    if currentTime - lastUse < cooldown then
        local remaining = cooldown - (currentTime - lastUse)
        TriggerClientEvent('QBCore:Notify', src, "Trial cooldown active: " .. remaining .. "s remaining", "error")
        return
    end

    lastUse = currentTime

    -- Send dispatch alert
    TriggerEvent('ps-dispatch:server:SendAlert', {
        coords = GetEntityCoords(GetPlayerPed(src)),
        title = "Panic Button (Trial)",
        message = "Officer has activated the panic button!",
        blip = {
            sprite = 161,
            colour = 1,
            scale = 1.2,
            duration = 20000 -- 20 seconds trial blip
        }
    })

    -- Notify all police
    TriggerClientEvent('panicbutton:client:alert', -1, src)
end)
