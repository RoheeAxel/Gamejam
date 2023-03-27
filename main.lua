require("game")
require("menu")

function love.load()
    --Menu
    menus = { "play", "option", "quit" }
    game_state = 'loading'
    selected_menu_item = 1
    title = love.graphics.newImage("Assets/Menu/title2.png")
    button_play = love.graphics.newImage("Assets/Menu/buttonPlay2.png")
    button_option = love.graphics.newImage("Assets/Menu/gear.png")
    button_close = love.graphics.newImage("Assets/Menu/close.png")
    window_width, window_height = love.graphics.getDimensions()
    local font = love.graphics.setNewFont(20)
    font_height = font:getHeight()
    --Game
    love.graphics.setDefaultFilter("nearest", "nearest")
    --Player loading
    player = require("player")
    player1 = createPlayer()
    player2 = createPlayer()
    --Map loading
    myMap = require("mapLoader")
    currentMap = {}
    currentMap[1] = {}
    currentMap[1][1] = myMap.generateMap("Maps/Lvl1/level-a", 1)
    currentMap[1][2] = myMap.generateMap("Maps/Lvl1/level-a", 1)
    currentMap[1].color = {1, 1, 1}
    currentMap[2] = {}
    currentMap[2][1] = myMap.generateMap("Maps/Lvl2/level-a", 1)
    currentMap[2][2] = myMap.generateMap("Maps/Lvl2/level-b", 1)
    currentMap[2].color = {1, 0, 1}
    currentMap[3] = {}
    currentMap[3][1] = myMap.generateMap("Maps/Lvl3/level-a", 1)
    currentMap[3][2] = myMap.generateMap("Maps/Lvl3/level-b", 1)
    currentMap[3].color = {0, 1, 0}
    currentMap[4] = {}
    currentMap[4][1] = myMap.generateMap("Maps/Lvl4/level-a", 1)
    currentMap[4][2] = myMap.generateMap("Maps/Lvl4/level-b", 1)
    currentMap[4].color = {1, 1, 0}
    -- currentMap[5] = {}
    -- currentMap[5][1] = myMap.generateMap("Maps/Lvl5/level-a", 1)
    -- currentMap[5][2] = myMap.generateMap("Maps/Lvl5/level-b", 1)
    separatedTileSet = myMap.makeQuad()
    spawnPlayer(currentMap[1][1], player1)
    spawnPlayer(currentMap[1][2], player2)
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
    TVopening = {}
    for i = 1, 60 do
        TVopening[i] = love.graphics.newImage("Assets/opening/" .. i - 1 .. ".png")
    end
    --Musics
    Musics = require("musics")
    Musics = createMusics()
    --Font
    font1 = love.graphics.newFont("Assets/font.ttf", 40)
    --Neon
    neon = {}
    neon[1] = {}
    neon[1][1] = love.graphics.newImage("Assets/Neon/Ciceris1.png")
    neon[1][2] = love.graphics.newImage("Assets/Neon/Ciceris2.png")
    neon[1][3] = love.graphics.newImage("Assets/Neon/Ciceris3.png")
    neon[2] = {}
    neon[2][1] = love.graphics.newImage("Assets/Neon/grogus1.png")
    neon[2][2] = love.graphics.newImage("Assets/Neon/grogus2.png")
    neon[2][3] = love.graphics.newImage("Assets/Neon/grogus3.png")
    neon[3] = {}
    neon[3][1] = love.graphics.newImage("Assets/Neon/Nami1.png")
    neon[3][2] = love.graphics.newImage("Assets/Neon/Nami2.png")
    neon[3][3] = love.graphics.newImage("Assets/Neon/Nami3.png")
end

function love.update(dt)
    if isLoaded ~= 112 then
        Background[isLoaded] = love.graphics.newImage("Assets/frames/background-cyberpunk/" .. isLoaded - 1 .. ".png")
        isLoaded = isLoaded + 1
    end
    if game_state == 'game' then
        update_game(dt)
    end
    time = time + dt
end

function love.draw()
    frame = math.floor(time * 10) % 111 + 1
    if game_state ~= 'game' then
        draw_menu()
    else
        draw_game(frame, player1.lvl)
    end
end

function love.keypressed(key, scan_code, is_repeat)
    if game_state == 'menu' then
        menu_keypressed(key)
    elseif game_state == 'option' then
        option_keypressed(key)
    else
        game_keypressed(key)
    end
end

function menu_keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'up' then
        selected_menu_item = selected_menu_item - 1
        if selected_menu_item < 1 then
            selected_menu_item = #menus
        end
    elseif key == 'down' then
        selected_menu_item = selected_menu_item + 1
        if selected_menu_item > #menus then
            selected_menu_item = 1
        end
    elseif key == 'return' or key == 'kpenter' then
        if menus[selected_menu_item] == 'play' then
            game_state = 'game'
        elseif menus[selected_menu_item] == 'option' then
            game_state = 'option'
        elseif menus[selected_menu_item] == 'quit' then
            love.event.quit()
        end
    end
end

function option_keypressed(key)
    if key == 'escape' and game_state ~= 'loading' then
        game_state = 'menu'
    end
end
