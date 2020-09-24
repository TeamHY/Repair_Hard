function HasPassive(id)
	local player = Isaac.GetPlayer(0);

	if player:GetData()["_"..toString(id)] == nil then
		player:GetData()["_"..toString(id)] = true;
		return true
	else
		return false
	end
end

function Random(entity, min, max)
	return entity:GetDropRNG():RandomInt(max-min+1)+min
end
