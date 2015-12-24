local scene1 = nil 
local scene2 = nil 
local pic = "menuitemsprite.png"
local flag = 1
require "HitVoles"


local function createScene1()
	scene1 = CCScene:create()
	local layer = CCLayer:create()
	local bgLayer = CCLayerColor:create(ccc4(255,0,0,255))
	layer:addChild(bgLayer, -1)
	scene1:addChild(layer)

	local menue = CCMenu:create()
	layer:addChild(menue)

	    -- Font Item
    local  spriteNormal = CCSprite:create(pic, CCRectMake(0,23*2,115,23))
    local  spriteSelected = CCSprite:create(pic, CCRectMake(0,23*1,115,23))
    local  spriteDisabled = CCSprite:create(pic, CCRectMake(0,23*0,115,23))

    local  item1 = CCMenuItemSprite:create(spriteNormal, spriteSelected, spriteDisabled)
    item1:registerScriptTapHandler(menuCallback)

	menue:addChild(item1)

    local s = CCDirector:sharedDirector():getWinSize()
    menue:setPosition(ccp(s.width/2, s.height/2))

	return scene1
end

local function createScene2()
	-- scene2 = CCScene:create()
	-- local layer = CCLayer:create()
	-- local bgLayer = CCLayerColor:create(ccc4(0,255,0,255))
	-- layer:addChild(bgLayer, -1)
	-- scene2:addChild(layer)

	-- local menue = CCMenu:create()
	-- layer:addChild(menue)

	--     -- Font Item
 --    local  spriteNormal = CCSprite:create(pic, CCRectMake(0,23*2,115,23))
 --    local  spriteSelected = CCSprite:create(pic, CCRectMake(0,23*1,115,23))
 --    local  spriteDisabled = CCSprite:create(pic, CCRectMake(0,23*0,115,23))

 --    local  item1 = CCMenuItemSprite:create(spriteNormal, spriteSelected, spriteDisabled)
 --    item1:registerScriptTapHandler(menuCallback)

	-- menue:addChild(item1)

 --    local s = CCDirector:sharedDirector():getWinSize()
 --    menue:setPosition(ccp(s.width/2, s.height/2))
	return createGameScene() 
end

local function translateScene()
	--local scene = nextAction()
	local scene = nil 
	if flag == 1 then
		scene = createScene2()
		flag = 2
	else
		scene = createScene1()
		flag = 1
	end
	scene = CCTransitionFadeTR:create(1.2, scene)
    CCDirector:sharedDirector():replaceScene(scene)
end

function menuCallback(sender)
	--print("XXXXXXXXXXXXXXXXXXXX")
	translateScene()
end


function Enter()
	local scene = createScene1()
	CCDirector:sharedDirector():runWithScene(scene)
end


