function love.load()
  gamestate = 0
  cavemanImage = love.graphics.newImage("sprites/caveman.png")
  bg = love.graphics.newImage("sprites/bg.png")
  crosshair = love.graphics.newImage("sprites/crosshair.png")
  floor = love.graphics.newImage("sprites/floor.png")
  cloud1 = love.graphics.newImage("sprites/cloud1.png")
  cloud2 = love.graphics.newImage("sprites/cloud2.png")
  sun = love.graphics.newImage("sprites/sun.png")
  
end

function love.keyreleased(key)
	if key == "return" and gamestate == 0 then
    gamestate = 3
    cavemen = {}
    for i=1,20 do
      caveman = {}
      caveman.speed = (love.math.random(3,15)/10)
      caveman.x = - (i*50)
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
  end
  love.draw()
end

function love.draw()
  if gamestate == 0 then
    love.graphics.print("press ENTER to start the game", 400-105, 400+50)
    love.graphics.print("press SPACE to view the instructions", 400-120, 400+75)
    love.graphics.print("press ESCAPE to exit the game", 400-105, 400+100)
  end
  if gamestate == 1 then -- game over screen
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
    love.graphics.draw(crosshair, cursorX-9, cursorY-9)
  end
  if gamestate == 4 then -- instructions screen
    love.graphics.print("press ESCAPE to go back", 400-80, 400+100)
  end
end