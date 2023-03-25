require("specialTile")

function updatePlayer(self, key, map, index)
    print(index..":"..self.x..","..self.y..","..self.dir)

    map[self.x][self.y] = self.under
    if (key=="up" or key=="e") then
        if map[self.x - 1 * self.dir][self.y] < 4 then
            self.x = self.x - 1 * self.dir
        end
    end
    if (key=="down"  or key=="a") then
        if map[self.x][self.y - 1* self.dir] < 4 then
            self.y = self.y - 1 * self.dir
        end
    end
    if (key=="left" or key=="w") then
        if map[self.x + 1* self.dir][self.y] < 4 then
            self.x = self.x + 1 * self.dir
        end
    end
    if (key=="right" or key=="c") then
        if map[self.x][self.y + 1* self.dir] < 4 then
            self.y = self.y + 1 * self.dir
        end
    end
    self.under = map[self.x][self.y]
    map[self.x][self.y] = 4
    if (self.under == 3) then
        self.dir = self.dir * -1
    end
end

function createPlayer()
    player = {}
    player.x = 2
    player.y = 2
    player.dir = 1
    player.under = 1
    return player
end
