function HasPassive(id)
	local player = Isaac.GetPlayer(0);

	if player:GetData()["_"..tostring(id)] == nil and player:HasCollectible(id) then
		player:GetData()["_"..tostring(id)] = 1;
		return true
	elseif player:GetData()["_"..tostring(id)] ~= nil then
		if player:GetData()["_"..tostring(id)] < player:GetCollectibleNum(id) then
			player:GetData()["_"..tostring(id)] = player:GetData()["_"..tostring(id)] +1
			return true
		elseif player:GetData()["_"..tostring(id)] > player:GetCollectibleNum(id) then
			player:GetData()["_"..tostring(id)] = player:GetCollectibleNum(id)
			return false
		end
	else
		return false
	end
end

function rangeRandom(min, max)
	local player = Isaac.GetPlayer(0);
	return player:GetDropRNG():RandomInt(max-min+1)+min
end

function TriRNG(trinket, maxLuck)
	player = Isaac.GetPlayer(0)
    if( player:GetTrinketRNG(trinket):RandomInt(math.max(maxLuck-math.max(0,math.floor(player.Luck)),0)) == 0 ) then
      return true
    else
      return false
    end
end

function WasteCard(CardID, index)
	local player = Isaac.GetPlayer(0)
	player:SetCard(index, 0)
	player:UseCard(CardID)
end

function Discover(a,b,c)
	local player = Isaac.GetPlayer(0)
	for n=1, 30 do
		if player:GetData()["_disc"..tostring(n)] == nil then
			player:GetData()["_disc"..tostring(n)] = 0
			player:GetData()["_disc"..tostring(n).."item1"] = a
			player:GetData()["_disc"..tostring(n).."item2"] = b
			player:GetData()["_disc"..tostring(n).."item3"] = c
			return
		end
	end
end

function RepairMod:DiscoverRun(player)
	for n=1, 30 do
		if player:GetData()["_disc"..tostring(n)] ~= nil then
			player:GetData()["_disc"..tostring(n)] = player:GetData()["_disc"..tostring(n)] + 1
			if player:GetData()["_disc"..tostring(n)] == 5 then
				local item1 = Isaac.Spawn(5, 100, player:GetData()["_disc"..tostring(n).."item1"], Isaac.GetFreeNearPosition(Isaac.GetFreeNearPosition(player.Position, 0) + Vector(0, 28), 0), Vector(0, 0), player)
				item1:ToPickup().TheresOptionsPickup = true
				Isaac.Spawn(1000, 15, 0, item1.Position, Vector(0, 0), player)
			end
			if player:GetData()["_disc"..tostring(n)] == 15 then
				local item2 = Isaac.Spawn(5, 100, player:GetData()["_disc"..tostring(n).."item2"], Isaac.GetFreeNearPosition(Isaac.GetFreeNearPosition(player.Position, 0) + Vector(-56, 28), 0), Vector(0, 0), player)
				item2:ToPickup().TheresOptionsPickup = true
				Isaac.Spawn(1000, 15, 0, item2.Position, Vector(0, 0), player)
			end
			if player:GetData()["_disc"..tostring(n)] == 25 then
				local item3 = Isaac.Spawn(5, 100, player:GetData()["_disc"..tostring(n).."item3"], Isaac.GetFreeNearPosition(Isaac.GetFreeNearPosition(player.Position, 0) + Vector(56, 28), 0), Vector(0, 0), player)
				item3:ToPickup().TheresOptionsPickup = true
				Isaac.Spawn(1000, 15, 0, item3.Position, Vector(0, 0), player)
				player:GetData()["_disc"..tostring(n)] = nil
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, RepairMod.DiscoverRun)
