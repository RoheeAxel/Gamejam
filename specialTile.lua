function findOtherTp(map)
    for i = 1, #map do
        for j = 1, #map[i] do
            if map[i][j] == 2 then
                return {i, j}
            end
        end
    end
    return 0
end

function findPlayer(map, player_to_find)
    for i = 1, #map do
        for j = 1, #map[i] do
            if map[i][j] == 11 then
                player_to_find.x = i
                player_to_find.y = j
                return
            end
        end
    end
    player_to_find.x = 2
    player_to_find.y = 2
    map[2][2] = 11
    return
end
