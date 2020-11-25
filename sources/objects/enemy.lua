require("sources/lib/customFunctions")

ScreenWidth = 1920
ScreenHeigth = 1080
Speed = 10

Enemy = {}
Enemy.__index = Enemy

function Enemy:new(player_pos, player_size)
    local e = {}
    setmetatable(e, Enemy)
    local size = love.math.random(20, 150)
    local pos = Chose({x = love.math.random(0 - size, ScreenWidth), y = Chose(0 - size, ScreenHeigth)}, {x = Chose(0 - size, ScreenWidth), y = love.math.random(0 - size, ScreenHeigth)})
    e.x = pos.x
    e.y = pos.y
    local speed = Trajectory({x = e.x, y = e.y}, player_pos, size, player_size, Speed)
    e.xspeed = speed.x
    e.yspeed = speed.y
    e.size = size
    return e
end

function Enemy:update()
    self.x = self.x + self.xspeed
    self.y = self.y + self.yspeed
end

function Enemy:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end

function Enemy:collide(pos, size)
    if pos.x + size > self.x and pos.x < self.x + self.size then
        if pos.y + size > self.y and pos.y < self.y + self.size then
            return true
        end
    end
    return false
end

function Enemy:isOutOfScreen()
    local res = false
    if self.x > ScreenWidth or self.y > ScreenHeigth then
        res = true
    elseif self.x + self.size < 0 or self.y + self.size < 0 then
        res = true
    end
    return res
end
