function Startup()
    require("sources/startup/environment")
    require("sources/startup/window")
    require("sources/objects/player")
    require("sources/objects/enemys")

    local images = LoadImages()

    return Environment:new(
        Player:new(960, 540, 600, 50, images.spaceship_img),
        Enemys:new(images.asteroids),
        Window:new()
    )
end

function LoadImages()
    local images = {}
    images.asteroids = {}
    local spaceship = love.graphics.newImage("sources/img/spaceship.png")
    local asteroid_50 = love.graphics.newImage("sources/img/asteroid_50.png")
    local asteroid_100 = love.graphics.newImage("sources/img/asteroid_100.png")
    images.spaceship_img = spaceship
    images.asteroids.asteroid_50_img = asteroid_50
    images.asteroids.asteroid_100_img = asteroid_100
    return images
end