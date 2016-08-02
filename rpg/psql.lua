

function addNewUser(username, password)
    local luasql = require "luasql.postgres"
    local envv = assert (luasql.postgres())
    local con = envv:connect('frrpg', 'postgres', 'pass', "127.0.0.1", 5432)
    if(con == nil) then
        print("connection failed")
        return
    else
        print("connected")
    end
    --username = "testuser"
    --local password = "pass"
    assert(con:execute("INSERT into users " .. " VALUES('" ..username.. "', '" ..password.. "')"))
end

addNewUser('user2', 'pass')
