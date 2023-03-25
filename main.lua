function love.load()

    love.graphics.setDefaultFilter("nearest", "nearest")
    --Map loading
    myMap = require("mapLoader")
    currentMap = myMap.generateMap("Maps/Lvl1/map", 1)
    separatedTileSet = myMap.makeQuad()
    --Background
    Background = {}
    for i = 1, 33 do
        Background[i] = love.graphics.newImage("Assets/Background/cyberpunk/" .. i - 1 .. ".png")
    end
    time = 0
end

function love.draw()
    frame = 1 + math.floor(time * 10) % 32
    love.graphics.draw(Background[frame], 0, 0, 0, 0.67, 0.665, 0, 0)
    myMap.Draw(currentMap, 304, 112)
    myMap.Draw(currentMap, 1280/2 + 304, 112)
end

function love.update(dt)
    time = time + dt
end