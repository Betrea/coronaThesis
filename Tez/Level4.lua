
local sceneName = "Level4"

local composer = require( "composer" )
local scene = composer.newScene( "Level4" )

local bg4,bottomgroup4,t1,t2, text4, plane, target, goDown,goUp,turnLeft,turnR,nexttext, ball,timer1, levelSelect,txt,txt2,txt3,txt4

function scene:create( event )
    local sceneGroup = self.view
--arkaplan setleme
bg4=display.newImageRect("SkyBackground.png",1500,2000)
    bg4.y=0
    sceneGroup:insert(bg4)
local sparkles=display.newImage("Sparkles.png")
sceneGroup:insert(sparkles)
transition.to(sparkles, {time=2000,y=300})

    local x4 = 0
    local y4 = bg4.y 
local matrisx4 = {}
local matrisy4 = {}
bottomgroup4 = display.newGroup()
bottomgroup4.x=50
bottomgroup4.y=display.contentHeight-60
bottomgroup4.anchorX=0
bottomgroup4.anchorY=0
bottomgroup4.alpha=1
sceneGroup:insert(bottomgroup4)
for i4=0, 1, 1 do

    matrisx4 [i4]={}
    matrisy4 [i4]={}
            
    for j4=0, 20, 1 do

        matrisx4 [i4][j4]=x4
        matrisy4 [i4][j4]=y4
        x4=x4+25
        y4=y4+25
        end
    end

local a =0
local b= bg4.y
--ızgara
for h=0, 7, 1 do
    t1=display.newLine(0,b,display.contentWidth,b)
    t1.alpha=0
    transition.fadeIn(t1, {time=2000})
    b=b+50
    sceneGroup:insert(t1)
end
for g=0,10,1 do
    t2=display.newLine(a,50,a,display.contentHeight-130)
    t2.alpha=0
    transition.fadeIn(t2, {time=2000})
    a=a+50   
    sceneGroup:insert(t2)
end
--objeleri setleme
target = display.newImageRect("Target.png",50,50) 
    target.x = matrisx4 [0][7]
    target.y = matrisy4 [0][13]
sceneGroup:insert(target)

ball = display.newImageRect("Ball.png",50,50)
ball.x=matrisx4[0][7]
ball.y=matrisy4[0][11]
sceneGroup:insert(ball)

text4=display.newText("Seviye 4", 150 ,200, native.systemFont,30)
text4:setFillColor(0.6,0.2,0.5)
text4.alpha=1
transition.fadeOut(text4, {time=2000, alpha=0})
sceneGroup:insert(text4)

plane = display.newImageRect("Plane.png",50,50)
plane.x=matrisx4[0][3]
plane.y=matrisy4[0][7]
sceneGroup:insert(plane)


 start2=display.newImageRect("Start2.png",50,25)
 start2.x=display.contentWidth/2
 start2.y=display.contentHeight-20
 sceneGroup:insert(start2)

goDown = display.newImageRect("GoDown.png",50,25)
sceneGroup:insert(goDown)
bottomgroup4:insert (goDown)


goUp= display.newImageRect("GoUp.png",50,25)
sceneGroup:insert(goUp)
bottomgroup4:insert(goUp)
    goUp.x=75


turnLeft = display.newImageRect("GoLeft.png",50,25)
sceneGroup:insert(turnLeft)
bottomgroup4:insert(turnLeft)
    turnLeft.x=150

turnR = display.newImageRect("GoRight.png",50,25)
sceneGroup:insert(turnR)
bottomgroup4:insert(turnR)
    turnR.x=225

reset=display.newImageRect("reset.png",49,25)
reset.x=55
reset.y=15
sceneGroup:insert(reset)
    

line=display.newImageRect("showLine.png",50,24)
line.x=display.contentWidth-55
line.y=15
sceneGroup:insert(line)

levelSelect=display.newImageRect("levelSelectionButton.png",50,25)
levelSelect.x=display.contentWidth-110
levelSelect.y=15
sceneGroup:insert(levelSelect)

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

  if phase == "did" then


local command={}
local t=1
local xx=plane.x
local yy=plane.y

--başlata basılınca komutlar sırayla islenecek
local function start3Listener (event)

if command[t]=="down"  then
    yy=yy+50
    transition.to(plane, { time=900, rotation=180 , y=yy })
    t=t+1 

elseif command[t]=="up" then
    yy=yy-50
    transition.to(plane, {time=900 , rotation=0 , y=yy })

    t=t+1 


elseif command[t]=="left" then 
        xx=xx-50
        transition.to(plane, {time=900, rotation=-90 , x=xx  })

    t=t+1 


elseif command[t]=="right" then
    xx=xx+50
    transition.to(plane, {time=900, rotation=90 , x=xx  })

    t=t+1 
end

--kazanma durumu 
    if plane.x==target.x and plane.y==target.y then
        timer.pause(timer1)
        nexttext=display.newImageRect( "NextLevel.png",200,150)
        nexttext.x=display.contentCenterX
        nexttext.y=display.contentCenterY
        nexttext.alpha=0
        transition.fadeIn(nexttext,{time=2000})
        sceneGroup:insert(nexttext)

        local function nextB111(event) 
        timer.cancel(timer1)
        composer.gotoScene("Level5","fade", 500)
        end
        nexttext:addEventListener("tap",nextB111)
    end

