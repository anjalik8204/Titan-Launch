local physics = require( "physics" )
physics.start()
physics.setGravity(0, 0)
math.randomseed( os.time())
local gameLoopTimer
local orbitalTime

local enterScreen = display.newText("Titan.Launch", 300, 700, native.systemFont, 50 )
enterScreen:setFillColor(255, 255, 255)
enterScreen:toFront()

local background = display.newImageRect("background.png", 2000, 2000 )
background.x = display.contentCenterX
background.y = display.contentCenterY

 
local bPlanet = display.newImageRect("planet.png",  500, 400 )
bPlanet.x = display.contentCenterX
bPlanet.y =  1000

local tPlanet = display.newImageRect("planet.png", 500, 400, 15 )
tPlanet.x = 500
tPlanet.y = 300



local anchorX = bPlanet.x 
local anchorY = bPlanet.y
local changeX = 0
local changeY = 0
local t = 0
local tanX
local tanY
local score = 0 
local displayScore = display.newText("your score : "..score, 300, 100, native.systemFont, 50)

local rocket = display.newCircle( 500, 700, 25)
rocket.x = display.contentCenterX
rocket.y = display.contentCenterY
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
 local left = true
 function gameLoop (event)
   if (rocket.y <= 400 and rocket.x <= 700 and rocket.x >= 100 ) then

      local aPlanet = display.newImageRect("planet.png", 500, 400)
     -- aPlanet:toBack()
      Runtime:addEventListener( "enterFrame", orbit ) 
      rocket:toFront()
      if(left == true) then
         aPlanet.x = -200
      aPlanet.y = -200 
      transition.to( aPlanet, { time = 1500, x = 200, y = 300} )
      left = false
      score = score + 10
      displayScore:toFront()
      else
         aPlanet.x = 500
         aPlanet.y = -200 
         transition.to( aPlanet, { time = 1500, x = 500, y = 300} )
         left = true
         score = score + 10
         displayScore:toFront()
      end

      
      timer.pause(gameLoopTimer)
      display.remove(bPlanet)
       print("bPlanetx"..tPlanet.x)
      
      transition.to( tPlanet, {time = 1500, x = bPlanet.x, y = bPlanet.y} )
      transition.to( rocket, { time = 1500, x = bPlanet.x, y = bPlanet.y} )
      tPlanet:addEventListener("tap", launch)
      
      --bPlanet = tPlanet
      bPlanet = tPlanet
      tPlanet = aPlanet 
      
end 

end




