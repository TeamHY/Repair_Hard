ocul = require "scripts.customs.oculus"
volt = require "scripts.customs.120volt"

function RepairMod:GiveItem()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(start_item) then
		local tempNum = player:GetCollectibleRNG(start_item):RandomInt(3)
		if tempNum == 0 then
			player:AddCollectible(46,0,true)
		elseif tempNum == 1 then
			player:AddCollectible(355,0,true)
		elseif tempNum == 2 then
			player:AddCollectible(455,0,true)
		end
		player:RemoveCollectible(start_item)
	end

	if player:HasCollectible(start_item2) then
		local tempNum = player:GetCollectibleRNG(start_item2):RandomInt(4)
		if tempNum == 0 then
			player:AddCollectible(443,0,true)
		elseif tempNum == 1 then
			player:AddCollectible(496,0,true)
		elseif tempNum == 2 then
			player:AddCollectible(558,0,true)
		elseif tempNum == 3 then
			player:AddCollectible(628,0,true)
		end
		player:RemoveCollectible(start_item2)
	end

	if player:HasCollectible(Absguppy_item)==true then
		if player:HasCollectible(134)==false then
			player:AddCollectible(134,0,true)
		end
		if player:HasCollectible(187)==false then
			player:AddCollectible(187,0,true)
		end
		if player:HasCollectible(212)==false then
			player:AddCollectible(212,0,true)
		end
	end

	if player:HasCollectible(goldSpawn_item) then --랭크업 rank
		if Game():GetFrameCount()%5400 == 0 then
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_TREASURE, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasCollectible(seventh_item) then
		if Game():GetFrameCount()%7200 == 0 then
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_CURSE, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasCollectible(limited_item) then
		if Game():GetFrameCount()%7200 == 0 then
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasCollectible(soulshave_item) then
		if Game():GetFrameCount()%5400 == 0 then
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_SHOP, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasCollectible(rank_raid_item) then
		if Game():GetFrameCount()%5400 == 0 then
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_LIBRARY, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end
	if player:HasCollectible(chry_item) then
		player:Die()
	end
end
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.GiveItem)

function RepairMod:RemoveItem()
	local player = Isaac.GetPlayer(0)
	local removeFly = {20, 82, 159, 179, 184, 185}
	if player:HasCollectible(icar_item) then
		Game():GetItemPool():RemoveCollectible(20)
		Game():GetItemPool():RemoveCollectible(82)
		Game():GetItemPool():RemoveCollectible(159)
		Game():GetItemPool():RemoveCollectible(179)
		Game():GetItemPool():RemoveCollectible(184)
		Game():GetItemPool():RemoveCollectible(185)
		for i=1, #removeFly do
			if player:HasCollectible(removeFly[i]) then
				player:RemoveCollectible(removeFly[i])
			end
		end
	end
	if player:GetCollectibleNum(summangguppy_item) ~= CollectibleSummang then
		if player:GetCollectibleNum(summangguppy_item) > CollectibleSummang then
			player:UseActiveItem(Isaac.GetItemIdByName("Cleaner"),false,true,false,false)
		end
		CollectibleSummang = player:GetCollectibleNum(summangguppy_item)
		Save()
	end
end
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.RemoveItem)

