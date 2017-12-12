
local sceneName = "Level1"

local composer = require( "composer" )
local scene = composer.newScene( "Level1" )
local bg, target, plane, text1, cloud1, cloud2, cloud3, bottomgroup,goUp,goDown,turnLeft,turnR, nexttext,nexttext2,nexttext3,nexttext4

function scene:create( event )
    local sceneGroup = self.view

 bg=display.newImageRect("SkyBackground.png",1500,2000)
sceneGroup:insert(bg)
local sparkles=display.newImage("Sparkles.png")
sceneGroup:insert(sparkles)
transition.to(sparkles, {time=2000,y=300})
 bg.y=0
local x = 0
local y = bg.y 
local matrisx = {}
local matrisy = {}
--butonların olduğu kısım bir grup olarak kayıtlı

bottomgroup = display.newGroup()
    bottomgroup.x=50
    bottomgroup.y=display.contentHeight-60
    bottomgroup.anchorX=0
    bottomgroup.anchorY=0
    bottomgroup.alpha=1
sceneGroup:insert(bottomgroup)

-- matrislerin amacı her bir nesneyi daha düzenli yerleştirmek, yani konumları tutuyorlar
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

    --ekran nesnelerinin setlemeleri

 target = display.newImageRect("Target.png",50,50)
 target.x = matrisx [0][11]
 target.y = matrisy [0][7]   
 sceneGroup:insert(target) 

 text1=display.newText("Seviye 1", 150 ,200, native.systemFont,30)
 text1:setFillColor(17,6,169)
 text1.alpha=1
 transition.fadeOut(text1, {time=2000, alpha=0})
 sceneGroup:insert(text1)
 cloud1 = display.newImageRect("Cloud.png",100,100)
 cloud1.x= matrisx[0][2]
 cloud1.y=matrisy[0][7]
 sceneGroup:insert(cloud1)
 cloud2 = display.newImageRect("Cloud.png",100,100)   
 cloud2.x= matrisx[0][5]
 cloud2.y=matrisy[0][7]
 sceneGroup:insert(cloud2)
 cloud3 = display.newImageRect("Cloud.png",100,100)
 cloud3.x= matrisx[0][8]
 cloud3.y=matrisy[0][7]
 sceneGroup:insert(cloud3)
 plane = display.newImageRect("Plane.png",50,50)
 plane.x=matrisx[0][2]
 plane.y=matrisy[0][7]
 sceneGroup:insert(plane)

 goDown = display.newImageRect("GoDown.png",50,25)
sceneGroup:insert(goDown)
bottomgroup:insert (goDown)

 goUp = display.newImageRect("GoUp.png",50,25)
sceneGroup:insert(goUp)
bottomgroup:insert(goUp)
goUp.x=75

 turnLeft = display.newImageRect("GoLeft.png",50,25)
sceneGroup:insert(turnLeft)
bottomgroup:insert(turnLeft)
turnLeft.x=150

 turnR = display.newImageRect("GoRight.png",50,25)
sceneGroup:insert(turnR)
bottomgroup:insert(turnR)
turnR.x=225


end


function scene:show( event )
 sceneGroup=self.view
    local phase = event.phase
  if phase == "did" then

--burada obje dizisiyle nesneleri tutarak kontroller gerçekleştirilecek
--ii ise indis

local obj={cloud1,cloud2,cloud3,target}
local ii=1

-- her bir listenerda kendi yönüne göre ilerleme var
-- ayrıca listener içeriklerinde hedefe veya buluta ulaşıp ulaşmadıklarını kontrol edip, bulutsa silme, hedefse bir sonraki seviyeye geçiş var
local function goDownListener (event)
  
        transition.to(plane, {time=100,rotation=180, y=plane.y+25})
    if plane.x==target.x and plane.y==target.y then
        nexttext=display.newImageRect( "NextLevel.png",200,150)
        nexttext.x=display.contentCenterX
        nexttext.y=display.contentCenterY
        nexttext.alpha=0
        sceneGroup:insert(nexttext)
        transition.fadeIn(nexttext,{time=2000})
        local function nextB111(event) 
        composer.gotoScene("Level2","fade", 500)
        end
        nexttext:addEventListener("tap",nextB111)


    elseif plane.x == obj[ii].x and plane.y== obj[ii].y then
        display.remove(obj[ii])
        obj[ii]=nil
        ii=ii+1
    end
end

local function goUpListener( event )
        transition.to(plane, {time=100, rotation=0, y=plane.y-25})
    if plane.x==target.x and plane.y==target.y then
        nexttext2=display.newImageRect( "NextLevel.png",200,150)
        nexttext2.x=display.contentCenterX
        nexttext2.y=display.contentCenterY
        nexttext2.alpha=0
        sceneGroup:insert(nexttext2)
        transition.fadeIn(nexttext2,{time=2000})
        local function nextB11(event) 
        composer.gotoScene("Level2","fade", 500)
        end
        nexttext2:addEventListener("tap",nextB11)


    elseif plane.x == obj[ii].x and plane.y== obj[ii].y then
        display.remove(obj[ii])
        obj[ii]=nil
        ii=ii+1
    end
end 

local function turnLeftListener (event)
        transition.to(plane, {time=100,rotation=-90,x=plane.x-25})

    if plane.x==target.x and plane.y==target.y then
        nexttext3=display.newImageRect( "NextLevel.png",200,150)
        nexttext3.x=display.contentCenterX
        nexttext3.y=display.contentCenterY
        nexttext3.alpha=0
        sceneGroup:insert(nexttext3)
        transition.fadeIn(nexttext3,{time=2000})
       local function nextB12(event) 
        composer.gotoScene("Level2","fade", 500)
        end
        nexttext3:addEventListener("tap",nextB12)


    elseif plane.x == obj[ii].x and plane.y== obj[ii].y then
        display.remove(obj[ii])
        obj[ii]=nil
        ii=ii+1
    end
end

local function turnRListener (event)
        transition.to(plane, {time=100,rotation=90, x=plane.x +25})

    if plane.x==target.x and plane.y==target.y then
        nexttext4=display.newImageRect( "NextLevel.png",200,150)
        nexttext4.x=display.contentCenterX
        nexttext4.y=display.contentCenterY
        nexttext4.alpha=0
        sceneGroup:insert(nexttext4)
        transition.fadeIn(nexttext4,{time=2000})
        local function nextB13(event) 
        composer.gotoScene("Level2","fade", 500)
        end
        nexttext4:addEventListener("tap",nextB13)


    elseif plane.x == obj[ii].x and plane.y== obj[ii].y then
        display.remove(obj[ii])
        obj[ii]=nil
        ii=ii+1
    end
end
composer.removeScene("OpeningScreen",true)

composer.removeScene("levelScreen",true)

goDown:addEventListener("tap",goDownListener)

goUp:addEventListener("tap",goUpListener)

turnLeft:addEventListener("tap",turnLeftListener)

turnR:addEventListener("tap",turnRListener)

        
    end 
end


 function scene:hide( event )

    local phase = event.phase
    sceneGroup=self.view

    if event.phase == "will" then
    elseif phase == "did" then
    end 
end

 function scene:destroy( event )
sceneGroup=self.view

end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene