
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
print("menu:create")
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local function gotoGame()
		print("gotogame...")
		composer.gotoScene("game")
	end
	
	local background = display.newImageRect(sceneGroup, "background.png", 2000, 2000)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    
    local title = display.newImage(sceneGroup,"TitanMenu.png", 1, 80)
    title.x = display.contentCenterX +10
    title.y = 300

    local playButton = display.newText(sceneGroup, "Launch Off", display.contentCenterX, 800, georgia, 70)
    playButton:setFillColor(0.82,0.86,1)
    --nativeFontSystem
   -- local highScoresButton = display.newText(sceneGroup, "High Scores", display.contentCenterX, 910, native.nativeFontSystem, 54)
    -- highScoresButton:setFillColor(0.75, 0.78, 1)
	print("hai how are you")
	playButton:addEventListener("tap", gotoGame)
end


-- show()
function scene:show( event )
	print("menu:show")
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
	print("menu:hide")
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
	print("menu:destroy")
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