function RepairMod:GivePick()
	local player = Isaac.GetPlayer(0)
	if player:GetCollectibleNum(455) ~= Collectible455 then
		if player:GetCollectibleNum(455) > Collectible455 then
			local randomCoin = player:GetCollectibleRNG(455):RandomInt(8)
			for i = 1, randomCoin do
				Isaac.Spawn(5, 20, 5, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			end
		end
		Collectible455 = player:GetCollectibleNum(455)
		Save()
	end

	if player:GetCollectibleNum(392) ~= Collectible392 then
		if player:GetCollectibleNum(392) > Collectible392 then
			Isaac.Spawn(5, 100, 0, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
		Collectible392 = player:GetCollectibleNum(392)
		Save()
	end

	if player:GetCollectibleNum(212) ~= Collectible212 then
		if player:GetCollectibleNum(212) > Collectible212 then
			Isaac.Spawn(5, 300, 46, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
		Collectible212 = player:GetCollectibleNum(212)
		Save()
	end
	if player:GetData()._sancVar ~= nil then --아티팩트 신지
      if (Game():GetFrameCount()-player:GetData()._sancTime)%(30*120) == 0 and Game():GetFrameCount()~= player:GetData()._sancTime then --먹은직후 30초마다 서큐 소환
         player:AddCollectible(417,0,true)
      end
   end
end
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE,RepairMod.GivePick)

function RepairMod:VarChange()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(violeta_item) then
		violetaVar = true
	else
		violetaVar = false
	end

	if player:HasCollectible(prometheus_item) then
		if prometheusVar == false then
			Game():GetItemPool():RemoveCollectible(260)
			while player:GetCollectibleNum(260) > 0 do
				player:RemoveCollectible(260)
			end
			prometheusVar = true
		end
	else
		prometheusVar = false
	end

	if player:HasCollectible(art_sanc_item) and player:GetData()._sancVar == nil then
		player:GetData()._sancTime = Game():GetFrameCount()
		player:GetData()._sancVar = true
		Save()
	end
	if player:HasCollectible(gun_platinum) and player:GetData()._platinumRoomCheck ~= nil then
		if player:GetData()._platinumRoomCheck == true and Game():GetRoom():IsClear() == true then
			if player:GetData()._platinumVar == nil then
				player:GetData()._platinumVar = 0.1
			else
				player:GetData()._platinumVar = player:GetData()._platinumVar + 0.1
			end
			--Isaac.ConsoleOutput(player:GetData()._platinumVar .. "\n")
			player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
			player:EvaluateItems()
			player:GetData()._platinumRoomCheck = false
		end
	end
	if player:HasCollectible(304) then
		if player:GetData()._libraVar == nil then
			player:GetData()._libraTime = Game():GetFrameCount()
			player:GetData()._libraVar = 0
		elseif player:GetData()._libraTime - Game():GetFrameCount() % 30 == 0 then
			player:GetData()._libraVar = player:GetData()._libraVar + 0.1
		end
		player:AddCacheFlags(CacheFlag.CACHE_RANGE)
		player:EvaluateItems()
	end
end
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.VarChange)

function RepairMod:MasperP()
   local player = Isaac.GetPlayer(0)
   if player:HasCollectible(master_p_item)==true then
      while player:GetCollectibleNum(139)<1 do
         player:AddCollectible(139,0,true)
      end
      while player:GetCollectibleNum(416)<1 do
         player:AddCollectible(416,0,true)
      end
      while player:GetCollectibleNum(534)<1 do
         player:AddCollectible(534,0,true)
      end
        Game():GetItemPool():RemoveCollectible(139)
   		Game():GetItemPool():RemoveCollectible(416)
   		Game():GetItemPool():RemoveCollectible(454)
   		Game():GetItemPool():RemoveCollectible(458)
   		Game():GetItemPool():RemoveCollectible(534)
   end
end
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.MasperP)

function RepairMod:ChangeStat()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(randomMulti_item) and randomMultiVar == 0 then
		randomMultiVar = player:GetCollectibleRNG(randomMulti_item):RandomInt(11)
		randomMultiVar = 1 + (randomMultiVar*0.1)
		Save()
	end
	if player:HasCollectible(oath_item) or player:HasCollectible(eyes_item) then
		player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
		player:EvaluateItems()
	end
	if PowerBondTime > 0 then
		PowerBondTime = PowerBondTime - 1
		Save()
	else
		player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
		player:EvaluateItems()
	end
	if LimiterTime > 0 then
		LimiterTime = LimiterTime - 1
		Save()
	else
		player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
		player:EvaluateItems()
	end
	if DeathNoteVar ~= 0 then
		if (Game():GetFrameCount() - DeathNoteVar) > 7200 then
			player:Die()
		end
	elseif player:HasCollectible(death_note_item) and Game():GetLevel():GetStage() > 8 then
		player:RemoveCollectible(death_note_item)
	end
	if QuickChaosVar ~= 0 then
		if (Game():GetFrameCount() - QuickChaosVar) > 1800 then
			player:RemoveCollectible(402)
			QuickChaosVar = 0
			Save()
		end
	end
	if player:HasCollectible(46) then
		if LuckyFootTime == 0 then
			LuckyFootTime = Game():GetFrameCount()
			Save()
		else
			if (Game():GetFrameCount() - LuckyFootTime)%5400 == 0 then
				player:AddCacheFlags(CacheFlag.CACHE_LUCK)
				player:EvaluateItems()
			end
		end
	end

	if player:HasCollectible(rank_phan_item) and player:GetData()._PHvar == nil then
		if player:GetData()._PHmult == nil then
			player:GetData()._PHmult = 0
		end

		local delay = (player:GetNumCoins()-(player:GetNumCoins()%10))/10
		player:AddCoins(-10*delay)
		player:GetData()._PHmult = delay

		player:GetData()._PHvar = true

		player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
		player:EvaluateItems()
	end
