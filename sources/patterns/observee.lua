Observee = {list_enemys = {}}
Observee.__index = Observee

function Observee:addObserver(enemy)
    table.insert(self.list_enemys, enemy)
end

function Observee:removeObserver(enemy)
    local index = nil
    for i, en in pairs(self.list_enemys) do
        if tostring(en) == tostring(enemy) then
            index = i
            break
        end
    end
    table.remove(self.list_enemys, index)
end

function Observee:notifyObserver(player_pos, player_size)
    local res = 0
    for _, e in pairs(self.list_enemys) do
        if e:collide(player_pos, player_size) then
            res = res + 1
        end
    end
    return res
end
