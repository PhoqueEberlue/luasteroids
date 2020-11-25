function Chose(item1, item2)
    if love.math.random() < 0.5 then
        return item1
    else
        return item2
    end
end

function Trajectory(pos1, pos2, size1, size2, speed)
    print(size2)
    local ratio = 0
    local res = 0
    local xplus = true
    local yplus = true
    local resx = (pos1.x + math.floor(size1/2)) - (pos2.x + math.floor(size2/2))
    local resy = (pos1.y + math.floor(size1/2)) - (pos2.y + math.floor(size2/2))
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
        res = {x = speed, y = math.abs(speed * ratio)}
        if xplus then
            res.x = -res.x
        end
        if yplus then
            res.y = -res.y
        end
    else
        ratio = resx / resy
        res = {x = math.abs(speed * ratio), y = speed}
        if xplus then
            res.x = -res.x
        end
        if yplus then
            res.y = -res.y
        end
    end
    return res
end