function Startup(spaceship, asteroid)
    require("sources/startup/window")
    require("sources/objects/player")
    require("sources/objects/enemys")

    GameWindow = Window:new()
    love.window.setFullscreen(true)
    GamePlayer = Player:new(960, 540, 600, 50, spaceship)
    GameEnemys = Enemys:new()
    GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, asteroid)
    GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, asteroid)
    GameEnemys:addEnemy({x = GamePlayer.x, y = GamePlayer.y}, asteroid)
end