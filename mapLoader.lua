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
  stackLine=image:getWidth()/map.tilesets[1].tilewidth
  for j=1,16 do

    environement[j] = {}

    for i=1,33 do
        environement[j][i]=love.graphics.newQuad(
        (i-1)%(stackLine)*map.tilesets[1].tilewidth,
        math.floor(i/(stackLine +1))*map.tilesets[1].tilewidth + j * 96,map.tilesets[1].tilewidth,map.tilesets[1].tilewidth,image:getWidth(),image:getHeight())
    end
  end
  return environement
end

function Draw(tab, x, y)

  love.graphics.setColor(58 / 255, 18 / 255, 59 / 255)
  love.graphics.rectangle("fill", x + 16, y + 160, 304, 800)
  love.graphics.setColor(71 / 255, 46 / 255, 98 / 255)
  love.graphics.rectangle("fill", x + 16, y + 160, -304, 800)
  love.graphics.setColor(1,1,1)

  for i = 1,map.layers[1].width do
    for j = 1,map.layers[1].height do
      stackLine=image:getWidth()/map.tilesets[1].tilewidth
      id=tab[i][j]
      if id>0 and id~=nil then
        local xpos = 16*j- 16*i
        local ypos = 8*i+ 8*j
        if id >= 4 then
          ypos = ypos - 16
        end
        my_frame = math.floor((frame)/4) % 15 + 1
        if (id > 23) then
            love.graphics.draw(image,environement[1][1],xpos + x,ypos + y)
        end
        love.graphics.draw(image,environement[my_frame][id],xpos + x,ypos + y)
      end
    end
  end
end



M.generateMap=generateMap
M.makeQuad=makeQuad
M.Draw=Draw
return M