--kaybetme kosulu, topla aynı noktada olma
    if plane.x==ball.x and plane.y==ball.y then
        local loosingText = display.newText("Kaybettin",ball.x,ball.y,native.systemFont, 16)
        loosingText:setFillColor(0.6,0.2,0.5)
        loosingText.alpha=1
        transition.fadeOut(loosingText, {time=2000, alpha=0})

    end

timer1 =timer.performWithDelay(1100, start3Listener, #command )
end

local xxi=plane.x
local yyi=plane.y
local r=1
local commandLine={}
local xc=60
local yc=display.contentHeight-100
local kk=1
local uu=1
local dd=1
local ss=1

--ikonlar ve komut dizisini doldurma

local function goDownListener (event)
    command[r]="down"
    commandLine[r]="down" 

    if command[r-1]=="down"  then

    display.remove(txt)
    else
        xc=xc+50
        uu=1
    end

    r=r+1 


    local goDown2=display.newImageRect("down.png",40,40)
    goDown2.x=xc
    goDown2.y=yc
    txt=display.newText("for( " .. tostring (uu) .. ")",xc,display.contentHeight-120,native.systemFont,10)

    sceneGroup:insert(txt)
    sceneGroup:insert(goDown2)


    uu=uu+1

end

local function goUpListener( event )

    command[r]="up"

    commandLine[r]="up"

    if command[r-1]=="up"  then

    display.remove(txt2)
    else

    r=r+1
    dd=1
    xc=xc+50
    end

    local goUp2=display.newImageRect("up.png",40,40)

    goUp2.x=xc
    goUp2.y=yc

    txt2=display.newText("for( " .. tostring (dd) .. ")",xc,display.contentHeight-120,native.systemFont,10)

    sceneGroup:insert(txt2)
    sceneGroup:insert(goUp2)

    dd=dd+1

end 

local function turnLeftListener (event)
    command[r]="left"
    commandLine[r]="left"

    if command[r-1]=="left"  then

    display.remove(txt3)
    else
        xc=xc+50
        kk=1
    end

    r=r+1

    local left2=display.newImageRect("left.png",40,40)
    left2.x=xc
    left2.y=yc
    txt3=display.newText("for( " .. tostring (kk) .. ")",xc,display.contentHeight-120,native.systemFont,10)

    sceneGroup:insert(txt3)
    sceneGroup:insert(left2)


    kk=kk+1
end

local function turnRListener (event)

    command[r]="right"
    commandLine[r]="right"

    if command[r-1]=="right"  then

    display.remove(txt4)
    else
        xc=xc+50
        ss=1
    end

    r=r+1

    local goR2=display.newImageRect("right.png",40,40)
    goR2.x=xc
    goR2.y=yc

    txt4=display.newText("for( " .. tostring (ss) .. ")",xc,display.contentHeight-120,native.systemFont,10)

    sceneGroup:insert(txt4)
    sceneGroup:insert(goR2)


    ss=ss+1
end
--reset bölümü yeniliyor
local function resetListener(event)

    composer.removeScene("Level4")
    composer.gotoScene("Level4","fade",500)

end
--yol olusturuyor
local function lineListener(event)

    if event.phase=="began" then

    for x=1,#commandLine do

    if commandLine[x]=="down"  then

    line=display.newLine(xxi,yyi,xxi,yyi+50)
    sceneGroup:insert(line)  
    line:setStrokeColor(0.6,0.2,0.6,1)  
    yyi=yyi+50

    elseif commandLine[x]=="up" then

    line2=display.newLine(xxi,yyi,xxi,yyi-50)
    sceneGroup:insert(line2)
    line2:setStrokeColor(0.6,0.2,0.6,1)
    yyi=yyi-50

    elseif commandLine[x]=="left" then 

    line3=display.newLine(xxi,yyi,xxi-50,yyi)
    sceneGroup:insert(line3)
    line3:setStrokeColor(0.6,0.2,0.6,1)
    xxi=xxi-50

    elseif commandLine[x]=="right" then

    line4=display.newLine(xxi,yyi,xxi+50,yyi)
    sceneGroup:insert(line4)
    line4:setStrokeColor(0.6,0.2,0.6,1)
    xxi=xxi+50
 
    end
    end
    elseif event.phase=="ended" then

       -- display.remove(line)
        --display.remove(line2)
        --display.remove(line3)
       -- display.remove(line4)

    end
end
--seviye secim ekranı

local function levelSelectList( event )
    composer.gotoScene("levelScreen")
end

composer.removeScene("Level3")

composer.removeScene("levelScreen",true)

levelSelect:addEventListener("tap",levelSelectList)

reset:addEventListener("tap",resetListener)

line:addEventListener("touch",lineListener)

start2:addEventListener("tap",start3Listener)

goDown:addEventListener("tap",goDownListener)

goUp:addEventListener("tap",goUpListener)

turnLeft:addEventListener("tap",turnLeftListener)

turnR:addEventListener("tap",turnRListener)

    end 
end


function scene:hide( event )
    local sceneGroup = self.view
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
    local sceneGroup = self.view


end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene