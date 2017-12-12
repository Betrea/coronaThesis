

local composer = require( "composer" )
local scene = composer.newScene()
local level11, level12, level13, level14, level15, level16, level17, level18
function scene:create( event )

	local sceneGroup = self.view
	local background=display.newImage("LevelSelection.png")
	sceneGroup:insert (background)
	transition.to(background, {time=2000, y=-400})

	--tüm seviyelerin resimleri konumlarına yerleştiriliyor
	level11=display.newImageRect("Level1.png",50,50)
	level11.x=70
	level11.y=150
	level11.alpha=0
	sceneGroup:insert(level11)
	transition.fadeIn(level11,{time=2000})

	level12=display.newImageRect("level2.png",50,50)
	level12.x=160
	level12.y=150
	level12.alpha=0
	sceneGroup:insert(level12)
	transition.fadeIn(level12,{time=2000})
	
	level13=display.newImageRect("level3.png",50,50)
	level13.x=250
	level13.y=150
	level13.alpha=0
	sceneGroup:insert(level13)
	transition.fadeIn(level13,{time=2000})

	level14=display.newImageRect("level4.png",50,50)
	level14.x=70
	level14.y=250
	level14.alpha=0
	sceneGroup:insert(level14)
	transition.fadeIn(level14,{time=2000})
	
	level15=display.newImageRect("level5.png",50,50)
	level15.x=160
	level15.y=250
	level15.alpha=0
	sceneGroup:insert(level15)
	transition.fadeIn(level15,{time=2000})

	level16=display.newImageRect("level6.png",50,50)
	level16.x=250
	level16.y=250
	level16.alpha=0
	sceneGroup:insert(level16)
	transition.fadeIn(level16,{time=2000})

	level17=display.newImageRect("level7.png",50,50)
	level17.x=90
	level17.y=350
	level17.alpha=0
	sceneGroup:insert(level17)
	transition.fadeIn(level17,{time=2000})

	level18=display.newImageRect("level8.png",50,50)
	level18.x=200
	level18.y=350
	level18.alpha=0
	sceneGroup:insert(level18)
	transition.fadeIn(level18,{time=2000})



end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	if phase == "did" then

		--her bir seviyenin listener'ıayarlanıyor,ilgilibölüme yönlendiriliyor

		local function level1Listener (event)
			composer.gotoScene("Level1","fade",500)
		end

		local function level2Listener (event)
			composer.gotoScene("Level2","fade",500)
		end
		
		local function level3Listener (event)
			composer.gotoScene("Level3","fade",500)
		end

		local function level4Listener (event)
			composer.gotoScene("Level4","fade",500)
		end

		local function level5Listener (event)
			composer.gotoScene("Level5","fade",500)
		end

		local function level6Listener (event)
			composer.gotoScene("Level6","fade",500)
		end

		local function level7Listener (event)
			composer.gotoScene("Level7","fade",500)
		end

		local function level8Listener (event)
			composer.gotoScene("Level8","fade",500)
		end		

		--oyunda seviye  ekranına dönmek icin önceki bölümler siliniyor
		
		composer.removeScene("OpeningScreen",true)
		composer.removeScene("Level1",true)
		composer.removeScene("Level2",true)
		composer.removeScene("Level3",true)
		composer.removeScene("Level4",true)
		composer.removeScene("Level5",true)
		composer.removeScene("Level6",true)
		composer.removeScene("Level7",true)
		composer.removeScene("Level8",true)

		level11:addEventListener("tap",level1Listener)
		level12:addEventListener("tap",level2Listener)
		level13:addEventListener("tap",level3Listener)
		level14:addEventListener("tap",level4Listener)
		level15:addEventListener("tap",level5Listener)
		level16:addEventListener("tap",level6Listener)
		level17:addEventListener("tap",level7Listener)
		level18:addEventListener("tap",level8Listener)
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