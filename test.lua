Enemy = {id = 0}
Enemy.__index = Enemy

function Enemy:new(size)
    local e = {}
    setmetatable(e, Enemy)
    e.size = size
    Enemy.id = Enemy.id + 1
    e.id = Enemy.id
    return e
end


local e1 = Enemy:new(5)
local e2 = Enemy:new(10)
local tab = {}

table.insert(tab, e1)
table.insert(tab, e2)
print(e1)
print(e2)
print(e1.size)
print(e1.id)
print(e2.size)
print(e2.id)
print(tab[1])
print(tab[2])
table.remove(tab, 1)

print(tab[1])
print(tab[2])

local oui = {tg = false}
oui.ok = false
print(oui.tg)
print(oui.ok)