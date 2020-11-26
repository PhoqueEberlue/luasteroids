require("sources/objects/enemy")

Enemys = {}
Enemys.__index = Enemys

function Enemys:new(asteroid)
    local es = {}
    setmetatable(es, Enemys)
    es.listEnemys = {}
    es.asteroid = asteroid
    return es
end

function Enemys:addEnemy(player_pos)
    local e = Enemy:new(player_pos, self.asteroid)
    table.insert(self.listEnemys, e)
end

function Enemys:removeEnemy(e)
    local index = nil
    for i, en in pairs(self.listEnemys) do
        if tostring(en) == tostring(e) then
            index = i
            break
        end
    end
    table.remove(self.listEnemys, index)
end

function Enemys:update(dt, pos, size)
    local res = false
    local outOfScreenEnemys = {}
    for _, e in pairs(self.listEnemys) do
        local willBedeleted = e:isOutOfScreen()
        if not willBedeleted then
            if not res then
                res = e:collide(pos, size)
            end
            e:update(dt)
        else
            table.insert(outOfScreenEnemys, e)
        end
    end
    for _, e in pairs(outOfScreenEnemys) do
        self:removeEnemy(e)
    end
    return res
end

function Enemys:draw()
    for _, e in pairs(self.listEnemys) do
        e:draw()
    end
end