Observer = {} -- if an attribute isn't redefined in impleted classes, it will use Interface's attribute.
Observer.__index = Observer

function Observer:collide(player_pos, player_size)
    local half = player_size / 2
    if player_pos.x + half > self.x - self.half and player_pos.x - half < self.x + self.half then
        if player_pos.y + half > self.y - self.half and player_pos.y - half < self.y + self.half then
            return true
        end
    end
    return false
end
