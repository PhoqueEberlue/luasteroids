Window = {}
Window.__index = Window

function Window:new()
    local window = {}
    setmetatable(window, Window)
    window.screenWidth = 1920
    window.screenHeight = 1080
    return window
end

function Window:setFullScreen()
    love.window.setFullscreen(true)
end

function Window:getWidth()
    return self.screenWidth
end

function Window:getHeight()
    return self.screenHeight
end

function Window:setWidth(newWidth)
    self.screenWidth = newWidth
end

function Window:setHeight(newHeight)
    self.screenHeight = newHeight
end