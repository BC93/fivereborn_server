RegisterServerEvent("chatCommandEntered") -- Registers the event so that i can be called by the client.
AddEventHandler('chatCommandEntered', function(fullcommand) -- Event handler for when a command is entered,
    command = stringsplit(fullcommand, " ") -- Converts the command arguments into a array for easy usage.

    if(command[1] == "/cash") then -- Captures the command
        TriggerClientEvent("giveMoney", source, command[2]) -- Runs a client event.
    end

end)

function stringsplit(self, delimiter) -- A function
  local a = self:Split(delimiter) -- Splits the string.
  local t = {} -- Creates a table

  for i = 0, #a - 1 do -- For loop to loop through all the arguments.
     table.insert(t, a[i]) -- Inserts the arguments into a table
  end

  return t -- Returns the table
end
