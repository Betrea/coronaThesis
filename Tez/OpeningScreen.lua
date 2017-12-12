

local composer = require( "composer" )
local scene = composer.newScene()
local centerX=display.contentCenterX
local centerY=display.contentCenterY
local button, whatButton, Codes

function scene:create( event )
	local sceneGroup = self.view

	--arkaplan ve isim setlemesi
	
	local background=display.newImage("OpeningBackground2.png")
	sceneGroup:insert (background)
	transition.to(background, {time=2000, y=-400})
	local name= display.newImage("Name.png", centerX,centerY)
	transition.to(name, {time=2000, y=200})
	sceneGroup:insert(name)

	--baslat butonu setlemesi

	button=display.newImageRect("Start.png",100,100)
	button.x=centerX	
	button.y=display.contentWidth+20
	button.alpha=0
	sceneGroup:insert(button)
	transition.fadeIn(button,{time=2000})
	transition.to(button,{time=2000,y=display.contentHeight-200})
	--nedir butonu setlemesi
	whatButton= display.newImageRect("WhatC.png",100,100)
	whatButton.x=centerX
	whatButton.y=display.contentHeight-20
	whatButton.alpha=0
	sceneGroup:insert(whatButton)
	transition.fadeIn(whatButton,{time=2000})
	transition.to(whatButton,{time=2000,y=display.contentHeight-75})
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	if phase == "did" then
		
		composer.removeScene("Level6")
		composer.removeScene("Level7")
		composer.removeScene("Level8")
		
		--ilgili event listener setlemeleri
		
		local function buttonTouch(event)
		print("goto level1")
		composer.gotoScene( "levelScreen", "fade",500 )	
		end

		local function whatListener (event)
		Codes =display.newImageRect("Descript.png",200,300)
		Codes.x=centerX
		Codes.y=centerY
		Codes.alpha=0
		transition.fadeIn(Codes, {time=1000})
		sceneGroup:insert(Codes)

			local function CodeTap(event)
			display.remove(Codes)
			Codes=nil
			end
			Codes:addEventListener("tap", CodeTap)
		end 

	whatButton:addEventListener("tap", whatListener)

	button:addEventListener("tap",buttonTouch)

	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
if phase == "did" then
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene