function love.load()
    require("sources/startup/startup")
    local spaceship = love.graphics.newImage("sources/img/spaceship.png")
    local asteroid = love.graphics.newImage("sources/img/asteroid.png")
    GameEnvironment = Startup(spaceship, asteroid)
    GameEnvironment.window.setFullScreen()
    Hp = 100
    Tmp = 0
end

function love.update(dt)
    GameEnvironment:update(dt)
end

function love.draw()
    GameEnvironment:draw()
    love.graphics.print(Hp)
end

-- réglage nat https://i.imgur.com/j3DwGVX.png