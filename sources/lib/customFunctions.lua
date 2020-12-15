function Chose(item1, item2)
    if love.math.random() < 0.5 then
        return item1
    else
        return item2
    end
end

function Trajectory(pos1, pos2, speed)
    local ratio = 0
    local res = 0
    local xplus = true
    local yplus = true
    local resx = pos1.x - pos2.x
    local resy = pos1.y - pos2.y
    if resx < 0 then
        xplus = false
        resx = math.abs(resx)
    end
    if resy < 0 then
        yplus = false
        resy = math.abs(resy)
    end
    if resx > resy then
        ratio = resy / resx
        res = {x = speed, y = math.floor(speed * ratio)}
        if xplus then
            res.x = -res.x
        end
        if yplus then
            res.y = -res.y
        end
    else
        ratio = resx / resy
        res = {x = math.floor(speed * ratio), y = speed}
        if xplus then
            res.x = -res.x
        end
        if yplus then
            res.y = -res.y
        end
    end
    return res
end
