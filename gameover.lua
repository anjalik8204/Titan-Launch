
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

 local function gotoMenu()
    print ("go to menu")
    -- composer:removeScene ("gameover")
    -- composer:removeScene ("menu")
 
     --composer.gotoScene("game") -- {time=500, effect = "crossFade"})  
    -- local currScene=composer.getSceneName("main")
     composer.gotoScene ("main")
end 


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
  
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local background = display.newImageRect("background.png", 2000, 2000)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    endgameText = display.newText( "GAME OVER", display.contentCenterX, 350, native.systemFont, 100)

    
     menuButton = display.newText( " Reload to Play Again", display.contentCenterX, 730, native.systemFont, 50)
    menuButton:addEventListener("tap", gotoMenu)
   --    composer.gotoScene("menu")
    -- menuButton:toFront()
 end
 --menuButton = display.newText( "Play Again", display.contentCenterX, 730, native.systemFont, 50)
 --menuButton:addEventListener("tap", gotoMenu)
 

-- show()
function scene:show( event )

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

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene

