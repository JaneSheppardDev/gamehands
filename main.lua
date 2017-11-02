function love.load()
  gamestate = 0
  cavemanImage = love.graphics.newImage("sprites/caveman.png")
  bg = love.graphics.newImage("sprites/bg.png")
  crosshair = love.graphics.newImage("sprites/crosshair.png")
  floor = love.graphics.newImage("sprites/floor.png")
  cloud1 = love.graphics.newImage("sprites/cloud1.png")
  cloud2 = love.graphics.newImage("sprites/cloud2.png")
  sun = love.graphics.newImage("sprites/sun.png")
  score = 0
end

function love.keyreleased(key)
	if key == "return" and gamestate == 0 then
    gamestate = 3
    score = 0
    cavemen = {}
    for i=1,25 do
      caveman = {}
      caveman.speed = (love.math.random(3,15)/10)
      caveman.x = - (i*25)
      caveman.y = love.math.random(400,550)
      caveman.width = 22
      caveman.height = 26
      table.insert(cavemen,caveman)
    end
    love.draw()
    love.mouse.setVisible(false)
	end
  if key == "space" and gamestate == 0 then
    gamestate = 4
    love.draw()
	end
  if key == "escape" and gamestate == 0 then
    love.event.quit()
  end
  if key == "escape" and (gamestate == 4 or gamestate == 3 or gamestate == 1) then
    gamestate = 0
    love.mouse.setVisible(true)
    love.draw()
  end
end

function love.mousereleased(x, y, button)
  local remEnemy = {}
  if gamestate == 3 then
    if button == 1 then
      for i,v in pairs(cavemen) do
        if collisionHead(x,y,v.x,v.y) then
          table.remove(cavemen, i)
          score = score + 1
        elseif collisionBody(x,y,v.x,v.y) then
          table.remove(cavemen, i)
          score = score + 1
        end
      end
    end
  end
end

function love.update(dt)
  if gamestate == 2 then -- shop screen

  end
  if gamestate == 3 then -- game screen
    for i,v in ipairs(cavemen) do
      v.x = v.x + v.speed
      if (v.x > 800) then
        gamestate = 1
      end
    end
    if score == 25 then
      gamestate = 1
    end  
  end
  love.draw()
end

function collisionBody(ax,ay,bx,by)
  return ax < bx + 4 + 18 and ax + 2 > bx and ay < by + 14 + 12 and ay + 2 > by
end 

function collisionHead(ax,ay,bx,by)
  return ax < bx + 5 + 16 and ax + 2 > bx and ay < by + 14 and ay + 2 > by
end 

function love.draw()
  if gamestate == 0 then
    love.graphics.print("press ENTER to start the game", 400-105, 400+50)
    love.graphics.print("press SPACE to view the instructions", 400-120, 400+75)
    love.graphics.print("press ESCAPE to exit the game", 400-105, 400+100)
  end
  if gamestate == 1 then -- game over screen
    if score == 25 then
      love.graphics.print("you win", 400-24, 400-100)
    else
      love.graphics.print("you lose", 400-27, 400-100)
    end
    love.graphics.print("press ESCAPE to go back", 400-80, 400+100)
  end
  if gamestate == 2 then -- shop screen
    
  end
  if gamestate == 3 then -- game screen
    local cursorX = love.mouse.getX()
    local cursorY = love.mouse.getY()
    love.graphics.draw(bg)
    love.graphics.draw(floor, 0, 400)
    for i,v in ipairs(cavemen) do
      love.graphics.draw(cavemanImage, v.x, v.y)
    end
    love.graphics.print("Score:"..score,730,10)
    love.graphics.draw(crosshair, cursorX-9, cursorY-9)
  end
  if gamestate == 4 then -- instructions screen
    love.graphics.print("press ESCAPE to go back", 400-80, 400+100)
  end
end