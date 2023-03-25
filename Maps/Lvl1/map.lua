return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.3",
  orientation = "orthogonal",
  renderorder = "left-down",
  width = 19,
  height = 19,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "lvl1",
      firstgid = 1,
      filename = "tile.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "lvl1iso.png",
      imagewidth = 128,
      imageheight = 128,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 16,
      tiles = {}
    },
    {
      name = "tile",
      firstgid = 17,
      filename = "tile.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../../Code/Lua/cybepunk/autumn.png",
      imagewidth = 32,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 8,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Calque de Tile 1",
      x = 0,
      y = 0,
      width = 19,
      height = 19,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        5, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
        7, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 1, 7, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 25, 25, 25, 25, 25, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 25, 25, 25, 25, 25, 25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7,
        7, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 1
      }
    }
  }
}
