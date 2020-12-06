Interface = {name = "interface", list = {}} -- if an attribute isn't redefined in impleted classes, it will use Interface's attribute.
Interface.__index = Interface

function Interface:bark()
    print(self.name.." BARK BARK BARK")
end

Enemy = {} -- Class that we'll implement
Enemy.__index = Enemy
print(Enemy.list)
setmetatable(Enemy, Interface) -- adds Interface's methods to the Enemy class: implements
print(Enemy.list)

function Enemy:new(size, name)
    local e = {}
    setmetatable(e, Enemy)
    e.size = size
    e.name = name
    return e
end


local e1 = Enemy:new(5, "marex")
local e2 = Enemy:new(10, "rhobalas")

print(e1.size) -- 5
print(e2.size) -- 10
e1:bark() -- marex BARK BARK BARK
e2:bark() -- rhobalas BARK BARK BARK
e1:bark() -- marex BARK BARK BARK
print(e1.list)

print(Interface.name) -- interface