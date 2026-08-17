local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('panic', function()
    TriggerEvent('panicbutton:client:activate')
end)

RegisterNetEvent('panicbutton:client:activate')
AddEventHandler('panicbutton:client:activate', function()
    -- Trial notification
    QBCore.Functions.Notify("Panic Button Activated (Trial Version)", "primary", 5000)

    -- Trigger server event
    TriggerServerEvent('panicbutton:server:activate')
end)

RegisterNetEvent('panicbutton:client:alert')
AddEventHandler('panicbutton:client:alert', function(src)
    local ped = GetPlayerPed(GetPlayerFromServerId(src))
    local coords = GetEntityCoords(ped)

    -- Sound alert
    PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)

    -- Notification
    QBCore.Functions.Notify("Officer Panic Alert (Trial)", "error", 5000)
end)
