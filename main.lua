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
    -- Background
    Background = {}
    isLoaded = 1
    time = 0
    Waterfall = {}
    for i = 1, 3 do
        Waterfall[i] = love.graphics.newImage("Assets/waterfall/" .. i - 1 .. ".png")
    end
    Waterfall[4] = love.graphics.newImage("Assets/waterfall/2.png")
    Waterfall[5] = love.graphics.newImage("Assets/waterfall/0.png")
    --Musics
    Musics = require("musics")
    Musics = createMusics()

end

function love.draw()
    local frame = math.floor(time * 10) % 111 + 1

    -- Game draw here
    if isLoaded == 112 then
        love.graphics.draw(Background[frame], 0, 0, 0, 1, 1)
        love.graphics.draw(Background[frame], 1168 * 2, 0, 0, -1, 1)
        myMap.Draw(currentMap[1], 304, 112)
        myMap.Draw(currentMap[2], 1280/2 + 304, 112)
    elseif isLoaded ~= 112 then
        love.graphics.draw(Waterfall[math.floor(frame % 4) + 1], 440, 0, 0, 1, 1)
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", 320, 720 / 2 + 100, 640, 15)
        love.graphics.setColor(236 / 256, 89 / 256, 233 / 256)
        love.graphics.rectangle("fill", 320, 720 / 2 + 100, 640 * (isLoaded / 112), 15)
        local loadingText = string.format("Loading sick background... %d%%", isLoaded / 112 * 100)
        love.graphics.print(loadingText, 550, 720 / 2 + 150)
        love.graphics.setColor(1, 1, 1)
    end
end

function love.keypressed(key)
    updatePlayer(player1, key, currentMap[1], 1)
    updatePlayer(player2, key, currentMap[2], 2)
    updateMusic(Musics, key)
end

function love.update(dt)
    time = time + dt
    if isLoaded ~= 112 then
        Background[isLoaded] = love.graphics.newImage("Assets/frames/background-cyberpunk/" .. isLoaded - 1 .. ".png")
        isLoaded = isLoaded + 1
    end
end
