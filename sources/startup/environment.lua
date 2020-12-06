--[[
Environment class:
A controler for the different classes of the game.
It will permit different classes to interact between each others.
]]

require("sources/lib/customFunctions")

Environment = {}
Environment.__index = Environment

function Environment:new(player, enemys, window, asteroids)
    local env = {}
    setmetatable(env, Environment)
    env.player = player
    env.enemys = enemys
    env.window = window
    env.asteroids = asteroids
    return env
end

function Environment:update(dt)
    self.player:update(dt)
    self.enemys:update(dt)
    local nbCollission = self.enemys:notifyObserver(self.player:getPos(), self.player:getSize())
    if nbCollission > 0 then
        self.player:setHp(self.player:getHp() - nbCollission)
        Hp = Hp - nbCollission
    end
    if Tmp == 60 then
        Tmp = 0
        local enemy = Chose(Enemy:new(50, 600, {x = self.player.x, y = self.player.y}, self.asteroids.asteroid_50_img),
                            Enemy:new(100, 300, {x = self.player.x, y = self.player.y}, self.asteroids.asteroid_100_img))
        self.enemys:addObserver(enemy)
    else
        Tmp = Tmp + 1
    end
end

function Environment:draw()
    self.player:draw()
    self.enemys:draw()
end

--[[
function Enemys:addCustomEnemy(size, speed, player_pos, x, y)
    local enemy = Enemy:new(size, speed, player_pos, self.asteroids.asteroid_50_img, x ,y)
    table.insert(self.list_enemys, enemy)
end
--]]
