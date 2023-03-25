function love.load()

    love.graphics.setDefaultFilter("nearest", "nearest")
    --Player loading
    player = require("player")
    player1 = createPlayer()
    player2 = createPlayer()
    --Map loading
    myMap = require("mapLoader")
    currentMap = {}
    currentMap[1] = myMap.generateMap("Maps/Lvl1/map", 1)
    currentMap[2] = myMap.generateMap("Maps/Lvl1/mapside", 1)
    separatedTileSet = myMap.makeQuad()
    --Background
    Background = {}
    for i = 1, 33 do
        Background[i] = love.graphics.newImage("Assets/Background/cyberpunk/" .. i - 1 .. ".png")
    end
    time = 0

end

function love.draw()
    local frame = math.floor(time * 10) % 33 + 1
    love.graphics.draw(Background[frame], 0, 0,0,0.67,0.665)
    myMap.Draw(currentMap[1], 304, 112)
    myMap.Draw(currentMap[2], 1280/2 + 304, 112)
end

function love.keypressed(key)
    updatePlayer(player1, key, currentMap[1], 1)
    updatePlayer(player2, key, currentMap[2], 2)
end

function love.update(dt)
    time = time + dt
end