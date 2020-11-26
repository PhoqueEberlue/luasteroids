require("sources/objects/enemy")
require("sources/lib/customFunctions")

Enemys = {}
Enemys.__index = Enemys

function Enemys:new(asteroids)
    local enemys = {}
    setmetatable(enemys, Enemys)
    enemys.list_enemys = {}
    enemys.asteroids = asteroids
    return enemys
end

function Enemys:addEnemy(player_pos)
    local enemy = Chose(Enemy:new(50, 600, player_pos, self.asteroids.asteroid_50_img),
                        Enemy:new(100, 300, player_pos, self.asteroids.asteroid_100_img))
    table.insert(self.list_enemys, enemy)
end

function Enemys:removeEnemy(e)
    local index = nil
    for i, en in pairs(self.list_enemys) do
        if tostring(en) == tostring(e) then
            index = i
            break
        end
    end
    table.remove(self.list_enemys, index)
end

function Enemys:update(dt, player_pos, player_size)
    local res = false
    local out_of_screen_enemys = {}
    for _, e in pairs(self.list_enemys) do
        local will_be_deleted = e:isOutOfScreen()
        if not will_be_deleted then
            if not res then
                res = e:collide(player_pos, player_size)
            end
            e:update(dt)
        else
            table.insert(out_of_screen_enemys, e)
        end
    end
    for _, e in pairs(out_of_screen_enemys) do
        self:removeEnemy(e)
    end
    return res
end

function Enemys:draw()
    for _, enemy in pairs(self.list_enemys) do
        enemy:draw()
    end
end