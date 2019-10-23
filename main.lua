-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local physics = require( "physics" )
physics.start()
physics.setGravity(0, 0)

local lengthX
local lengthY
local orbitalTime

local t = 0
local changeX = 0
local changeY = 0
local tempX 
local tempY
local tanX
local tanY

local background = display.newImageRect("background.png", 2000, 2000 )
background.x = display.contentCenterX
background.y = display.contentCenterY


local planet = display.newImageRect("planet.png",   500, 400 )
planet.x = display.contentCenterX
planet.y =  700

local anchorX = planet.x 
local anchorY = planet.y 

local circle = display.newCircle( 500, 700, 25)
circle.x = display.contentCenterX
circle.y = display.contentCenterY
physics.addBody(circle, "dynamic")

local function orbit( event )
   tempX = changeX
   tempY = changeY
   changeX = anchorX + 200 * math.cos(5 * t)
   changeY = anchorY - 200 * math.sin(5 * t)
   circle.x = changeX
   circle.y = changeY
   t = t + 5
   tanX = changeX - tempX
   tanY = changeY - tempY
end

local function launch( event )

    circle:setLinearVelocity(40 * tanX, 40 * tanY)

    Runtime:removeEventListener( "enterFrame", orbit)

end

Runtime:addEventListener( "enterFrame", orbit )

   background:addEventListener("tap", launch)
 
    -- CreateRocket()
 