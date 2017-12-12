
local composer = require( "composer" )
local physics = require("physics")

local scene = composer.newScene()

local background, star, ball , randomBall, timer1, timer2,text,star2,star3


--top yoketme
local function ballRemove( event )
    if event.phase == "began"  then
    event.target:removeSelf() 
    event.target = nil
    return true
    end
end



function scene:create( event )
    local sceneGroup = self.view
    physics.start()
    physics.setGravity(0,4)

    background=display.newImage("SkyBackground.png",true)
    sceneGroup:insert(background)

    local text7=display.newText("Seviye 8", 150 ,200, native.systemFont,30)
    text7:setFillColor(17,6,169)
    text7.alpha=1
    transition.fadeOut(text7, {time=2000, alpha=0})
    sceneGroup:insert(text7)

    star=display.newImageRect("Target.png",100,100)
    star.x=display.contentWidth-280
    star.y=display.contentHeight/2
    sceneGroup:insert(star)
    physics.addBody( star, "static", { friction=0.5 } )

    star2=display.newImageRect("Target.png",100,100)
    star2.x=display.contentWidth-80
    star2.y=display.contentHeight/2
    sceneGroup:insert(star2)
    physics.addBody( star2, "static", { friction=0.5 } )

    star3=display.newImageRect("Target.png",100,100)
    star3.x=display.contentWidth-200
    star3.y=display.contentHeight-80
    sceneGroup:insert(star3)
    physics.addBody( star3, "static", { friction=0.5 } )

--rastgele top uretimi

    function randomBall()
    ball= display.newImageRect("Ball.png",50,50)
    ball.x = 40 + math.random( 380 ); ball.y = -40
    physics.addBody( ball, { density=0.6, friction=0.6, bounce=0.6, radius=19 } )
    ball.angularVelocity = math.random(800) - 200
    sceneGroup:insert(ball)
    ball:addEventListener("touch",ballRemove)
   end


end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    if phase == "did" then
    physics.start()
    physics.setGravity(0,4)

--carpısma denetimi
    local function onLocalPostCollision( self, event )
    
    event.target:removeSelf() 
    event.target = nil

        if event.target==nil then
            physics.pause()
            timer.cancel(timer1)
            timer.cancel(timer2)
            text= display.newText("Kaybettin",display.contentCenterX,display.contentCenterY)
            sceneGroup:insert(text)
            composer.gotoScene("OpeningScreen","fade",500)
        end
    return true
    end

    star.postCollision = onLocalPostCollision
    star:addEventListener( "postCollision", star )

    star2.postCollision = onLocalPostCollision
    star2:addEventListener( "postCollision", star2 )

    star3.postCollision = onLocalPostCollision
    star3:addEventListener( "postCollision", star3 )


--sıradaki seviyeye gecis

    local function goNextLevel()

        print("go")

        local finalText=display.newText( "Tebrikler! Oyunu tamamladın!",display.contentCenterX,display.contentCenterY, native.systemFont, 24)
        finalText.alpha=0
        sceneGroup:insert(finalText)
        transition.fadeIn(finalText,{time=2000})
        local function nextB6(event) 
        composer.gotoScene("OpeningScreen","fade", 500)
        end
        finalText:addEventListener("tap",nextB6)
end
    timer1=timer.performWithDelay( 800, randomBall, 15) 
    timer2=timer.performWithDelay(15000,goNextLevel)


    end 
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase
    
    if event.phase == "will" then

    elseif phase == "did" then

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