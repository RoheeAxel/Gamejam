function love.load()

    --Map loading
    myMap = require("mapLoader") 
    mapsTileSet = love.graphics.newImage("Assets/Atlas/lvl1.png")
    currentMap = myMap.generateMap("Maps/Lvl1/map", 1)
    separatedTileSet = myMap.makeQuad()
end

function love.draw()
    myMap.Draw(currentMap, mapsTileSet, 0, 112)
    myMap.Draw(currentMap, mapsTileSet, 1280-32*19, 112)
end

function love.update(dt)
end