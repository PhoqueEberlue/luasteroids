function love.load()
    require("sources/startup/startup")
    GameEnvironment = Startup()
    GameEnvironment.window.setFullScreen()
    --GameEnvironment.enemys:addCustomEnemy(50, 0, GameEnvironment.player:getPos(), 500, 500)
    Hp = 100
    Tmp = 0
end

function love.update(dt)
    GameEnvironment:update(dt)
end

function love.draw()
    GameEnvironment:draw()
    love.graphics.print(Hp)
    love.graphics.print(tostring(love.timer.getFPS()), 1890, 0)
end