end
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.ChangeStat)

function RepairMod:onDamage(entity, damage, damageFlag, damageSource, DamageCountdownFrames)
	local player = Isaac.GetPlayer(0)
	local boomItem = {52,257,272,273,371,418,526} -- 폭발 면역 아이템 추가

	if player:HasCollectible(socks_item) and damageFlag == DamageFlag.DAMAGE_CURSED_DOOR then
		return false
	end

	for i=1, #boomItem do
		if player:HasCollectible(boomItem[i]) then
			if damageFlag == DamageFlag.DAMAGE_EXPLOSION then
				return false
			end
		end
	end

	if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Midas") then
		player:AddCoins(rangeRandom(1,5)*-1)
	end

	if player:HasCollectible(178) then
		HolyWaterHit = HolyWaterHit + 1
		if HolyWaterHit == 15 then
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Holy Water")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			HolyWaterHit = 0
		end
	end

	if player:HasCollectible(148) then
		--[[for i=1, 1 do
			Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BLUE_FLY, 0, player.Position, Vector(0, 0), player)
		end]]
		if inf1_Hit < 7 then
			inf1_Hit = inf1_Hit + 1
		end
		if inf1_Hit == 7 then
			player:AddCollectible(234,0,true)
			inf1_Hit = inf1_Hit + 1
		end
	end

	if player:HasCollectible(262) then
		if inf1_Hit < 5 then
			inf1_Hit = inf1_Hit + 1
		end
		if inf1_Hit == 5 then
			player:AddCollectible(328,0,true)
			inf1_Hit = inf1_Hit + 1
		end
	end

	if player:HasCollectible(211) then
		for i=1, 15 do
			Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BLUE_SPIDER, 0, player.Position, Vector(0, 0), player)
		end
	end
	Save()
end

RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.onDamage, EntityType.ENTITY_PLAYER)

function RepairMod:HitSpawn(dmg_target, dmg_amount, dmg_source, dmg_dealer)
    local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()

	if player:HasCollectible(summangguppy_item) and dmg_target:IsVulnerableEnemy() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR then
			Isaac.Spawn(3, 43, 5, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end

	if player:HasCollectible(gal_item) and dmg_target:IsVulnerableEnemy() and dmg_target:IsBoss() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR or dmg_dealer.Type == EntityType.ENTITY_LASER or dmg_dealer.Type == EntityType.ENTITY_KNIFE then
			dmg_target:TakeDamage(dmg_amount*0.3, 0, EntityRef(player), 1)
		end
	end
end
RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.HitSpawn)

function RepairMod:Mission()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(m_Amnesia_item) then
		Game():GetLevel():AddCurse(LevelCurse.CURSE_OF_THE_LOST,true)
		player:RemoveCollectible(m_Amnesia_item)
	end
	if player:HasCollectible(m_Blind_item) then
		Game():GetLevel():AddCurse(LevelCurse.CURSE_OF_BLIND,true)
		player:RemoveCollectible(m_Blind_item)
	end
	if player:HasCollectible(m_Pickup_item) then
		local tempNum = player:GetCollectibleRNG(m_Pickup_item):RandomInt(3)
		if tempNum == 0 then
			player:AddCoins((player:GetCollectibleRNG(m_Pickup_item):RandomInt(10)+1)*-1)
		elseif tempNum == 1 then
			player:AddBombs((player:GetCollectibleRNG(m_Pickup_item):RandomInt(10)+1)*-1)
		elseif tempNum == 2 then
			player:AddKeys((player:GetCollectibleRNG(m_Pickup_item):RandomInt(10)+1)*-1)
		end
		player:RemoveCollectible(m_Pickup_item)
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.Mission)

