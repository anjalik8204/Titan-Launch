

local composer = require( "composer" )

 scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--local function totalGame()





	   --composer.gotoScene("gameover", {time = 1000, effect = "crossFade"})
	--end
  

	local physics = require( "physics" )
	physics.start()
	physics.setGravity(0, 0)
	math.randomseed( os.time())
	local gameLoopTimer
	local orbitalTime
	
	local background = display.newImageRect("background.png", 2000, 2000 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	local bPlanet = display.newImageRect("planet13.png",  1800, 1000 )
	bPlanet.x = display.contentCenterX
	bPlanet.y =  1000
	
	local tPlanet = display.newImageRect("planet13.png", 1800, 1000, 15 )
	tPlanet.x = 500
	tPlanet.y = 300
	

	local function updateScore()
		displayScore.text = "score:"..score
	end

	local anchorX = bPlanet.x 
	local anchorY = bPlanet.y
	local changeX = 0
	local changeY = 0
	local t = 0
	local tanX
	local tanY
	score = 0 
	local died = false

	displayScore = display.newText("your score : "..score, 300, 100, native.systemFont, 50)
	
	local rocket = display.newCircle( 500, 700, 25)
	rocket.x = display.contentCenterX
	rocket.y = display.contentCenterY
	rx=rocket.x
	ry=rocket.y
	physics.addBody(rocket, "dynamic")
	
	local function orbit( event )
	   tanX = changeX
	   tanY = changeY
	   changeX = anchorX + 200 * math.cos(5 * t)
	   changeY = anchorY - 200 * math.sin(5 * t)
	   rocket.x = changeX
	   rocket.y = changeY
	   t = t + 5
	   tanX = changeX - tanX
	   tanY = changeY - tanY
	
	end
	Runtime:addEventListener( "enterFrame", orbit )
	
	local function launch( event )
	   print("launch called")
	   rocket:setLinearVelocity(40 * tanX, 40 * tanY)
	  Runtime:removeEventListener( "enterFrame", orbit)
	  gameLoopTimer = timer.performWithDelay(100, gameLoop, 0)
	 end
	
	 bPlanet:addEventListener("tap", launch)
	 local left = false
	 x1=700
	x2=300
	y1=400
	y2=-50
	 function gameLoop (event)
	
    print("rx="..rocket.x.."ry="..rocket.y.."isLeft="..tostring(left))
	   if (rocket.y >= y2 and rocket.y <= y1  and rocket.x <= x1 and rocket.x >= x2 ) then
		print("entered inside ....rx="..rocket.x.."ry="..rocket.y.."isLeft="..tostring(left))
		  local aPlanet = display.newImageRect("planet13.png", 1800, 1000)
		 aPlanet.x = -10000
		 aPlanet.y = -10000
		 -- aPlanet:toBack()
		  Runtime:addEventListener( "enterFrame", orbit ) 
		  rocket:toFront()
		  if(left == false) then
			print("left=="..tostring(left))
			 aPlanet.x = -200
			  aPlanet.y = -200 
			
		  transition.to( aPlanet, { time = 1500, x = 200, y = 300} )
		  score = score + 10
		  left = true
		  x1=400
			x2=50
			y1=200
			y2=-200
		  --score = score + 10
		  --displayScore:toFront()
		  else
			print("left=="..tostring(left))
			aPlanet = display.newImageRect("planet13.png", 1800, 1000)
			 aPlanet.x = 1000
			 aPlanet.y = -200 
			 transition.to( aPlanet, { time = 1500, x = 500, y = 300} )
			 score = score + 10
			 left = false
			 x1=700
			 x=300
			 y1=400
			 y2=-50
			

			 --score = score + 10
			 --displayScore:toFront()
		  end
		  
		  updateScore()
	
		  timer.pause(gameLoopTimer)
		  display.remove(bPlanet)
		   print("bPlanetx"..tPlanet.x)	
	
		  transition.to( tPlanet, {time = 1500, x = bPlanet.x, y = bPlanet.y} )
		  transition.to( rocket, { time = 1500, x = bPlanet.x, y = bPlanet.y} )
		  tPlanet:addEventListener("tap", launch)
	
		  --bPlanet = tPlanet
		  bPlanet = tPlanet
		  tPlanet = aPlanet 

		 --elseif (rocket.y >= 1000 or rocket.y <= 0 or rocket.x <= -50 or rocket.x >= 900 ) then
		elseif (rocket.y >= 1000 or rocket.y <= 0 or rocket.x <= -50 or rocket.x >= 900 ) then
		  composer.gotoScene("gameover")
	end
	end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
	print("create")
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )
	print("show")
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
	
	end
end


-- hide()
function scene:hide( event )
	print("hide")
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
print("Now this is fine")
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
return scene
