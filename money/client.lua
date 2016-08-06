RegisterNetEvent("giveMoney") -- Registers the event so that it can be called from the server.
AddEventHandler('giveMoney', function(message) -- Captures the event
    TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0}, "gun spawned.") -- Sends a message to the player saying the vehicle was succesfully spawned.
    Citizen.CreateThread(function() -- Created a new thread
        Citizen.Wait(50) -- A wait function for 50 miliseconds.
        local playerPed = GetPlayerPed(-1)
        if playerPed and playerPed ~= -1 then
            DisplayCash(true)
            SetSingleplayerHudCash(500, 100)
            TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0}, "Giving Cash")
            end
        end)
end)