function RepairMod:SolUpdate()
	local player = Isaac.GetPlayer(0)
	local level = Game():GetLevel()

	rooms = level:GetRooms()



		for i=0,rooms.Size - 1 do
			local roomDesc = rooms:Get(i)
			local roomIndex = roomDesc.SafeGridIndex
				if roomDesc.Data then
					if (roomDesc.Data.Type == RoomType.ROOM_BOSS and roomDesc.Clear and player:GetData()._solEffectVar ~= nil) then
						level:ShowMap()
						player:GetData()._solEffectVar = nil
					end
				end
		end

end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.SolUpdate)

function RepairMod:SolNewLevel()
	local player = Isaac.GetPlayer(0)
	local level = Game():GetLevel()

	if (player:GetData()._reseeded ~= nil) then
		if (player:GetData()._solnewlevel == nil) then
			player:GetData()._solnewlevel = 0
		end
		if (player:GetData()._solnewlevel < player:GetData()._reseeded) then
			player:GetData()._solnewlevel = player:GetData()._solnewlevel + 1
			return
		end
	end

		rooms = level:GetRooms()

	if player:HasCollectible(sol_item) then

		for i=0,rooms.Size - 1 do
			local roomDesc = rooms:Get(i)
			local roomIndex = roomDesc.SafeGridIndex
				if roomDesc.Data then
					if roomDesc.Data.Type == RoomType.ROOM_BOSS then
						local rRoom = level:GetRoomByIdx(roomIndex)
				    rRoom.DisplayFlags = 7
					end
				end
		end
		level:UpdateVisibility()

		player:GetData()._solEffectVar = true
	end

end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, RepairMod.SolNewLevel)

function RepairMod:Monstrance()
    local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()

	if player:HasCollectible(monstrance_item) then
		for i = 1, #entities do
			if entities[i]:IsVulnerableEnemy() then
				if ((player.Position.X - entities[i].Position.X)^2 + (player.Position.Y - entities[i].Position.Y)^2)^0.5 <= 180 then
					entities[i]:TakeDamage(player.Damage*0.15, 0, EntityRef(player), 1)
				end
			end
		end
	end

	if player:HasCollectible(468) then
		for i = 1, #entities do
			if entities[i].Type == 3 and entities[i].Variant == 106 then
				for j = 1, #entities do
					if entities[j]:IsVulnerableEnemy() then
						if ((entities[i].Position.X - entities[j].Position.X)^2 + (entities[i].Position.Y - entities[j].Position.Y)^2)^0.5 <= 120 then
							entities[j]:TakeDamage(player.Damage*0.1, 0, EntityRef(player), 1)
						end
					end
				end
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.Monstrance)

