Player = {}
Player.__index = Player

function Player:new(x, y, speed, size, spaceship)
    local player = {}
    setmetatable(player, Player)
    player.x = x
    player.y = y
    player.spaceship = spaceship
    player.speed = speed
    player.size = size
    player.half = size/2
    player.hp = 100
    player.input = {"top", "top"} -- saving 2 last input in order to draw the direction of the spaceship
    return player
end

function Player:getPos()
    return {x = self.x, y = self.y}
end

function Player:getSize()
    return self.size
end

function Player:getHp()
    return self.hp
end

function Player:setHp(hp)
    self.hp = hp
end

function Player:addInput(input)
    table.remove(self.input, 1)
    table.insert(self.input, input)
end

function Player:update(dt)
    if love.keyboard.isDown("q") then
        self.x = self.x - self.speed * dt
        self:addInput("left")
    end
    if love.keyboard.isDown("z") then
        self.y = self.y - self.speed * dt
        self:addInput("top")
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
        self:addInput("right")
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
        self:addInput("bot")
    end
    if self.x - self.half > 1920 then
        self.x = 1 - self.half
    end
    if self.x + self.half < 0 then
        self.x = 1920 + 1 - self.half
    end
    if self.y - self.half > 1080 then
        self.y = 1 - self.half
    end
    if self.y + self.half < 0 then
        self.y = 1080 + 1 - self.half
    end
end

function Player:draw()
    local a = self.input[1]
    local b = self.input[2]
    local deg = 0
    if a == "left" and b == "left" then
        deg = 270
    end
    if a == "top" and b == "top" then
        deg = 0
    end
    if a == "right" and b == "right" then
        deg = 90
    end
    if a == "bot" and b == "bot" then
        deg = 180
    end
    if (a == "left" and b == "top") or (a == "top" and b == "left") then
        deg = 315
    end
    if (a == "right" and b == "top") or (a == "top" and b == "right") then
        deg = 45
    end
    if (a == "right" and b == "bot") or (a == "bot" and b == "right") then
        deg = 135
    end
    if (a == "left" and b == "bot") or (a == "bot" and b == "left") then
        deg = 225
    end
    love.graphics.draw(self.spaceship, self.x, self.y, math.rad(deg), 1, 1, self.half, self.half)
end
