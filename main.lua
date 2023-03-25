function love.load()

    --Player loading
    player = require("player")
    player1 = createPlayer()
    player2 = createPlayer()
    --Map loading
    myMap = require("mapLoader")
    currentMap = {}
    currentMap[1] = myMap.generateMap("Maps/Lvl1/map", 1)
    currentMap[2] = myMap.generateMap("Maps/Lvl1/map", 1)
    separatedTileSet = myMap.makeQuad()
    --Background
    background = love.graphics.newImage("Assets/Background.png")

end

function love.draw()
    love.graphics.draw(background, 0, 0)
    myMap.Draw(currentMap[1], 304, 112)
    myMap.Draw(currentMap[2], 1280/2 + 304, 112)
end

function love.keypressed(key)
    updatePlayer(player1, key, currentMap[1])
    updatePlayer(player2, key, currentMap[2])
end

function love.update(dt)
end