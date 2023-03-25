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
    currentMap[2] = myMap.generateMap("Maps/Lvl1/map", 1)
    separatedTileSet = myMap.makeQuad()
    -- Background
    Background = {}
    -- for i = 1, 448 / 4, 2 do
    --     Background[i] = love.graphics.newImage("Assets/frames/background-cyberpunk/" .. i - 1 .. ".png")
    -- end
    time = 0
    isLoaded = 1
end

function love.draw()
    local frame = math.floor(time * 10) % 33 + 1

    if isLoaded == 448 / 4 then
        love.graphics.draw(Background[frame], 0, 0,0,1,1)
        love.graphics.draw(Background[frame], 1168 * 2, 0, 0, -1, 1)
        myMap.Draw(currentMap[1], 304, 112)
        myMap.Draw(currentMap[2], 1280/2 + 304, 112)
    elseif isLoaded ~= 448 / 4 then
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 320, 720 / 2 + 100, 640, 15)
        love.graphics.setColor(236 / 256, 89 / 256, 233 / 256)
        love.graphics.rectangle("fill", 320, 720 / 2 + 100, 640 * (isLoaded / (448 / 4)), 15)
    end

    -- love.graphics.draw(Background[frame], 0, 0,0,1,1)
    -- love.graphics.draw(Background[frame], 1168 * 2, 0, 0, -1, 1)
    -- myMap.Draw(currentMap[1], 304, 112)
    -- myMap.Draw(currentMap[2], 1280/2 + 304, 112)
end

function love.keypressed(key)
    updatePlayer(player1, key, currentMap[1])
    updatePlayer(player2, key, currentMap[2])
end

function love.update(dt)
    time = time + dt
    if isLoaded ~= 448 / 4 then
        Background[isLoaded] = love.graphics.newImage("Assets/frames/background-cyberpunk/" .. isLoaded - 1 .. ".png")
        isLoaded = isLoaded + 1
    end
end