function RepairMod:randomAtt()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(randomAttack_item) then
		if randomAttack == 0 then
			randomAttack = player:GetCollectibleRNG(randomAttack_item):RandomInt(#attackType)+1
			Save()
			player:AddCollectible(attackType[randomAttack],0,true)
		end
	end
	if player:HasCollectible(randomFamiliar_item) then
		if randomFamiliar == 0 then
			randomFamiliar = player:GetCollectibleRNG(randomFamiliar_item):RandomInt(#familiarType)+1
			Save()
			player:AddCollectible(familiarType[randomFamiliar],0,true)
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.randomAtt)

function RepairMod:onNewLevel()
	local player = Isaac.GetPlayer(0)

	if (player:GetData()._reseeded ~= nil) then
		if (player:GetData()._customnewlevel == nil) then
			player:GetData()._customnewlevel = 0
		end
		if (player:GetData()._customnewlevel < player:GetData()._reseeded) then
			player:GetData()._customnewlevel = player:GetData()._customnewlevel + 1
			return
		end
	end

	if player:HasCollectible(randomAttack_item) then
		player:RemoveCollectible(attackType[randomAttack])
		randomAttack = player:GetCollectibleRNG(randomAttack_item):RandomInt(#attackType)+1
		Save()
		player:AddCollectible(attackType[randomAttack],0,true)
	end
	if player:HasCollectible(randomFamiliar_item) then
		randomFamiliar = player:GetCollectibleRNG(randomFamiliar_item):RandomInt(#familiarType)+1
		Save()
		player:AddCollectible(familiarType[randomFamiliar],0,true)
	end
	if player:HasCollectible(355) then
		PearlLuck = PearlLuck + 1
		player:AddCacheFlags(CacheFlag.CACHE_LUCK)
		player:EvaluateItems()
		Save()
	end
	if player:HasCollectible(newStageClicker_item) then
		player:UseActiveItem(482,false,true,false,false)
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, RepairMod.onNewLevel)

function RepairMod:EnterRoom()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(gun_platinum) then
		if Game():GetRoom():IsClear() == false then
			player:GetData()._platinumRoomCheck = true
		else
			player:GetData()._platinumRoomCheck = false
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, RepairMod.EnterRoom)

function RepairMod:UseItem(itemname,rng)
	local player = Isaac.GetPlayer(0)
	if itemname == Isaac.GetItemIdByName("Blessing") then
		if player:GetNumCoins() >= 30 then
			player:AddCoins(-30)
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			player:RemoveCollectible(Isaac.GetItemIdByName("Blessing"))
			return true
		end
	elseif itemname == Isaac.GetItemIdByName("Unholy") then
		if player:GetNumCoins() >= 30 then
			player:AddCoins(-30)
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_CURSE, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Blessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			player:RemoveCollectible(Isaac.GetItemIdByName("Unholy"))
			return true
		end
	elseif itemname == Isaac.GetItemIdByName("UnBlessing") then
		if player:GetNumCoins() >= 30 then
			player:AddCoins(-30)
			if player:GetCollectibleRNG(m_Pickup_item):RandomInt(2) == 0 then
				Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_CURSE, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("UnBlessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			else
				Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("UnBlessing")):GetSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			end
			player:RemoveCollectible(Isaac.GetItemIdByName("UnBlessing"))
			return true
		end
	elseif itemname == Isaac.GetItemIdByName("Chaos Card") then
		player:AddCard(Card.CARD_CHAOS)
		player:RemoveCollectible(Isaac.GetItemIdByName("Chaos Card"))
		return true
	elseif itemname == Isaac.GetItemIdByName("Religiosity") then
		if player:GetSoulHearts() >= 12 then
			player:AddSoulHearts(-12)
			for i=1 , 2 do
				Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, player:GetCollectibleRNG(Isaac.GetItemIdByName("Religiosity")):GetSeed()),Isaac.GetFreeNearPosition(player.Position,50), Vector(0, 0), player)
			end
			player:RemoveCollectible(Isaac.GetItemIdByName("Religiosity"))
		end
		return true
	elseif itemname == Isaac.GetItemIdByName("Greed") then
		player:RemoveCollectible(Isaac.GetItemIdByName("Greed"))
		player:RemoveCollectible(526)
		player:RemoveCollectible(418)
		player:RemoveCollectible(375)
		player:RemoveCollectible(273)
		player:RemoveCollectible(371)
		player:RemoveCollectible(257)
		player:RemoveCollectible(272)
		player:AnimateTeleport(true)
		Isaac.ExecuteCommand("goto s.error")
		return false
	elseif itemname == Isaac.GetItemIdByName("Runtime Error") then
		player:RemoveCollectible(Isaac.GetItemIdByName("Runtime Error"))
		player:AnimateTeleport(true)
		Game():ChangeRoom(Game():GetLevel():QueryRoomTypeIndex(RoomType.ROOM_ERROR, true, RNG()))
		return false
	elseif itemname == Isaac.GetItemIdByName("Master Key") then
		player:RemoveCollectible(Isaac.GetItemIdByName("Master Key"))
		player:RemoveCollectible(526)
		player:RemoveCollectible(418)
		player:RemoveCollectible(375)
		player:RemoveCollectible(273)
		player:RemoveCollectible(371)
		player:RemoveCollectible(257)
		player:RemoveCollectible(272)
		player:AnimateTeleport(true)
		Isaac.ExecuteCommand("goto s.bossrush")
		return false
	elseif itemname == Isaac.GetItemIdByName("No!") then
		player:RemoveCollectible(Isaac.GetItemIdByName("No!"))
		Isaac.Spawn(5, 350, 88, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		return true
   elseif itemname == Isaac.GetItemIdByName("Hell Mode") then
      player:RemoveCollectible(Isaac.GetItemIdByName("Hell Mode"))
      hardModeVar = 1
      return true
   elseif itemname == Isaac.GetItemIdByName("Easy Mode") then
      player:RemoveCollectible(Isaac.GetItemIdByName("Easy Mode"))
      hpMaxLimit = 1
      return true
    elseif itemname == Isaac.GetItemIdByName("Left Foot") then
		Isaac.Spawn(5, 360, 0, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0,0), player)
		return true
	elseif itemname == Isaac.GetItemIdByName("Rank-Up-Magic Death Double Force") then
		player:RemoveCollectible(Isaac.GetItemIdByName("Rank-Up-Magic Death Double Force"))
		Game():AddDevilRoomDeal()
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_JOKER, player.Position, Vector(math.random(-5,5),math.random(-5,5)), player)
		for i=1,4 do
			Isaac.Spawn(5, 360, 0, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0,0), player)
		end
		return true
	elseif itemname == Isaac.GetItemIdByName("Cleaner") then
		player:RemoveCollectible(52) -- 닥터 제거
		player:RemoveCollectible(68) -- 테크 제거
		player:RemoveCollectible(104) -- 테크 제거
		player:RemoveCollectible(114) -- 칼 제거
		player:RemoveCollectible(118) -- 혈사 제거
		player:RemoveCollectible(149) -- 구토 제거
		player:RemoveCollectible(152) -- 테크2 제거
		player:RemoveCollectible(168) -- 에픽 제거
		player:RemoveCollectible(233) -- 플래닛 제거
		player:RemoveCollectible(329) -- 루도비코 제거
		player:RemoveCollectible(395) -- 테크엑스 제거
		player:RemoveCollectible(67) -- 테크엑스 제거
		player:RemoveCollectible(269) -- 테크엑스 제거
		player:RemoveCollectible(533) -- 테크엑스 제거
		player:RemoveCollectible(sco_item) -- 극 전갈
		player:RemoveCollectible(randomAttack_item) -- 극 전갈
		player:RemoveCollectible(Isaac.GetItemIdByName("Cleaner"))
		return true
	elseif itemname == 36 then
		if PoopVar == false then
			Isaac.Spawn(5, 300, 45, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
			PoopVar = true
		end
		return true
	elseif itemname == power_bond_item then
		local tempCoins = math.floor(player:GetNumCoins()/2)
		if tempCoins > 0 then
			if tempCoins < 10 then
				PowerBondTime = tempCoins*30
				player:AddCoins((tempCoins*2)*-1)
			else
				PowerBondTime = 300
				player:AddCoins(-20)
			end
			player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
			player:EvaluateItems()
			player:RemoveCollectible(power_bond_item)
			return true
		else
			return false
		end
	elseif itemname == limiter_item then
		local tempCoins = math.floor(player:GetNumCoins()/2)
		if tempCoins > 0 then
			if tempCoins < 10 then
				LimiterTime = tempCoins*30
				player:AddCoins((tempCoins*2)*-1)
			else
				LimiterTime = 300
				player:AddCoins(-20)
			end
			player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
			player:EvaluateItems()
			player:RemoveCollectible(limiter_item)
			return true
		else
			return false
		end
	elseif itemname == death_note_item then
		player:RemoveCollectible(21)
		player:RemoveCollectible(54)
		player:RemoveCollectible(246)
		player:RemoveCollectible(260)
		player:RemoveCollectible(333)
		player:RemoveCollectible(Isaac.GetItemIdByName("Solar"))
		Game():GetItemPool():RemoveCollectible(21)
		Game():GetItemPool():RemoveCollectible(54)
		Game():GetItemPool():RemoveCollectible(246)
		Game():GetItemPool():RemoveCollectible(260)
		Game():GetItemPool():RemoveCollectible(333)
		Game():GetItemPool():RemoveCollectible(Isaac.GetItemIdByName("Solar"))
		DeathNoteVar = Game():GetFrameCount()
		player:RemoveCollectible(death_note_item)
		Save()
		return true
	elseif itemname == quickchaos_item then
		QuickChaosVar = Game():GetFrameCount()
		player:AddCollectible(402,0,true)
		player:RemoveCollectible(quickchaos_item)
		Save()
		return true
		elseif itemname == bit_coin_item then
		if player:GetData()._BCvar == nil then
			player:GetData()._BCvar = 0
		end
		if player:GetData()._BCmult == nil then
			player:GetData()._BCmult = 1
		end
		player:GetData()._BCvar = player:GetData()._BCvar+1

		local isFail = player:GetCollectibleRNG(bit_coin_item):RandomInt(2)

		if isFail == 0 then
			player:GetData()._BCmult = player:GetData()._BCmult*1.3
		elseif isFail == 1 then
			player:GetData()._BCmult = player:GetData()._BCmult/1.3
		end

		if player:GetData()._BCvar == 5 then
			player:RemoveCollectible(bit_coin_item)
			player:GetData()._BCvar = 0
		end
		Save()

		return true
	elseif itemname == pachinko_item then
		if player:GetData()._PCvar == nil then
			player:GetData()._PCvar = 0
		end
		player:GetData()._PCvar = player:GetData()._PCvar+1

		local isFail = player:GetCollectibleRNG(pachinko_item):RandomInt(2)

		if isFail == 0 then
			player:AddCoins(player:GetNumCoins())
		elseif isFail == 1 then
			player:AddCoins(-player:GetNumCoins())
		end

		if player:GetData()._PCvar == 5 then
			player:RemoveCollectible(pachinko_item)
			player:GetData()._PCvar = 0
		end
		Save()

		return true
	end
end

RepairMod:AddCallback(ModCallbacks.MC_USE_ITEM, RepairMod.UseItem)

function RepairMod:mysticStage()
  player = Isaac.GetPlayer(0)
  room = Game():GetRoom()
  local game = Game()
  local level = game:GetLevel()

  if player:HasCollectible(mys_item) then
	  rooms = {
	    RoomType.ROOM_TREASURE,
	    RoomType.ROOM_SHOP,
	    RoomType.ROOM_BOSS,
	    RoomType.ROOM_MINIBOSS,
	    --RoomType.ROOM_SECRET,
	    --RoomType.ROOM_SUPERSECRET,
	    RoomType.ROOM_ARCADE,
	    RoomType.ROOM_CURSE,
	    RoomType.ROOM_CHALLENGE,
	    RoomType.ROOM_LIBRARY,
	    RoomType.ROOM_SACRIFICE,
	    RoomType.ROOM_DUNGEON,
	    RoomType.ROOM_ISAACS,
	    RoomType.ROOM_BARREN,
	    RoomType.ROOM_CHEST,
	    RoomType.ROOM_DICE
	  }
	  for i=1,#rooms do
	    local rRoomIndex = level:QueryRoomTypeIndex(rooms[i], false, RNG())
	    local rRoom = level:GetRoomByIdx(rRoomIndex)
	    rRoom.DisplayFlags = rRoom.DisplayFlags | 1
	  end

	  -- Since the mini-map is cached, changing display flags won't update it unless we explicitly call this function
	  level:UpdateVisibility()
  end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL    , RepairMod.mysticStage)

