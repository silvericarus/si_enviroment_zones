RegisterNetEvent('si_enviroment_zones:playerEnteredZone')
AddEventHandler('si_enviroment_zones:playerEnteredZone', function(zoneName, message)
    local playerId = source -- Get the player ID from the event source
    print(string.format('Player entered zone %s', zoneName))

    TriggerClientEvent("chat:addMessage", playerId, {
        color = { 255, 0, 0 },
        multiline = true,
        args = { "[Zone Alert] - ", string.format("El jugador %s ha entrado en la zona '%s'!", GetPlayerName(playerId), zoneName) },
    })
end)
