require("game")

function love.load()
    --Menu
    menus = { "play", "option", "quit" }
    game_state = 'loading'
    selected_menu_item = 1
    title = love.graphics.newImage("Assets/Menu/title.png")
    button_play = love.graphics.newImage("Assets/Menu/buttonPlay.png")
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
    currentMap[1] = myMap.generateMap("Maps/Lvl1/map", 1)
    currentMap[2] = myMap.generateMap("Maps/Lvl1/mapside", 1)
    separatedTileSet = myMap.makeQuad()
    --Background
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

    if game_state == 'loading' then
        draw_loading(frame)
    elseif game_state == 'menu' then
        draw_menu()
    elseif game_state == 'option' then
        draw_option()
    else
        draw_game(frame)
    end
end

function draw_loading(frame)
    love.graphics.draw(Waterfall[math.floor(frame % 4) + 1], 440, 80, 0, 1, 1)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 320, 720 / 2 + 100, 640, 15)
    love.graphics.setColor(236 / 256, 89 / 256, 233 / 256)
    love.graphics.rectangle("fill", 320, 720 / 2 + 100, 640 * (isLoaded / 112), 15)
    local loadingText = string.format("Loading sick background... %d%%", isLoaded / 112 * 100)
    love.graphics.print(loadingText, 480, 720 / 2 + 150)
    love.graphics.setColor(1, 1, 1)
    if isLoaded == 112 then
        game_state = 'menu'
    end
end

function draw_menu()
    local vertical_center = window_height / 2

    love.graphics.draw(TVopening[math.floor(frame % 59) + 1], 0, 0, 0, 2.68, 2.85)
    -- put a rectangle size of the window with a opacity
	love.graphics.setColor(0, 0, 0, 0.25)
    love.graphics.rectangle("fill", 0, 0, window_width, window_height, 0, 0, 0, 0.5)
	love.graphics.setColor(1, 1, 1, 1)

    if selected_menu_item == 1 then
        love.graphics.draw(button_play, 430, 320, 0, 0.8, 0.8)
        love.graphics.draw(button_option, 1215, 20, 0, 0.1, 0.1)
        love.graphics.draw(button_close, 1215, 660, 0, 0.3, 0.3)
        love.graphics.draw(title, 390, 70, 0, 1, 1)
    end
    if selected_menu_item == 2 then
        love.graphics.draw(button_play, 460, 350, 0, 0.7, 0.7)
        love.graphics.draw(button_option, 1190, 20, 0, 0.15, 0.15)
        love.graphics.draw(button_close, 1215, 660, 0, 0.3, 0.3)
        love.graphics.draw(title, 390, 70, 0, 1, 1)
    end
    if selected_menu_item == 3 then
        love.graphics.draw(button_play, 460, 350, 0, 0.7, 0.7)
        love.graphics.draw(button_option, 1215, 20, 0, 0.1, 0.1)
        love.graphics.draw(button_close, 1200, 640, 0, 0.4, 0.4)
        love.graphics.draw(title, 390, 70, 0, 1, 1)
    end
end

function draw_option()
    love.graphics.print("Option", 10, 10)
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
