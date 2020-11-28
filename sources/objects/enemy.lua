ScreenWidth = 1920
ScreenHeigth = 1080

Enemy = {}
Enemy.__index = Enemy

function Enemy:new(size, speed, player_pos, asteroid, x, y)
    local enemy = {}
    setmetatable(enemy, Enemy)
    local half = size / 2
    if x == nil or y == nil then
        local pos = Chose({x = love.math.random(0 - half, ScreenWidth + half), y = Chose(0 - half, ScreenHeigth + half)}, {x = Chose(0 - half, ScreenWidth + half), y = love.math.random(0 - half, ScreenHeigth + half)})
        enemy.x = pos.x
        enemy.y = pos.y
    else
        enemy.x = x
        enemy.y = y
    end
    local speeds = Trajectory({x = enemy.x, y = enemy.y}, player_pos, speed)
    enemy.xspeed = speeds.x
    enemy.yspeed = speeds.y
    enemy.size = size
    enemy.half = half
    enemy.asteroid = asteroid
    enemy.rotation = love.math.random(0, 359)
    enemy.rspeed = speed/50
    return enemy
end

function Enemy:update(dt)
    self.x = self.x + self.xspeed * dt
    self.y = self.y + self.yspeed * dt
    if self.rotation ~= 360 then
        self.rotation = self.rotation + self.rspeed * dt
    else
        self.rotation = 0
    end
end

function Enemy:draw()
    love.graphics.draw(self.asteroid, self.x, self.y, math.rad(self.rotation), 1, 1, self.half, self.half)
end

function Enemy:collide(player_pos, player_size)
    local half = player_size / 2
    if player_pos.x + half > self.x - self.half and player_pos.x - half < self.x + self.half then
        if player_pos.y + half > self.y - self.half and player_pos.y - half < self.y + self.half then
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
