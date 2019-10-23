-- local earth = math.random(3)


-- local planetTable = {}

-- local function qwerty () 
--     local planet = display.newImageRect( "planet.png", 112, 112 )
--     table.insert(planetTable, planet)

--     local planet 2 = display.newImageRect("planet 2.png", 112, 112)
--     table.insert(planetTable, planet 2)

--     local planet 3 = display.newImageRect("planet 3.png", 112, 112)
--     table.insert(planetTable, planet 3)


-- end

-- local function createplanets()
    
--  if earth == 1 then 
--     local planet = display.newImageRect( "planet.png", 550, 550 )
--     planet.x = display.contentCenterX + 200
--     planet.y = display.contentCenterY - 600

--  elseif earth == 2 then 
--     local planet 2 = display.newImageRect("planet 2.png", 550, 550)
--     planet 2.x = display.contentCenterX 
--     planet 2.y = display.contentCenterY + 600
 

--  elseif earth == 3 then 
--     local planet 3 = display.newImageRect("planet 3.png", 550, 550)
--     planet 3.x = display.contentCenterX - 300
--     planet 3.y = display.contentCenterY - 600
 
--  end 
-- end 

-- qwerty()
-- createplanets()

-- local Rocket = display.newImageRect("Rocket.png", 112, 112 )
-- Rocket.x = display.contentCenterX
-- Rocket.y = display.contentCenterY
  local planet = display.newImageRect( "planet.png", 112, 112 )

 local physics = require("physics")
 physics.start()
 physics.setGravity( 0, 0 )
 math.randomseed( os.time() )

 -- Set radial gravity simulation values
local fieldRadius = 100
local fieldPower = 0.4

 local field = display.newCircle( display.contentCenterX, display.contentCenterY, fieldRadius )
field.alpha = 0.2
 
-- Add physical body (sensor) to field
physics.addBody( field, "static", { isSensor=true, radius=fieldRadius } )

local function collideWithField( self, event )
 
   local objectToPull = event.other

   if ( event.phase == "began" and objectToPull.touchJoint == nil ) then

       -- Create touch joint after short delay (10 milliseconds)
       timer.performWithDelay( 10,
           function()
               -- Create touch joint
               objectToPull.touchJoint = physics.newJoint( "touch", objectToPull, objectToPull.x, objectToPull.y )
               -- Set physical properties of touch joint
               objectToPull.touchJoint.frequency = fieldPower
               objectToPull.touchJoint.dampingRatio = 0.0
               -- Set touch joint "target" to center of field
               objectToPull.touchJoint:setTarget( self.x, self.y )
           end
       )
      elseif ( event.phase == "ended" and objectToPull.touchJoint ~= nil ) then
 
         objectToPull.touchJoint:removeSelf()
         objectToPull.touchJoint = nil
   end
end
field.collision = collideWithField
field:addEventListener( "collision" )
 
for i = 1,5 do
 
   local object = display.newCircle( 100, (i*50)+10, 10 )
   physics.addBody( object, { radius=10 } )

   local velocity = math.random( 80, 120 )
   object:setLinearVelocity( velocity, 0 )
end