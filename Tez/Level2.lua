
local sceneName = "Level2"

local composer = require( "composer" )
local scene = composer.newScene( "Level2" )
local bg, target2, plane2, text2, cloud12, cloud22, cloud32, bottomgroup,goUp2,goDown2,turnLeft2,turnR2

--mantık bir önceki seviyeyle aynı, burada bulutlarla yol farklı
--yani matrislerle belirlenen konumlar farklı

function scene:create( event )
    local sceneGroup = self.view
local bg=display.newImageRect("SkyBackground.png",1500,2000)
    bg.y=0
    sceneGroup:insert(bg)
    local sparkles=display.newImage("Sparkles.png")
sceneGroup:insert(sparkles)
transition.to(sparkles, {time=2000,y=300})
  local x = 0
    local y = bg.y 
local matrisx = {}
local matrisy = {}
bottomgroup = display.newGroup()
bottomgroup.x=50
bottomgroup.y=display.contentHeight-60
bottomgroup.anchorX=0
bottomgroup.anchorY=0
bottomgroup.alpha=1
sceneGroup:insert(bottomgroup)
for i=0, 1, 1 do

    matrisx [i]={}
    matrisy [i]={}
            
    for j=0, 20, 1 do

        matrisx [i][j]=x
        matrisy [i][j]=y
        x=x+25
        y=y+25
        end
    end

text2=display.newText("Seviye 2", 150 ,200, native.systemFont,30)
text2:setFillColor(17,6,169)
text2.alpha=1
transition.fadeOut(text2, {time=2000, alpha=0})
sceneGroup:insert(text2)

target2 = display.newImageRect("Target.png",50,50) 
    target2.x = matrisx [0][8]
    target2.y = matrisy [0][10]
sceneGroup:insert(target2)


cloud12 = display.newImageRect("Cloud.png",100,100)
 cloud12.x= matrisx[0][2]
cloud12.y=matrisy[0][7]
sceneGroup:insert(cloud12)

cloud22 = display.newImageRect("Cloud.png",100,100)
cloud22.x= matrisx[0][5]
cloud22.y=matrisy[0][7]
sceneGroup:insert(cloud22)

cloud32 = display.newImageRect("Cloud.png",100,100)
cloud32.x= matrisx[0][8]
cloud32.y=matrisy[0][7]
sceneGroup:insert(cloud32)

plane2 = display.newImageRect("Plane.png",50,50)
plane2.x=matrisx[0][2]
plane2.y=matrisy[0][7]
sceneGroup:insert(plane2)

goDown2 = display.newImageRect("GoDown.png",50,25)
sceneGroup:insert(goDown2)
bottomgroup:insert (goDown2)


goUp2 = display.newImageRect("GoUp.png",50,25)
sceneGroup:insert(goUp2)
bottomgroup:insert(goUp2)
goUp2.x=75

turnLeft2 = display.newImageRect("GoLeft.png",50,25)
sceneGroup:insert(turnLeft2)
bottomgroup:insert(turnLeft2)
turnLeft2.x=150

turnR2 = display.newImageRect("GoRight.png",50,25)
sceneGroup:insert(turnR2)
bottomgroup:insert(turnR2)
turnR2.x=225


end

function scene:show( event )
   -- local sceneGroup = self.view
    local phase = event.phase
   local sceneGroup=self.view

if phase == "did" then


    local obj={cloud12,cloud22,cloud32,target2}
    local ii=1

    local function goDownListener2 (e)
  
        transition.to(plane2, {time=100, rotation=180, y=plane2.y+25})
        print("ended")
        if plane2.x==target2.x and plane2.y==target2.y then
        local nexttext1=display.newImageRect( "NextLevel.png",200,150)
        nexttext1.x=display.contentCenterX
        nexttext1.y=display.contentCenterY
        nexttext1.alpha=0
        sceneGroup:insert(nexttext1)
        transition.fadeIn(nexttext1,{time=2000})
       local function nextB2(event) 
        composer.gotoScene("Level3","fade", 500)
        end
        nexttext1:addEventListener("tap",nextB2)


    elseif plane2.x == obj[ii].x and plane2.y== obj[ii].y then
        display.remove(obj[ii])
        print("ok")
        ii=ii+1
    end
end

local function goUpListener2( event )
        transition.to(plane2, {time=100, rotation=0, y=plane2.y-25})
        if plane2.x==target2.x and plane2.y==target2.y then
        local nexttext22=display.newImageRect( "NextLevel.png",200,150)
        nexttext22.x=display.contentCenterX
        nexttext22.y=display.contentCenterY
        nexttext22.alpha=0
        sceneGroup:insert(nexttext22)
        transition.fadeIn(nexttext22,{time=2000})
       local function nextB22(event) 
        composer.gotoScene("Level3","fade", 500)
        end
        nexttext22:addEventListener("tap",nextB22)


    elseif plane2.x == obj[ii].x and plane2.y== obj[ii].y then
        display.remove(obj[ii])
        print("ok")
        ii=ii+1
    end
end 

local function turnLeftListener2 (event)
        transition.to(plane2, {time=100,rotation=-90,x=plane2.x-25})
        print("left-ended")
        if plane2.x==target2.x and plane2.y==target2.y then
        local nexttext23=display.newImageRect( "NextLevel.png",200,150)
        nexttext23.x=display.contentCenterX
        nexttext23.y=display.contentCenterY
        nexttext23.alpha=0
        sceneGroup:insert(nexttext23)
        transition.fadeIn(nexttext23,{time=2000})
        local function nextB23(event) 
        composer.gotoScene("Level3","fade", 500)
        end
        nexttext23:addEventListener("tap",nextB23)


    elseif plane2.x == obj[ii].x and plane2.y== obj[ii].y then
        display.remove(obj[ii])
        print("ok")
        ii=ii+1
    end
end

local function turnRListener2 (event)
        transition.to(plane2, {time=100,rotation=90, x=plane2.x+25})
        print("right-ended")

        if plane2.x==target2.x and plane2.y==target2.y then
        local nexttext24=display.newImageRect( "NextLevel.png",200,150)
        nexttext24.x=display.contentCenterX
        nexttext24.y=display.contentCenterY
        nexttext24.alpha=0
        sceneGroup:insert(nexttext24)
        transition.fadeIn(nexttext24,{time=2000})
       local function nextB24(event) 
        composer.gotoScene("Level3","fade", 500)
        end
        nexttext24:addEventListener("tap",nextB24)


    elseif plane2.x == obj[ii].x and plane2.y== obj[ii].y then
        display.remove(obj[ii])
        print("ok")
        ii=ii+1
    end
end
composer.removeScene("Level1",true)
composer.removeScene("levelScreen",true)
goDown2:addEventListener("tap",goDownListener2)
goUp2:addEventListener("tap",goUpListener2)
turnLeft2:addEventListener("tap",turnLeftListener2)
turnR2:addEventListener("tap",turnRListener2)
    end 
end


function scene:hide( event )
   -- local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        -- INSERT code here to pause the scene
        -- e.g. stop timers, stop animation, unload sounds, etc.)
    elseif phase == "did" then
        -- Called when the scene is now off screen

    end 
end

function scene:destroy( event )
   -- local sceneGroup = self.view
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene