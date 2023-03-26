function draw_game(frame, i)
    love.graphics.draw(Background[frame], 0, 0, 0, 1, 1)
    love.graphics.draw(Background[frame], 1168 * 2, 0, 0, -1, 1)
    print(i)
    if table.getn(currentMap) < i then
        game_state = 'menu'
        player1.lvl = 1
        player2.lvl = 1
        time = 0
        return
    end
    myMap.Draw(currentMap[i][1], 304, 256)
    myMap.Draw(currentMap[i][2], 1280/2 + 304, 256)
    if Musics.time ~= 0 then
        Musics.actualtime = time - Musics.time
        love.graphics.setColor(1,0,0)
        love.graphics.setFont(font1)
        love.graphics.print((math.floor(Musics.actualtime / 60)) .. ":" .. (math.floor(Musics.actualtime % 60))..':'..(math.floor(Musics.actualtime *100 %100)), 1100, 10)
        love.graphics.setColor(1,1,1)
    end
    neonFrame = math.floor(time) % 3 + 1
    love.graphics.draw(neon[1][neonFrame] , 40, 512, 0, 1, 1)
    love.graphics.draw(neon[1][neonFrame] , 120, 600, 0, 1, 1)
    love.graphics.draw(neon[2][neonFrame], 304 + 50, 550, 0, 1, 1)
    love.graphics.draw(neon[2][neonFrame], 304 + 180, 650, 0, 1, 1)
    love.graphics.draw(neon[3][neonFrame], 1280/2 + 380, 512, 0, 1, 1)
    love.graphics.draw(neon[1][neonFrame] , 1280/2 + 40, 600, 0, 1, 1)

end

function game_keypressed(key)
    if key == 'escape' and game_state ~= 'loading' then
        game_state = 'menu'
    end
    updatePlayer(player1, key, currentMap[player1.lvl][1], 1)
    updatePlayer(player2, key, currentMap[player2.lvl][2], 2)
    updateMusic(Musics, key, time)
end

function update_game(dt)
    time = time + dt
    if player1.under == 4 and player2.under == 4 then
       currentMap[player1.lvl][1][player1.x][player1.y] = 4
       currentMap[player2.lvl][2][player2.x][player2.y] = 4
       player1.lvl = player1.lvl + 1
       player2.lvl = player1.lvl
       player1.under = 0
       player2.under = 0
       player1.x = 2
       player1.y = 2
       player2.x = 2
       player2.y = 2
    end
end
