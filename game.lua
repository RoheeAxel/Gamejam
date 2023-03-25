function draw_game(frame)
    love.graphics.draw(Background[frame], 0, 0, 0, 1, 1)
    love.graphics.draw(Background[frame], 1168 * 2, 0, 0, -1, 1)
    myMap.Draw(currentMap[1], 304, 112)
    myMap.Draw(currentMap[2], 1280/2 + 304, 112)
    if Musics.time ~= 0 then
        Musics.actualtime = time - Musics.time
        love.graphics.print("Time : " .. (math.floor(Musics.actualtime / 60)) .. ":" .. (math.floor(Musics.actualtime % 60)), 1100, 10)
    end
end

function game_keypressed(key)
    if key == 'escape' and game_state ~= 'loading' then
        game_state = 'menu'
    end
    updatePlayer(player1, key, currentMap[1], 1)
    updatePlayer(player2, key, currentMap[2], 2)
    updateMusic(Musics, key, time)
end

function update_game(dt)
    time = time + dt
end
