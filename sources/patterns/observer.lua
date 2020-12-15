Observer = {} -- if an attribute isn't redefined in impleted classes, it will use Interface's attribute.
Observer.__index = Observer

function Observer:collide(pos, size)
    local a = math.abs(pos.x - self.x)
    local b = math.abs(pos.y - self.y)
    local h = math.sqrt(math.pow(a, 2) + math.pow(b, 2)) -- hypothenuse with represent the distance between the two circles
    if h - self.half - size / 2 < 0 then
        return true
    else
        return false
    end
end
