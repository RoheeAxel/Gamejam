function love.load()

    --Map loading
    myMap = require("mapLoader") 
    currentMap = myMap.generateMap("Maps/Lvl1/map", 1)
    separatedTileSet = myMap.makeQuad()
    --Background
    background = love.graphics.newImage("Assets/Background.png")
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    myMap.Draw(currentMap, 304, 112)
    myMap.Draw(currentMap, 1280/2 + 304, 112)
end

function love.update(dt)
end