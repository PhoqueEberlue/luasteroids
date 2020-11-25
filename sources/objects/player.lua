Player = {}
Player.__index = Player

function Player:new(x, y, speed, size, spaceship)
    local p = {}
    setmetatable(p, Player)
    p.x = x
    p.y = y
    p.spaceship = spaceship
    p.speed = speed
    p.size = size
    p.hp = 100
    p.left = false
    p.top = false
    p.right = false
    p.bottom = false
    return p
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

function Player:setLeft(bool)
    self.left = bool
    self.right = not bool
end

function Player:setTop(bool)
    self.top = bool
    self.bottom = not bool
end

function Player:update()
    if self.left then
        self.x = self.x - 1
    end
    if self.top then
        self.y = self.y - 1
    end
    if self.right then
        self.x = self.x + 1
    end
    if self.bottom then
        self.y = self.y + 1
    end
    if love.keyboard.isDown("q") then
        self.x = self.x - self.speed
        self:setLeft(true)
    end
    if love.keyboard.isDown("z") then
        self.y = self.y - self.speed
        self:setTop(true)
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed
        self:setLeft(false)
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed
        self:setTop(false)
    end
    if self.x > 1920 then
        self.x = 0
    end
    if self.x < 0 then
        self.x = 1920
    end
    if self.y > 1080 then
        self.y = 0
    end
    if self.y < 0 then
        self.y = 1080
    end
end

function Player:draw()
    --love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
    love.graphics.draw(self.spaceship, self.x, self.y)
end