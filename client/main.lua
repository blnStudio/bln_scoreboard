IsVisible = false

RegisterCommand(Config.command, function ()
    TriggerServerEvent('PrepareScoreboard')
end, false)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, Config.key) then
            TriggerServerEvent('PrepareScoreboard')
        end
    end
end)

RegisterNetEvent("OpenScoreboard")
AddEventHandler("OpenScoreboard", function(players)
    SetNuiFocus(true, true)
    IsVisible = true
    SendNUIMessage({
        action = 'scoreboard',
        show = true,
        title = Config.title,
        players = json.decode(players),
        showFakeData = Config.showFakeData,
    })
end)



RegisterNuiCallback('CloseScoreboard', function ()
    SetNuiFocus(false, false)
    IsVisible = false
end)