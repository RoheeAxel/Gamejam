M={}

function generateMap(arg,layer)
  map = require(arg)
  tramap={}
  ligne={}
  image=love.graphics.newImage("Assets/Atlas/"..map.tilesets[1].image)
  for i = 1,map.layers[layer].width do
    ligne={}
    for j = 1,map.layers[layer].height do
      table.insert(ligne,map.layers[layer].data[i*map.layers[layer].width-map.layers[layer].width+j])
    end
    table.insert(tramap,ligne)
  end
  return tramap
end

function makeQuad()
  environement={}
  stackLine=image:getWidth()/map.tilesets[1].tilewidth + 1
  for i=1,128 do
    environement[i]=love.graphics.newQuad(i%stackLine*map.tilesets[1].tilewidth-map.tilesets[1].tilewidth,math.floor(i/stackLine)*map.tilesets[1].tilewidth,map.tilesets[1].tilewidth,map.tilesets[1].tilewidth,image:getWidth(),image:getHeight())
  end
  return environement
end

function Draw(tab, texture, x, y)
  for i = 1,map.layers[1].width do
    for j = 1,map.layers[1].height do
      stackLine=texture:getWidth()/map.tilesets[1].tilewidth
      id=tab[i][j]
      if id>0 and id~=nil then
        love.graphics.draw(texture,environement[id],j*map.tilesets[1].tilewidth-map.tilesets[1].tilewidth-1 + x,i*map.tilesets[1].tilewidth-map.tilesets[1].tilewidth-1 + y)
      end
    end
  end
end



M.generateMap=generateMap
M.makeQuad=makeQuad
M.Draw=Draw
return M