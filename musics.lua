function updateMusic(self, key)
    if (key=="m" or key=="M") then
        self.list[self.indice]:stop()
        self.indice = (1 + (self.indice) % 3)
        self.list[self.indice]:play()
        self.list[self.indice]:setLooping(true)
        self.list[self.indice]:setVolume(0.5)
    end
end

function createMusics()
    Musics = {}
    Musics.list = {}
    Musics.indice = 1
    -- Musics loading
    Musics.list[1] = love.audio.newSource("Assets/Musics/Dissonance.mp3", "stream")
    Musics.list[2] = love.audio.newSource("Assets/Musics/SoulsDepart.mp3", "stream")
    Musics.list[3] = love.audio.newSource("Assets/Musics/gas.mp3", "stream")
    -- Launch Music
    Musics.list[1]:play()
    Musics.list[1]:setLooping(true)
    Musics.list[1]:setVolume(0.5)
    return Musics
end
