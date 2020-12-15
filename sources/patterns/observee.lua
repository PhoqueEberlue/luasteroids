require("sources/lib/customFunctions")

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

function Observee:notifyObserver(player_pos, player_size, soundasteroid)
    local res = 0
    local stop = false
    local already_redirected = {}
    for _, enemy in pairs(self.list_enemys) do
        for _, redirected in pairs(already_redirected) do
            if redirected == enemy then
                stop = true
                break
            end
        end
        if not stop then
            for _, enemy2 in pairs(self.list_enemys) do
                if enemy ~= enemy2 and enemy:collide({x = enemy2.x, y = enemy2.y}, enemy2.size) then
                    local savex = enemy2.xspeed
                    local savey = enemy2.yspeed
                    enemy2.xspeed = enemy.xspeed
                    enemy2.yspeed = enemy.yspeed
                    enemy.xspeed = savex
                    enemy.yspeed = savey
                    soundasteroid:stop()
                    soundasteroid:play()
                    table.insert(already_redirected, enemy2)
                    break
                end
            end
        end
        if enemy:collide(player_pos, player_size) then
            res = res + 1
        end
    end
    return res
end
