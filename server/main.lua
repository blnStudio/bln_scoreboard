local framework = exports.bln_lib:framework() 

RegisterServerEvent("PrepareScoreboard")
AddEventHandler("PrepareScoreboard", function()
    local serverPlayers = GetPlayers()
    local players = {}

    for _, playerSrc in ipairs(serverPlayers) do
        local user = framework:getUser(playerSrc)
        local userMoney = user:getMoney(0)

        if user then
            table.insert(players, {
                id = tonumber(playerSrc),
                name = string.format("%s %s", user.data.firstname, user.data.lastname),
                job = user.data.job,
                money = userMoney,
                ping = GetPlayerPing(playerSrc) or 0,
            })
        end
    end

    TriggerClientEvent('OpenScoreboard', source, json.encode(players))
end)
