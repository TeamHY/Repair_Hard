-- *** 아이작의 번제 애프터버스+ - 아이템 설명 모드 *** --
-- *** Provided by 아이작의 번제 마이너 갤러리 (gall.dcinside.com/mgallery/board/lists/?id=tboi) *** --
local filepath= ""
local itemConfig = Isaac.GetItemConfig()
local _, err = pcall(require, "configEid")
err = tostring(err)
if not string.match(err, "attempt to call a nil value %(method 'ForceError'%)") then
    if string.match(err, "true") then
        err = "Error: require passed in config"
    end
    Isaac.DebugString(err)
    print(err)
end


if not __eidItemDescriptions then
  __eidItemDescriptions = {};
end
if not __eidTrinketDescriptions then
  __eidTrinketDescriptions = {};
end
if not __eidCardDescriptions then
  __eidCardDescriptions = {};
end

function getModDescription(list, id)
  return (list) and (list[id])
end

local IconSprite = Sprite()
IconSprite:Load("gfx/icons.anm2", true)
IconSprite.Scale = Vector(EIDConfig["Scale"],EIDConfig["Scale"])

local ArrowSprite = Sprite()
ArrowSprite:Load("gfx/icons.anm2", true)
ArrowSprite:Play("Arrow",false)

function printDescription(desc)
	local Description = desc[3]
	local temp = EIDConfig["YPosition"]
	local itemTypes= {"null","passive","active","familiar","trinket"}
	local itemType = itemConfig:GetCollectible(desc[1]).Type
		if itemType ==3 then
			IconSprite:Play(itemConfig:GetCollectible(desc[1]).MaxCharges)
			IconSprite.Scale = Vector(EIDConfig["Scale"],EIDConfig["Scale"])
			IconSprite:Update()
			IconSprite:Render(Vector(EIDConfig["XPosition"]-3*EIDConfig["Scale"]+offsetX,temp+1*EIDConfig["Scale"]), Vector(0,0), Vector(0,0))
		end
	end
