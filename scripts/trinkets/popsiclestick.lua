TrinketType.TRINKET_POPSICLE_STICK = Isaac.GetTrinketIdByName("Popsicle Stick")

local badpills = {
	[PillEffect.PILLEFFECT_HEALTH_DOWN] = true,
	[PillEffect.PILLEFFECT_RANGE_DOWN] = true,
	[PillEffect.PILLEFFECT_SPEED_DOWN] = true,
	[PillEffect.PILLEFFECT_TEARS_DOWN] = true,
	[PillEffect.PILLEFFECT_LUCK_DOWN] = true,
	[PillEffect.PILLEFFECT_BAD_TRIP] = true,
	[PillEffect.PILLEFFECT_AMNESIA] = true,
	[PillEffect.PILLEFFECT_QUESTIONMARK] = true,
	[PillEffect.PILLEFFECT_ADDICTED] = true,
	[PillEffect.PILLEFFECT_IM_EXCITED] = true,
	[PillEffect.PILLEFFECT_PARALYSIS] = true,
	[PillEffect.PILLEFFECT_RETRO_VISION] = true,
	[PillEffect.PILLEFFECT_WIZARD] = true,
	[PillEffect.PILLEFFECT_X_LAX] = true,
}

RepairMod:AddCallback(ModCallbacks.MC_USE_PILL, function(_, e)
	local p = GetPlayerUsingItem()
	if p:HasTrinket(TrinketType.TRINKET_POPSICLE_STICK) and badpills[e] then
		Isaac.Spawn(5, 70, 0, Game():GetRoom():FindFreePickupSpawnPosition(p.Position, 40, false), Vector(0, 0), nil)
		if p:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX) then
			Isaac.Spawn(5, 70, 0, Game():GetRoom():FindFreePickupSpawnPosition(p.Position, 40, false), Vector(0, 0), nil)
		end
	end
end)

function GetPlayerUsingItem() -- Actives, Cards, Runes, and Pills
	for i = 1, Game():GetNumPlayers() - 1 do
    	local p = Isaac.GetPlayer(i)
 	    if Input.IsActionTriggered(ButtonAction.ACTION_ITEM, p.ControllerIndex) or Input.IsActionTriggered(ButtonAction.ACTION_PILLCARD, p.ControllerIndex) then
    		return p
	    end
	end
	return Isaac.GetPlayer(0)
end
