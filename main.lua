function love.load()
    require("sources/startup/startup")
    local spaceship = love.graphics.newImage("spaceship.png")
    Asteroid = love.graphics.newImage("asteroid.png")
    Startup(spaceship, Asteroid)
    Hp = 100
    Tmp = 0
end

function love.update(dt)
    GamePlayer:update(dt)
    if GameEnemys:update(dt, GamePlayer:getPos(), GamePlayer:getSize()) then
        GamePlayer:setHp()
        Hp = Hp - 1
    end
    if Tmp == 60 then
        Tmp = 0
        GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, Asteroid)
    else
        Tmp = Tmp + 1
    end
    if Tmp == 30 then
        GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, Asteroid)
    end
end

function love.draw()
    GamePlayer:draw()
    GameEnemys:draw()
    love.graphics.print(Hp)
end

-- réglage nat https://i.imgur.com/j3DwGVX.png