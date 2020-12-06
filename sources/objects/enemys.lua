require("sources/objects/enemy")
require("sources/lib/customFunctions")
require("sources/patterns/observee")

Enemys = {}
Enemys.__index = Enemys
setmetatable(Enemys, Observee)

function Enemys:new()
    local enemys = {}
    setmetatable(enemys, Enemys)
    return enemys
end

function Enemys:update(dt)
    local out_of_screen_enemys = {}
    for _, e in pairs(self.list_enemys) do
        local will_be_deleted = e:isOutOfScreen()
        if not will_be_deleted then
            e:update(dt)
        else
            table.insert(out_of_screen_enemys, e)
        end
    end
    for _, e in pairs(out_of_screen_enemys) do
        self:removeObserver(e)
    end
end

function Enemys:draw()
    for _, enemy in pairs(self.list_enemys) do
        enemy:draw()
    end
end
