local menus = { "play", "option", "quit" }
local selected_menu_item = 1
local window_width
local window_height
local font_height

require("game")

function love.load()
    --Menu
    game_state = 'menu'
    title = love.graphics.newImage("Assets/Menu/title.png")
    button_play = love.graphics.newImage("Assets/Menu/buttonPlay.png")
    button_option = love.graphics.newImage("Assets/Menu/gear.png")
    button_close = love.graphics.newImage("Assets/Menu/close.png")
    window_width, window_height = love.graphics.getDimensions()
    local font = love.graphics.setNewFont(30)
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
    Background = {}
    for i = 1, 33 do
        Background[i] = love.graphics.newImage("Assets/Background/cyberpunk/" .. i - 1 .. ".png")
    end
    time = 0
    --Musics
    Musics = require("musics")
    Musics = createMusics()
end

function love.update(dt)
    if game_state == 'game' then
        update_game(dt)
    end
end

function love.draw()
    if game_state == 'menu' then
        draw_menu()
    elseif game_state == 'option' then
        draw_option()
    else
        draw_game()
    end
end

function draw_menu()
    local vertical_center = window_height / 2

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
    love.graphics.printf("option", 0, window_height / 2 - font_height / 2, window_width, 'center')
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
    if key == 'escape' then
        game_state = 'menu'
    end
end
