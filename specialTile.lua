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
