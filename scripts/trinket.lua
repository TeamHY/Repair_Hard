TRINKET_Bloody_Bandage = Isaac.GetTrinketIdByName("Bloody Bandage")
sopenny_tri = Isaac.GetTrinketIdByName("Soul Penny")
eye_of_god = Isaac.GetTrinketIdByName("Eye of God")

pennyVar = 0

function RepairMod:onNewLevel()
	local player = Isaac.GetPlayer(0)
	if player:HasTrinket(TrinketType.TRINKET_GOLDEN_HORSE_SHOE) then
		Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_TREASURE, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
	end
	if player:HasTrinket(18) then
		if player:GetTrinketRNG(18):RandomInt(2) < (1 + player.Luck) then --0부터 9 / 1 + 럭 미만
			if (Game():GetLevel():GetAngelRoomChance() < 1) then
				Game():GetLevel():AddAngelRoomChance(1)
				player:TryRemoveTrinket(18)
			end
		end
	end
	if player:HasTrinket(36) then
		if player:GetTrinketRNG(36):RandomInt(10) < (3 + player.Luck) then --0부터 9 / 1 + 럭 미만
			if player:GetTrinketRNG(36):RandomInt(2) < 1 then --0부터 1 / 1 미만
				Isaac.Spawn(5, 30, 1, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			else -- 1미만 아니면
				Isaac.Spawn(5, 30, 2, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			end
		end
	end
	if player:HasTrinket(38) then
		if player:GetTrinketRNG(36):RandomInt(10) < (3 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(5, 10, 3, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(17) then
		if player:GetTrinketRNG(17):RandomInt(10) < (3 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(5, 10, 6, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(110) then
		if player:GetTrinketRNG(110):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(5, 300, 10, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(111) then
		if player:GetTrinketRNG(111):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(5, 300, 18, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(5) then
		if player:GetTrinketRNG(5):RandomInt(10) < (3 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(5, 100, 208, Isaac.GetFreeNearPosition(player.Position, 85), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(72) then
		if player:GetTrinketRNG(72):RandomInt(10) < (4 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(5, 90, 0, Isaac.GetFreeNearPosition(player.Position, 75), Vector(0, 0), player)
		end
	end
end

function RepairMod:EnterRoom()
	local player = Isaac.GetPlayer(0)
	if player:HasTrinket(29) then
		if player:GetTrinketRNG(29):RandomInt(2) < (1 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(3, 43, 0, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(48) then
		if player:GetTrinketRNG(48):RandomInt(10) < (2 + player.Luck) then --0부터 9 / 1 + 럭 미만
			player:UseActiveItem(35,false,true,false,false)
		end
	end
	if player:HasTrinket(70) then
		if player:GetTrinketRNG(70):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 1 + 럭 미만
			Isaac.Spawn(3, 73, 0, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasTrinket(118) then
		if player:GetTrinketRNG(118):RandomInt(10) < (10 + player.Luck) then --0부터 9 / 1 + 럭 미만
			player.CanFly = true
		end
	end
end

function RepairMod:ShootTear(tear)
	local player = Isaac.GetPlayer(0)
	if player:HasTrinket(31) then
		if player:GetTrinketRNG(31):RandomInt(10) < (3 + player.Luck) then --0부터 9 / 1 + 럭 미만
			tear.TearFlags = tear.TearFlags|TearFlags.TEAR_PIERCING
		end
	end
	if player:HasTrinket(95) then
		if player:GetTrinketRNG(95):RandomInt(100) < (1 + player.Luck) then --0부터 9 / 1 + 럭 미만
			tear.TearFlags = tear.TearFlags|TearFlags.TEAR_HORN
		end
	end
	if player:HasTrinket(99) then
		if player:GetTrinketRNG(99):RandomInt(20) < (4 + player.Luck) then --0부터 9 / 1 + 럭 미만
			tear.TearFlags = tear.TearFlags|TearFlags.TEAR_BOUNCE
		end
	end
	if player:HasTrinket(125) then
		if player:GetTrinketRNG(125):RandomInt(20) < (4 + player.Luck) then --0부터 9 / 1 + 럭 미만
			tear.TearFlags = tear.TearFlags|TearFlags.TEAR_JACOBS
		end
	end
	if player:HasTrinket(127) then
		if player:GetTrinketRNG(127):RandomInt(20) < (10 + player.Luck) then --0부터 9 / 1 + 럭 미만
			tear.TearFlags = tear.TearFlags|TearFlags.TEAR_HOMING
		end
	end
	if player:HasTrinket(eye_of_god) and player:HasCollectible(331) == false then
		player.TearFlags = player.TearFlags&~TearFlags.TEAR_GLOW
		if player:GetTrinketRNG(eye_of_god):RandomInt(20) < (5 + player.Luck) then --0부터 9 / 1 + 럭 미만
			player.TearFlags = player.TearFlags|TearFlags.TEAR_GLOW
		end
	end
end

function RepairMod:onHit(entity,amt,flags,src,i_frames)
    local player = Isaac.GetPlayer(0)
    if player:HasTrinket(TRINKET_Bloody_Bandage) and flags == DamageFlag.DAMAGE_CURSED_DOOR  then
       return false
	end
	if player:HasTrinket(104) then
		if player:GetTrinketRNG(104):RandomInt(2) == 1 then
			player:UseActiveItem(515,false,true,false,false)
			player:TryRemoveTrinket(104)
		end
	end
	if player:HasTrinket(33) then
		if Trinket33 < 3 then
			player:AddCollectible(100,0,false)
			Trinket33 = Trinket33 + 1
		end
		if Trinket33 == 3 then
			Trinket33 = 0
			player:TryRemoveTrinket(33)
		end
	end
end
RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.onHit, EntityType.ENTITY_PLAYER)

function RepairMod:TrinketPostUpdate()
	local player = Isaac.GetPlayer(0)
	if player:HasTrinket(sopenny_tri) then
		if player:GetNumCoins() > pennyVar and player:GetTrinketRNG(sopenny_tri):RandomInt(4) == 3 then
			Isaac.Spawn(5, 10, 8, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	pennyVar = player:GetNumCoins()
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, RepairMod.onNewLevel)
RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, RepairMod.EnterRoom)
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.TrinketPostUpdate)
RepairMod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, RepairMod.ShootTear)