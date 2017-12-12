
local sceneName = "Level1"

local composer = require( "composer" )
local scene = composer.newScene( "Level1" )
local bg5, target, plane, text5, bottomgroup5,goUp5,goDown5,turnLeft5,turnR5, nexttext3,t1,t2, ball, ball2, levelSelectionBtn,txt,txt2,txt3,txt4

function scene:create( event )
    local sceneGroup = self.view
--arkaplan setleme
 bg5=display.newImageRect("SkyBackground.png",1500,2000)
sceneGroup:insert(bg5)
 bg5.y=0
 local sparkles=display.newImage("Sparkles.png")
sceneGroup:insert(sparkles)
transition.to(sparkles, {time=2000,y=300})

local x = 0
local y = bg5.y 
local matrisx = {}
local matrisy = {}
bottomgroup5 = display.newGroup()
        bottomgroup5.x=50
        bottomgroup5.y=display.contentHeight-60
        bottomgroup5.anchorX=0
        bottomgroup5.anchorY=0
        bottomgroup5.alpha=1
sceneGroup:insert(bottomgroup5)

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
local a =0
local b= bg5.y
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

--display nesneleri setleme
 target = display.newImageRect("Target.png",50,50)
 target.x = matrisx [0][7]
 target.y = matrisy [0][13]   
 sceneGroup:insert(target) 

 plane = display.newImageRect("Plane.png",50,50)
 plane.x=matrisx[0][3]
 plane.y=matrisy[0][3]
 sceneGroup:insert(plane)

 text5=display.newText("Seviye 5", 150 ,200, native.systemFont,30)
 text5:setFillColor(0.6,0.2,0.5)
 text5.alpha=1
 transition.fadeOut(text5, {time=2000, alpha=0})
 sceneGroup:insert(text5)

ball = display.newImageRect("Ball.png",50,50)
ball.x=matrisx [0][9]
ball.y=matrisy [0][13]
sceneGroup:insert(ball)

ball2 = display.newImageRect("Ball.png",50,50)
ball2.x=matrisx [0][7]
ball2.y=matrisy [0][11]
sceneGroup:insert(ball2)

 goDown5 = display.newImageRect("GoDown.png",50,25)
sceneGroup:insert(goDown5)
bottomgroup5:insert (goDown5)

 goUp5 = display.newImageRect("GoUp.png",50,25)
sceneGroup:insert(goUp5)
bottomgroup5:insert(goUp5)
goUp5.x=75

 turnLeft5 = display.newImageRect("GoLeft.png",50,25)
sceneGroup:insert(turnLeft5)
bottomgroup5:insert(turnLeft5)
turnLeft5.x=150

 turnR5 = display.newImageRect("GoRight.png",50,25)
sceneGroup:insert(turnR5)
bottomgroup5:insert(turnR5)
turnR5.x=225


 start2=display.newImageRect("Start2.png",50,25)
 start2.x=display.contentWidth/2
 start2.y=display.contentHeight-20
 sceneGroup:insert(start2)

reset=display.newImageRect("reset.png",49,25)
reset.x=55
reset.y=15
sceneGroup:insert(reset)
    

line=display.newImageRect("showLine.png",50,24)
line.x=display.contentWidth-55
line.y=15
sceneGroup:insert(line)

levelSelectionBtn=display.newImageRect("levelSelectionButton.png",50,25)
levelSelectionBtn.x=display.contentWidth-110
levelSelectionBtn.y=15
sceneGroup:insert(levelSelectionBtn)

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

  if phase == "did" then


local command={}
local t=1
--baslatma listener
local xx=plane.x
local yy=plane.y

local function start5Listener (event)


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
    transition.to(plane, {time=900, rotation=-90 , x=xx })

    t=t+1 


elseif command[t]=="right" then
    xx=xx+50
    transition.to(plane, {time=900, rotation=90 , x=xx })

    t=t+1 
end


--kazanma durumu
    if plane.x==target.x and plane.y==target.y then

        nexttext3=display.newImageRect( "NextLevel.png",200,150)
        nexttext3.x=display.contentCenterX
        nexttext3.y=display.contentCenterY
        nexttext3.alpha=0
        transition.fadeIn(nexttext3,{time=2000})
        sceneGroup:insert(nexttext3)
        timer.pause(timer1)
        local function nextB111(event) 
        timer.cancel(timer1)
        composer.gotoScene("Level4","fade", 500)
        end
        nexttext3:addEventListener("tap",nextB111)
    end

--kaybetme durumu

    if plane.x==ball.x and plane.y==ball.y or plane.x==ball2.x and plane.y==ball2.y then
        local loosingText = display.newText("Kaybettin",ball.x,ball.y,native.systemFont, 16)
        loosingText:setFillColor(0.6,0.2,0.5)
        loosingText.alpha=1
        transition.fadeOut(loosingText, {time=2000, alpha=0})

    end

timer1 =timer.performWithDelay(1100, start5Listener, #command )
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

--ikonlar ve text yerlestirmeleri

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

local function resetListener(event)

    composer.removeScene("Level5")
    composer.gotoScene("Level5","fade",500)

end

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

      --  display.remove(line)
        --display.remove(line2)
        --display.remove(line3)
       -- display.remove(line4)

    end
end

local function levelSelectList( event )
    composer.gotoScene("levelScreen")
end

composer.removeScene("Level4")

composer.removeScene("levelScreen",true)

levelSelectionBtn:addEventListener("tap", levelSelectList)

reset:addEventListener("tap",resetListener)

line:addEventListener("touch",lineListener)

start2:addEventListener("tap",start5Listener)

goDown5:addEventListener("tap",goDownListener)

goUp5:addEventListener("tap",goUpListener)

turnLeft5:addEventListener("tap",turnLeftListener)

turnR5:addEventListener("tap",turnRListener)


        
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