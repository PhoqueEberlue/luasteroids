function love.load()
    require("sources/startup/startup")
    GameEnvironment = Startup()
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