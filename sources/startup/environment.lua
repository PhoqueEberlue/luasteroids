--[[
Environment class:
A controler for the different classes of the game.
It will permit different classes to interact between each others.
]]

Environment = {}
Environment.__index = Environment

function Environment:new(player, enemys, window)
    local env = {}
    setmetatable(env, Environment)
    env.player = player
    env.enemys = enemys
    env.window = window
    return env
end

function Environment:update(dt)
    self.player:update(dt)
    if self.enemys:update(dt, self.player:getPos(), self.player:getSize()) then
        self.player:setHp()
        Hp = Hp - 1
    end
    if Tmp == 60 then
        Tmp = 0
        self.enemys:addEnemy({x = self.player.x, y = self.player.y})
    else
        Tmp = Tmp + 1
    end
    if Tmp == 30 then
        self.enemys:addEnemy({x = self.player.x, y = self.player.y})
    end
end

function Environment:draw()
    self.player:draw()
    self.enemys:draw()
end