function HasCurseBlind()
	local num = Game():GetLevel():GetCurses()
    local t={}
    while num>0 do
        rest=num%2
        t[#t+1]=rest
        num=(num-rest)/2
    end

	return #t>6 and t[7]==1
end

function renderQuestionMark()
	IconSprite:Play("CurseOfBlind")
	IconSprite.Scale = Vector(EIDConfig["Scale"],EIDConfig["Scale"])
	IconSprite:Update()
	IconSprite:Render(Vector(EIDConfig["XPosition"]+5*EIDConfig["Scale"],EIDConfig["YPosition"]+5*EIDConfig["Scale"]), Vector(0,0), Vector(0,0))
end
local function onRender(t)
	local player = Isaac.GetPlayer(0)
	local closest = nil;
    local dist = 10000;
	for i, coin in ipairs(Isaac.GetRoomEntities()) do
		if coin.Type == EntityType.ENTITY_PICKUP and (coin.Variant == PickupVariant.PICKUP_COLLECTIBLE or coin.Variant == PickupVariant.PICKUP_TRINKET or coin.Variant == PickupVariant.PICKUP_TAROTCARD) and coin.SubType>0  then
			local diff = coin.Position:__sub(player.Position);
                if diff:Length() < dist then
                    closest = coin;
                    dist = diff:Length();
                end
		end
    end

	if dist/40>tonumber(EIDConfig["MaxDistance"]) then
		return
	end
		-- 표시기
		if EIDConfig["Indicator"] == "blink" then
		local c = 255-math.floor(255*((closest.FrameCount%40)/40))
		closest:SetColor(Color(1,1,1,1,c,c,c),1,1,false,false)
		closest:Render(Vector(0,0))
		closest:SetColor(Color(1,1,1,1,0,0,0),2,1,false,false)

	elseif EIDConfig["Indicator"] == "border" then
		local c = 255-math.floor(255*((closest.FrameCount%40)/40))
		closest:SetColor(Color(1,1,1,1,c,c,c),1,1,false,false)
		closest:Render(Vector(0,1))
		closest:Render(Vector(0,-1))
		closest:Render(Vector(1,0))
		closest:Render(Vector(-1,0))
		closest:SetColor(Color(1,1,1,1,0,0,0),2,1,false,false)
		closest:Render(Vector(0,0))

	elseif EIDConfig["Indicator"] == "highlight" then
		closest:SetColor(Color(1,1,1,1,255,255,255),1,1,false,false)
		closest:Render(Vector(0,1))
		closest:Render(Vector(0,-1))
		closest:Render(Vector(1,0))
		closest:Render(Vector(-1,0))
		closest:SetColor(Color(1,1,1,1,0,0,0),2,1,false,false)
		closest:Render(Vector(0,0))

	elseif EIDConfig["Indicator"] == "arrow" then
		ArrowSprite:Update()
		local ArrowOffset = Vector(0,-35)
		if closest.Variant ==100 and not closest:ToPickup():IsShopItem() then ArrowOffset = Vector(0,-62) end
		ArrowSprite:Render(Game():GetRoom():WorldToScreenPosition(closest.Position+ArrowOffset), Vector(0,0), Vector(0,0))
	end
	local sprite = Sprite()
    if closest.Type == EntityType.ENTITY_PICKUP then
		-- 장신구 설명
		if closest.Variant == PickupVariant.PICKUP_TRINKET and EIDConfig["DisplayTrinketInfo"] == true then
			if closest.SubType <= 128 then
					sprite:Load("eid/Trinkets/"..closest.SubType..".anm2", true)
					sprite:Play("description")
					sprite:Update()
					sprite:Render(Vector(EIDConfig["XPosition"]+2,EIDConfig["YPosition"]+12), Vector(0,0), Vector(0,0))
			elseif closest.SubType >128 and EIDConfig["EnableEntityDescriptions"] == true then
					sprite:Load("eid/mod/trinkets/"..closest.SubType..".anm2", true)
					sprite:Play("description")
					sprite:Update()
					sprite:Render(Vector(EIDConfig["XPosition"]+2,EIDConfig["YPosition"]+12), Vector(0,0), Vector(0,0))
			else
				Isaac.RenderText(EIDConfig["ErrorMessage"], EIDConfig["XPosition"], EIDConfig["YPosition"], 1, 0.5, 0.5, EIDConfig["Transparency"])
			end
		-- 카드 설명
		elseif closest.Variant == PickupVariant.PICKUP_TAROTCARD then
			if closest.SubType <= 54 then
				if not(EIDConfig["DisplayCardInfo"]== false ) and not(closest:ToPickup():IsShopItem() and EIDConfig["DisplayCardInfoShop"]== false) then
					sprite:Load("eid/Card/"..closest.SubType..".anm2", true)
					sprite:Play("description")
					sprite:Update()
					sprite:Render(Vector(EIDConfig["XPosition"]+2,EIDConfig["YPosition"]+12), Vector(0,0), Vector(0,0))

				end
				elseif closest.SubType >54 and EIDConfig["EnableEntityDescriptions"] == true and not(EIDConfig["DisplayCardInfo"]== false ) and not(closest:ToPickup():IsShopItem() and EIDConfig["DisplayCardInfoShop"]== false) then
					sprite:Load("eid/mod/card/"..closest.SubType..".anm2", true)
					sprite:Play("description")
					sprite:Update()
					sprite:Render(Vector(EIDConfig["XPosition"]+2,EIDConfig["YPosition"]+12), Vector(0,0), Vector(0,0))
			else
				Isaac.RenderText(EIDConfig["ErrorMessage"], EIDConfig["XPosition"], EIDConfig["YPosition"], 1, 0.5, 0.5, EIDConfig["Transparency"])
			end
		-- 저주걸렸을때 반송
		elseif HasCurseBlind() and EIDConfig["DisableOnCurse"]== false then
			renderQuestionMark()
		return
		-- 아이템 설명
		elseif closest.Variant == PickupVariant.PICKUP_COLLECTIBLE then
			if closest.SubType <= 552  then
					sprite:Load("eid/Item/"..closest.SubType..".anm2", true)
					sprite:Play("description")
					sprite:Update()
					sprite:Render(Vector(EIDConfig["XPosition"]+2,EIDConfig["YPosition"]+12), Vector(0,0), Vector(0,0))
			elseif closest.SubType >552 and EIDConfig["EnableEntityDescriptions"] == true then
					sprite:Load("eid/mod/item/"..closest.SubType..".anm2", true)
					sprite:Play("description")
					sprite:Update()
					sprite:Render(Vector(EIDConfig["XPosition"]+2,EIDConfig["YPosition"]+12), Vector(0,0), Vector(0,0))
			else
				Isaac.RenderText(EIDConfig["ErrorMessage"], EIDConfig["XPosition"], EIDConfig["YPosition"], 1, 0.5, 0.5, EIDConfig["Transparency"])
			end
		end
	end
	end




RepairMod:AddCallback(ModCallbacks.MC_POST_RENDER, onRender)
