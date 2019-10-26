local composer = require("composer")

local scene = composer.newScene()

local function gotoGame()
    composer.gotoScene("game")
end

local function gotoHighScores()
    composer.gotoScene("highscore")
end

function scene:show(event)
 
    local sceneGroup = self.view
    local background = display.newImageRect(sceneGroup, "background.png", 600, 900)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local title = display.newImage(sceneGroup,"gameover2.png", 1, 80)
    title.x

    local playButton = display.newText(sceneGroup, "Launch Off", display.contentCenterX, 700, nativeFontSystem, 50)
    playButton:setFillColor(0.82,0.86,1)

    local highScoresButton = display.newText(sceneGroup, "High Scores", display.contentCenterX, 810, native.nativeFontSystem, 44)
    highScoresButton:setFillColor(0.75, 0.78, 1)

    playButton:addEventListener("tap", gotoGame)
    highScoresButton:addEventListener("tap", gotoHighScores)
end


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

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene