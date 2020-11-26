ScreenWidth = 1920
ScreenHeigth = 1080

Enemy = {}
Enemy.__index = Enemy

function Enemy:new(size, speed, player_pos, asteroid)
    local enemy = {}
    setmetatable(enemy, Enemy)
    local half = size / 2
    local pos = Chose({x = love.math.random(0 - half, ScreenWidth + half), y = Chose(0 - half, ScreenHeigth + half)}, {x = Chose(0 - half, ScreenWidth + half), y = love.math.random(0 - half, ScreenHeigth + half)})
    enemy.x = pos.x
    enemy.y = pos.y
    local speeds = Trajectory({x = enemy.x, y = enemy.y}, player_pos, speed)
    enemy.xspeed = speeds.x
    enemy.yspeed = speeds.y
    enemy.size = size
    enemy.half = half
    enemy.asteroid = asteroid
    return enemy
end

function Enemy:update(dt)
    self.x = self.x + self.xspeed * dt
    self.y = self.y + self.yspeed * dt
end

function Enemy:draw()
    love.graphics.draw(self.asteroid, self.x, self.y, math.rad(0), 1, 1, self.half, self.half)
end

function Enemy:collide(pos)
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
