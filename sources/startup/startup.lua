function Startup(spaceship)
    require("sources/startup/window")
    require("sources/objects/player")
    require("sources/objects/enemys")

    GameWindow = Window:new()
    love.window.setFullscreen(true)
    GamePlayer = Player:new(960, 540, 20, 50, spaceship)
    GameEnemys = Enemys:new()
    GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, GamePlayer.size)
    GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, GamePlayer.size)
    GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, GamePlayer.size)
end