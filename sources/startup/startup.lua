function Startup()
    require("sources/startup/environment")
    require("sources/startup/window")
    require("sources/objects/player")
    require("sources/objects/enemys")

    local images = LoadImages()

    return Environment:new(
        Player:new(960, 540, 600, 50, images.spaceship_img),
        Enemys:new(images.asteroid_img),
        Window:new()
    )
end

function LoadImages()
    local images = {}
    local spaceship = love.graphics.newImage("sources/img/spaceship.png")
    local asteroid = love.graphics.newImage("sources/img/asteroid.png")
    images.spaceship_img = spaceship
    images.asteroid_img = asteroid
    return images
end