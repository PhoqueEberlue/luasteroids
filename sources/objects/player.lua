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
    player.left = false
    player.top = false
    player.right = false
    player.bottom = false
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

function Player:setHp()
    self.hp = self.hp -1
end

function Player:setLeft()
    self.left = true
    self.top = false
    self.right = false
    self.bottom = false
end

function Player:setTop()
    self.left = false
    self.top = true
    self.right = false
    self.bottom = false
end

function Player:setRight()
    self.left = false
    self.top = false
    self.right = true
    self.bottom = false
end

function Player:setBottom()
    self.left = false
    self.top = false
    self.right = false
    self.bottom = true
end

function Player:update(dt)
    if love.keyboard.isDown("q") then
        self.x = self.x - self.speed * dt
        self:setLeft()
    end
    if love.keyboard.isDown("z") then
        self.y = self.y - self.speed * dt
        self:setTop()
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
        self:setRight()
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
        self:setBottom()
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
    local deg = 0
    if self.left then
        deg = 270
    end
    if self.top then
        deg = 0
    end
    if self.right then
        deg = 90
    end
    if self.bottom then
        deg = 180
    end
    love.graphics.draw(self.spaceship, self.x, self.y, math.rad(deg), 1, 1, self.half, self.half)
end