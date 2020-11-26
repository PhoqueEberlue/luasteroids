function Startup(spaceship, asteroid)
    require("sources/startup/environment")
    require("sources/startup/window")
    require("sources/objects/player")
    require("sources/objects/enemys")

    return Environment:new(
        Player:new(960, 540, 600, 50, spaceship),
        Enemys:new(asteroid),
        Window:new()
    )
end