function HasPassive(id)
	local player = Isaac.GetPlayer(0);

	if player:GetData()["_"..toString(id)] == nil then
		player:GetData()["_"..toString(id)] = 1;
		return true
	elseif player:GetData()["_"..toString(id)] ~= nil then
		if player:GetData()["_"..toString(id)] < player:GetCollectibleNum(id) then
			player:GetData()["_"..toString(id)] = player:GetData()["_"..toString(id)] +1
			return true
		elseif player:GetData()["_"..toString(id)] > player:GetCollectibleNum(id) then
			player:GetData()["_"..toString(id)] = player:GetCollectibleNum(id)
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
