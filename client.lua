local socket = require("socket")

local udp_socket = socket.udp()
udp_socket:setpeername("ip address here", 9999)
udp_socket:settimeout(1)

udp_socket:send("Bonjooooouuuuuuuuuuuuuuuur")
local data = udp_socket:receive()
if data then
    print("Received: ", data)
end