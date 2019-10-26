local composer = require("composer")

display.setStatusBar(display.HiddenStatusBar)

math.randomseed(os.time())

composer.gotoScene("menu")




-- -- Generating planets at 3  specific locations



-- local earth = math.random(3)


-- local planetTable = {}

-- local function qwerty () 
--     local planet1 = display.newImageRect( "planet1.png", 100, 100 )
--     table.insert(planetTable, planet)
    

--     local planet2 = display.newImageRect("planet2.png", 100, 100)
--     table.insert(planetTable, planet2)
    

--     local planet3 = display.newImageRect("planet3.png", 100, 100)
--     table.insert(planetTable, planet3)
    

-- end

-- local function createplanets()
    
--  if earth == 1 then 
--     local planet1 = display.newImageRect( "planet1.png", 850, 500 )
--     planet1.x = display.contentCenterX + 30
--     planet1.y = display.contentCenterY + 250
    

--      elseif earth == 2 then 
--     local planet2 = display.newImageRect("planet2.png", 900, 500)
--     planet2.x = display.contentCenterX - 80
--     planet2.y = display.contentCenterY  + 70
 

--    elseif earth == 3 then 
--     local planet3 = display.newImageRect("planet3.png", 900, 500)
--     planet3.x = display.contentCenterX  + 40
--     planet3.y = display.contentCenterY - 180

-- end

--     if earth==1 then 
--       math.random (2,3)
--     elseif earth == 2 then 
--       math.random(1,3)
--     elseif earth == 3 then
--       math.random(1,2)
--     end
-- end 

--  qwerty()
-- createplanets()


-- -- This is the gravity

-- --  local physics = require("physics")
-- --  physics.start()
-- --  physics.setGravity( 0, 0 )
-- --  math.randomseed( os.time() )

 
-- -- local function gravity ()
-- --     -- Set radial gravity simulation values
-- --    local fieldRadius = 150
-- --    local fieldPower = 0.4
   
-- --     local field = display.newCircle( display.contentCenterX + 200, display.contentCenterY - 600, fieldRadius )
-- --    field.alpha = 0.5
    
-- --    -- Add physical body (sensor) to field
-- --    physics.addBody( field, "static", { isSensor=true, radius=fieldRadius } )
   
-- --    local function collideWithField( self, event )
    
-- --       local objectToPull = event.other
   
-- --       if ( event.phase == "began" and objectToPull.touchJoint == nil ) then
   
-- --           -- Create touch joint after short delay (10 milliseconds)
-- --           timer.performWithDelay( 10,
-- --               function()
-- --                   -- Create touch joint
-- --                   objectToPull.touchJoint = physics.newJoint( "touch", objectToPull, objectToPull.x, objectToPull.y )
-- --                   -- Set physical properties of touch joint
-- --                   objectToPull.touchJoint.frequency = fieldPower
-- --                   objectToPull.touchJoint.dampingRatio = 0.0
-- --                   -- Set touch joint "target" to center of field
-- --                   objectToPull.touchJoint:setTarget( self.x, self.y )
-- --               end
-- --           )
-- --          elseif ( event.phase == "ended" and objectToPull.touchJoint ~= nil ) then

-- --             objectToPull.touchJoint:removeSelf()
-- --             objectToPull.touchJoint = nil
-- --       end
-- --    end
-- --    field.collision = collideWithField
-- --    field:addEventListener( "collision" )
    
-- --    for i = 1,5 do
    
-- --       local object = display.newCircle( 100, (i*50)+10, 10 )
-- --       physics.addBody( object, { radius=10 } )
   
-- --       local velocity = math.random( 80, 120 )
-- --       object:setLinearVelocity( velocity, 0 )
-- --    end
-- --    end
  

-- --   gravity()
