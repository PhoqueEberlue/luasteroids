require("sources/objects/enemy")

Enemys = {}
Enemys.__index = Enemys

function Enemys:new()
    local es = {}
    setmetatable(es, Enemys)
    es.listEnemys = {}
    return es
end

function Enemys:addEnemy(player_pos, player_size)
    local e = Enemy:new(love.math.random(50, 100), player_pos, player_size)
    table.insert(self.listEnemys, e)
end

function Enemys:removeEnemy(e)
    local index = nil
    if self.listEnemys then
        for i, en in pairs(self.listEnemys) do
            if tostring(en) == e then
                index = i
                break
            end
        end
        if index then
            table.remove(self.listEnemys, index)
        end
    end
end

function Enemys:update(pos, size)
    local res = false
    local outOfScreenEnemys = {}
    for _, e in pairs(self.listEnemys) do
        local willBedeleted = e:isOutOfScreen()
        if not willBedeleted then
            if not res then
                res = e:collide(pos, size)
            end
            e:update()
        else
            table.insert(outOfScreenEnemys, e)
        end
    end
    for _, e in pairs(outOfScreenEnemys) do
        self.removeEnemy(e)
    end
    return res
end

function Enemys:draw()
    for _, e in pairs(self.listEnemys) do
        e:draw()
    end
end