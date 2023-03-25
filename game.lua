function draw_game()
    local frame = math.floor(time * 10) % 33 + 1
    love.graphics.draw(Background[frame], 0, 0,0,0.67,0.665)
    myMap.Draw(currentMap[1], 304, 256)
    myMap.Draw(currentMap[2], 1280/2 + 304, 256)
end

function game_keypressed(key)
    if key == 'escape' then
        game_state = 'menu'
    end
    updatePlayer(player1, key, currentMap[1], 1)
    updatePlayer(player2, key, currentMap[2], 2)
    updateMusic(Musics, key)
end

function update_game(dt)
    time = time + dt
end
