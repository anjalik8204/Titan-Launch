-- Copyright (c) 2017 Corona Labs Inc.
-- Code is MIT licensed and can be re-used; see https://www.coronalabs.com/links/code/license
-- Other assets are licensed by their creators:
--    Art assets by Kenney: http://kenney.nl/assets
--    Music and sound effect assets by Eric Matyas: http://www.soundimage.org
local composer = require( "composer" )

 scene = composer.newScene()

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )
print("in main menu!!")
-- Go to the menu screen

   -- display.remove(menuButton)
    composer.gotoScene("menu")

--menuButton = display.newText( "Play Again", display.contentCenterX, 730, native.systemFont, 50)
   

--composer.gotoScene( "menu" )
