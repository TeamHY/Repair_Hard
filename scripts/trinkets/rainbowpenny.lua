TrinketType.TRINKET_RAINBOW_PENNY = Isaac.GetTrinketIdByName("Rainbow Penny")

RepairMod.RainbowPenny = {
	function(pickup, ...) -- Bloody Penny
		if math.random(2) == 2 then
			Isaac.Spawn(5, 10, 2, Game():GetRoom():FindFreePickupSpawnPosition(pickup.Position, 40, false), Vector(0, 0), nil)
		end
	end,
	function(pickup, ...) -- Burnt Penny
		if math.random(2) == 2 then
			Isaac.Spawn(5, 40, 1, Game():GetRoom():FindFreePickupSpawnPosition(pickup.Position, 40, false), Vector(0, 0), nil)
		end
	end,
	function(_, player) -- Butt Penny
		Game():Fart(player.Position, 40, player, 1, 0)
	end,
	function(_, player) -- Counterfeit Penny
		if math.random(2) == 2 then
			player:AddCoins(1)
		end
	end,
	function(pickup, ...) -- Flat Penny
		if math.random(2) == 2 then
			Isaac.Spawn(5, 30, 1, Game():GetRoom():FindFreePickupSpawnPosition(pickup.Position, 40, false), Vector(0, 0), nil)
		end
	end,
	function(_, player) -- Rotten Penny
		Isaac.Spawn(3, 43, 0, player.Position, Vector(0, 0), player):ClearEntityFlags(EntityFlag.FLAG_APPEAR)
	end,
	function(_, player) -- Grubby Penny
		Isaac.Spawn(3, 73, 0, player.Position, Vector(0, 0), player):ClearEntityFlags(EntityFlag.FLAG_APPEAR)
	end,
}

RepairMod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, function(_, pickup, collider)
	if collider.Type == 1 and pickup.Variant == 20 and pickup.SubType ~= 6 then
		local p = collider:ToPlayer()

		if p:HasTrinket(TrinketType.TRINKET_RAINBOW_PENNY) then
			local num = 1
			if p:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX) then num = 2 end

			math.randomseed(pickup.InitSeed + TrinketType.TRINKET_RAINBOW_PENNY)
			for i = 1, num do
				RepairMod.RainbowPenny[math.random(#RepairMod.RainbowPenny)](pickup, p)
			end
		end
	end
end)
