local title = love.graphics.newImage("title.png")
local button_play = love.graphics.newImage("buttonPlay.png")
local button_option = love.graphics.newImage("gear.png")
local button_close = love.graphics.newImage("close.png")
local game_state = 'menu'
local menus = { "play", "option", "quit" }
-- local background = love.graphics.newImage("bg.jpg")
local selected_menu_item = 1
local window_width
local window_height
local font_height

local draw_menu
local menu_keypressed
local draw_how_to_play
local how_to_play_keypressed
local draw_game
local game_keypressed

function love.load()
    window_width, window_height = love.graphics.getDimensions()
    local font = love.graphics.setNewFont(30)
    font_height = font:getHeight()
end

function love.update(dt)
    if game_state == 'game' then
    end
end

function love.draw()
    -- love.graphics.draw(background, 0, 0)
    if game_state == 'menu' then
        draw_menu()
    elseif game_state == 'option' then
        draw_how_to_play()
    else
        draw_game()
    end
end

function draw_menu()
    local horizontal_center = window_width / 2
    local vertical_center = window_height / 2
    local start_y = vertical_center - (font_height * (#menus / 2))

    -- scale the button play if it is selected or hover
    if selected_menu_item == 1 then
        -- love.graphics.clear()
        love.graphics.draw(button_play, 225, 275, 0, 0.7, 0.7)
        love.graphics.draw(button_option, 740, 10, 0, 0.1, 0.1)
        love.graphics.draw(button_close, 740, 540, 0, 0.3, 0.3)
        love.graphics.draw(title, vertical_center / 2, 70, 0, 1, 1)
    end
    -- scale the button option if it is selected or hover
    if selected_menu_item == 2 then
        -- love.graphics.clear()
        love.graphics.draw(button_play, 250, 300, 0, 0.6, 0.6)
        love.graphics.draw(button_option, 700, 20, 0, 0.15, 0.15)
        love.graphics.draw(button_close, 740, 540, 0, 0.3, 0.3)
        love.graphics.draw(title, vertical_center / 2, 70, 0, 1, 1)
    end
    -- scale the button quit if it is selected or hover
    if selected_menu_item == 3 then
        -- love.graphics.clear()
        love.graphics.draw(button_play, 250, 300, 0, 0.6, 0.6)
        love.graphics.draw(button_option, 740, 10, 0, 0.1, 0.1)
        love.graphics.draw(button_close, 740, 540, 0, 0.35, 0.35)
        love.graphics.draw(title, vertical_center / 2, 70, 0, 1, 1)
    end
end

function draw_how_to_play()
    love.graphics.printf("option", 0, window_height / 2 - font_height / 2, window_width, 'center')
end

function draw_game()
    love.graphics.printf("GAME HERE", 0, window_height / 2 - font_height / 2, window_width, 'center')
end

function love.keypressed(key, scan_code, is_repeat)
    if game_state == 'menu' then
        menu_keypressed(key)
    elseif game_state == 'option' then
        how_to_play_keypressed(key)
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

function how_to_play_keypressed(key)
    if key == 'escape' then
        game_state = 'menu'
    end
end

function game_keypressed(key)
    if key == 'escape' then
        game_state = 'menu'
    end
end
