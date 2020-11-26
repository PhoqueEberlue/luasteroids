require("sources/lib/customFunctions")

ScreenWidth = 1920
ScreenHeigth = 1080
Speed = 10

Enemy = {}
Enemy.__index = Enemy

function Enemy:new(player_pos, asteroid)
    local e = {}
    setmetatable(e, Enemy)
    local size = 50
    local half = size / 2
    local pos = Chose({x = love.math.random(0 - half, ScreenWidth + half), y = Chose(0 - half, ScreenHeigth + half)}, {x = Chose(0 - half, ScreenWidth + half), y = love.math.random(0 - half, ScreenHeigth + half)})
    e.x = pos.x
    e.y = pos.y
    local speed = Trajectory({x = e.x, y = e.y}, player_pos, Speed)
    e.xspeed = speed.x
    e.yspeed = speed.y
    e.size = size
    e.half = half
    e.asteroid = asteroid
    return e
end

function Enemy:update()
    self.x = self.x + self.xspeed
    self.y = self.y + self.yspeed
end

function Enemy:draw()
    love.graphics.draw(self.asteroid, self.x, self.y, math.rad(0), 1, 1, self.half, self.half)
end

function Enemy:collide(pos, size)
    if pos.x + self.half > self.x and pos.x - self.half < self.x + self.size then
        if pos.y + self.half > self.y and pos.y - self.half < self.y + self.size then
            return true
        end
    end
    return false
end

function Enemy:isOutOfScreen()
    local res = false
    if self.x - self.half > ScreenWidth or self.y - self.half > ScreenHeigth then
        res = true
    elseif self.x + self.half < 0 or self.y + self.half < 0 then
        res = true
    end
    return res
end
