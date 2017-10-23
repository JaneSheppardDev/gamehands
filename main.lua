function love.load()
  gamestate = 0
  caveman = love.graphics.newImage("sprites/caveman.png")
  bg = love.graphics.newImage("sprites/bg.png")
  crosshair = love.graphics.newImage("sprites/crosshair.png")
  floor = love.graphics.newImage("sprites/floor.png")
  cloud1 = love.graphics.newImage("sprites/cloud1.png")
  cloud2 = love.graphics.newImage("sprites/cloud2.png")
  sun = love.graphics.newImage("sprites/sun.png")
  cavemanFastX = -50
  cavemanSlowX = -50
  cavemanX = -50
  cavemanY = 400
end

function love.keyreleased(key)
	if key == "return" and gamestate == 0 then
    gamestate = 3
    cavemanFastX = -50
    cavemanSlowX = -50
    cavemanX = -50
    love.draw()
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
    love.draw()
  end
end

function love.update(dt)
  if gamestate == 2 then -- shop screen

  end
  if gamestate == 3 then -- game screen
    cavemanFastX = cavemanFastX + 2.0
    cavemanSlowX = cavemanSlowX + 0.2
    cavemanX = cavemanX + 0.7
    if (cavemanX > 800 or cavemanFastX > 800 or cavemanSlowX > 800) then
      gamestate = 1
    end
  end
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
    love.graphics.draw(bg)
    love.graphics.draw(floor, 0, 400)
    love.graphics.draw(caveman, cavemanX, cavemanY)
    love.graphics.draw(caveman, cavemanFastX, cavemanY)
    love.graphics.draw(caveman, cavemanSlowX, cavemanY)

  end
  if gamestate == 4 then -- instructions screen
    love.graphics.print("press ESCAPE to go back", 400-80, 400+100)
  end
end