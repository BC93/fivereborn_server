
RegisterNetEvent("addUser") -- Registers the event so that it can be called from the server.
AddEventHandler('addUser', function(message) -- Captures the event
    Citizen.CreateThread(function() -- Created a new thread
        TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0}, " Registering user.") 
        Citizen.Wait(50) -- A wait function for 50 miliseconds.
        local playerPed = PlayerId() -- Gets the player that ran the command.
        TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0}, "PID: " ..playerPed.. ".")
        local username = getPlayerName(playerPed)
        local password = message
        result = addNewUser(username, message)
            
        TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0}, "" ..username.. " has been succesfully registered.") -- Sends a message to the player saying the vehicle was succesfully spawned.
    end)
end)



function getLocalPlayer()
      local Player = GetPlayerPed(-1)
      return Player
end

function getPlayerName(source)
    return GetPlayerName(source)
end

function addNewUser(username, password)
    TriggerEvent('chatMessage', 'DEBUGGER', {0, 255, 0}, "user: " ..username.. ".")
    local luasql = require "luasql.postgres"
    TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0},"connecting")
    local envv = assert (luasql.postgres())
    local con = envv:connect('frrpg', 'postgres', 'pass', "127.0.0.1", 5432)
    --if(con == nil) then
        --TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0}, "failed to connect to database")
        --return
    --else
        --TriggerEvent('chatMessage', 'SYSTEM', {0, 255, 0},"connected")
    --end
    --username = "testuser"
    --local password = "pass"
    local results = assert(con:execute("INSERT into users " .. " VALUES('" ..username.. "', '" ..password.. "')"))
    return results
end

