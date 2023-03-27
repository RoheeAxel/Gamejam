function draw_menu()
    if game_state == 'loading' then
        draw_loading(frame)
    elseif game_state == 'menu' then
        draw_menu_main_screen()
    elseif game_state == 'option' then
        draw_option()
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

function draw_menu_main_screen()
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