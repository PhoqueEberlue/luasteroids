local socket = require("socket")
local json = require("json")

Server = {games = {}}
Server.__index = Server

function Server:new()
    local udp_socket = socket.udp()
    udp_socket:setsockname("*", 5555)
    udp_socket:settimeout(1)
    local server = {udp = udp_socket}
    setmetatable(server, Server)
    return server
end

function Server:run()
    while true do
        local data, ip, port = self.udp:receivefrom()
        if data then -- TODO: need to handle bad data receiption that could cause errors
            local table_data = json:decode(data)
            if table_data.type == "CreateLobby" then
                self:CreateLobby(table_data, ip, port)
            end
            print("Received: ", data, ip, port)
        end
        socket.sleep(0.01)
    end
end

function Server:CreateLobby(data, ip , port)
    -- TODO
    self.udp:sendto("OK", ip, port)
end

local serv = Server:new()
serv.run()
