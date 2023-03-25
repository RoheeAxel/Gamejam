function updatePlayer(self, key, map)
    map[self.x][self.y] = self.under
    if (key=="up" or key=="e") then
        if map[self.x - 1][self.y] < 4 then
            self.x = self.x - 1
        end
    end
    if (key=="down"  or key=="a") then
        if map[self.x][self.y - 1] < 4 then
            self.y = self.y - 1
        end
    end
    if (key=="left" or key=="w") then
        if map[self.x + 1][self.y] < 4 then
            self.x = self.x + 1
        end
    end
    if (key=="right" or key=="c") then
        if map[self.x][self.y + 1] < 4 then
            self.y = self.y + 1
        end
    end
    self.under = map[self.x][self.y]
    map[self.x][self.y] = 4
end

function createPlayer()
    player = {}
    player.x = 2
    player.y = 2
    player.under = 1
    return player
end