function RepairMod:mysticInit()
  player = Isaac.GetPlayer(0)
  room = Game():GetRoom()
  local game = Game()
  local level = game:GetLevel()

  if HasPassive(mys_item) then
	  rooms = {
	    RoomType.ROOM_TREASURE,
	    RoomType.ROOM_SHOP,
	    RoomType.ROOM_BOSS,
	    RoomType.ROOM_MINIBOSS,
	    --RoomType.ROOM_SECRET,
	    --RoomType.ROOM_SUPERSECRET,
	    RoomType.ROOM_ARCADE,
	    RoomType.ROOM_CURSE,
	    RoomType.ROOM_CHALLENGE,
	    RoomType.ROOM_LIBRARY,
	    RoomType.ROOM_SACRIFICE,
	    RoomType.ROOM_DUNGEON,
	    RoomType.ROOM_ISAACS,
	    RoomType.ROOM_BARREN,
	    RoomType.ROOM_CHEST,
	    RoomType.ROOM_DICE
	  }
	  for i=1,#rooms do
	    local rRoomIndex = level:QueryRoomTypeIndex(rooms[i], false, RNG())
	    local rRoom = level:GetRoomByIdx(rRoomIndex)
	    rRoom.DisplayFlags = rRoom.DisplayFlags | 1
	  end

	  -- Since the mini-map is cached, changing display flags won't update it unless we explicitly call this function
	  level:UpdateVisibility()
  end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, RepairMod.mysticInit)
