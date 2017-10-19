function love.load()
  gamestate = 0
end

function love.keyreleased(key)
	if key == "return" and gamestate == 0 then
    gamestate = 3
    love.draw()
	end
  if key == "space" and gamestate == 0 then
    gamestate = 4
    love.draw()
	end
  if key == "escape" and gamestate == 0 then
    love.event.quit()
  end
  if key == "escape" and (gamestate == 4 or gamestate == 3) then
    gamestate = 0
    love.draw()
  end
end

function love.update(dt)
  if gamestate == 0 then -- title screen
    
  end
  if gamestate == 1 then -- game over screen
    
  end
  if gamestate == 2 then -- shop screen
    
  end
  if gamestate == 3 then -- game screen
    
  end
  if gamestate == 4 then -- instructions screen
    
  end
end

function love.draw()
  if gamestate == 0 then
    love.graphics.print("press ENTER to start the game", 400-105, 400+50)
    love.graphics.print("press SPACE to view the instructions", 400-120, 400+75)
    love.graphics.print("press ESCAPE to exit the game", 400-105, 400+100)
  end
  if gamestate == 1 then -- game over screen
    
  end
  if gamestate == 2 then -- shop screen
    
  end
  if gamestate == 3 then -- game screen
    
  end
  if gamestate == 4 then -- instructions screen
    love.graphics.print("press ESCAPE to go back", 400-80, 400+100)
  end
end