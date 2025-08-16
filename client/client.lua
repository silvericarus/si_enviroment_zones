Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for _, zone in pairs(Config.Zones) do
            if #(playerCoords - zone.coords) < zone.radius then
                TriggerServerEvent("si_enviroment_zones:playerEnteredZone", zone.name, zone.message)
                break -- Exit the loop if the player is in a zone
            end
        end
        Citizen.Wait(1000) -- Check every second
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, zone in pairs(Config.Zones) do
            print(string.format('Zone %s initialized at coordinates: %s with radius: %.2f',
                zone.name, tostring(zone.coords), zone.radius))
        end
    end
end)
