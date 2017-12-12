
local sceneName = "Level3"

local composer = require( "composer" )
local scene = composer.newScene( "Level3" )
--ortak kullanılan nesneler basa yazıyorum ki tüm fonksiyonlar görsün
local bg,t1,t2,start2, target, plane, levelSelectionBt, timer1,txt, text1, bottomgroup,goUp,goDown,turnLeft,turnR, nexttext3,matrisx,matrisy,line,reset,line,line2,line3,line4

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
matrisx = {}
matrisy = {}
--alttaki butonların grubu
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
local a =0
local b= bg.y

--grid görüntüsü oluşturuluyor
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

--display nesneleri setlemesi
 target = display.newImageRect("Target.png",50,50)
 target.x = matrisx [0][11]
 target.y = matrisy [0][7]   
 sceneGroup:insert(target) 
 plane = display.newImageRect("Plane.png",50,50)
 plane.x=matrisx[0][3]
 plane.y=matrisy[0][7]
 sceneGroup:insert(plane)
 --text seviye bilgisi için
 text1=display.newText("Seviye 3", 150 ,200, native.systemFont,30)
 text1:setFillColor(0.6,0.2,0.5)
 text1.alpha=1
 transition.fadeOut(text1, {time=2000, alpha=0})
 sceneGroup:insert(text1)


--bu buton hareketi baslatacak burada konumu belirleniyor
 start2=display.newImageRect("Start2.png",50,25)
 start2.x=display.contentWidth/2
 start2.y=display.contentHeight-20
 sceneGroup:insert(start2)

--butonların konum setlemesi

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

reset=display.newImageRect("reset.png",45,25)
reset.x=55
reset.y=15
sceneGroup:insert(reset)
    

line=display.newImageRect("showLine.png",50,25)
line.x=display.contentWidth-55
line.y=15
sceneGroup:insert(line)

levelSelectionBt=display.newImageRect("levelSelectionButton.png",50,25)
levelSelectionBt.x=display.contentWidth-110
levelSelectionBt.y=15
sceneGroup:insert(levelSelectionBt)


end


function scene:show( event )
 sceneGroup=self.view
    local phase = event.phase
  if phase == "did" then

--ilk dizi komutları tutuyor
local command={}
local t=1

--hareketi sağlayan başla butonu event listener'ı
--ucağın güncel konumu    
local xx=plane.x
local yy=plane.y
local function start2Listener (event)


--gelen komutun ne olduğuna bakarak uygun adım atılıyor
--indis her seferinde arttırılarak bir sonraki komuta gecmek amaclanıyor

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


-- kazanma durumu kontolü yapılıyor
--ucak ve hedef aynı konumda ise seviye gecilir

    if plane.x==target.x and plane.y==target.y then
        timer.cancel(timer1)
        nexttext3=display.newImageRect( "NextLevel.png",200,150)
        nexttext3.x=display.contentCenterX
        nexttext3.y=display.contentCenterY
        nexttext3.alpha=0
        transition.fadeIn(nexttext3,{time=2000})
        sceneGroup:insert(nexttext3)

        local function nextB111(event) 
        composer.gotoScene("Level4","fade", 500)
        end
        nexttext3:addEventListener("tap",nextB111)
    end
-- timer ile komut dizisinin boyutu kadar 1.1 sn gecikmeli start listener tekrar ediliyor 

timer1 =timer.performWithDelay(1100, start2Listener, #command )

end


--ikinci komut dizisi birbirlerinin indislerini arttırmamaları için ayrıldı
local xxi=plane.x
local yyi=plane.y
local r=1
local commandLine={}
local xc=60
local yc=display.contentHeight-100
--değişkenler text içeriğini doldurmak amaçlı o yüzden 4 buton içinde ayrı
local kk=1
local uu=1
local dd=1
local ss=1

-- her yön için ikonlar ve for döngüleri ekrana ekleniyor
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

    xc=xc+50
    dd=1
    end

    r=r+1
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

-- bölümü yeniden başlatıyor

local function resetListener(event)


    composer.removeScene("Level3")
    composer.gotoScene("Level3","fade",500)

end

--yol cizimi

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

        --display.remove(line)
--        display.remove(line2)
  --      display.remove(line3)
    --    display.remove(line4)

    end
end
--seviye secim ekranına yolluyor

local function levelSelect( event )

    composer.gotoScene("levelScreen")
end

composer.removeScene("Level2")

composer.removeScene("levelScreen",true)

levelSelectionBt:addEventListener("tap",levelSelect)

reset:addEventListener("tap",resetListener)

line:addEventListener("touch",lineListener)

start2:addEventListener("tap",start2Listener)

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
timer.cancel(timer1)

end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene