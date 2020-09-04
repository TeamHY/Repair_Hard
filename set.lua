function RepairMod:SetCheck()
	local player = Isaac.GetPlayer(0); --player에 플레이어 선언
	entities = Isaac.GetRoomEntities()
	
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_GUPPY) == true and setVar[1] == 0 then
		setVar[1] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_LORD_OF_THE_FLIES) == true and setVar[2] == 0 then
		player:AddCollectible(248,0,true)
		setVar[2] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_MUSHROOM) == true and setVar[3] == 0 then
		setVar[3] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_ANGEL) == true and setVar[4] == 0 then
		Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, Game():GetSeeds():GetNextSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		setVar[4] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_BOB) == true and setVar[5] == 0 then
		player:AddCollectible(375,0,true)
		player:AddCollectible(273,0,true)
		player:AddCollectible(273,0,true)
		player:AddCollectible(273,0,true)
		setVar[5] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_DRUGS) == true and setVar[6] == 0 then
		setVar[6] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_MOM) == true and setVar[7] == 0 then
		player:AddCollectible(75,0,true)
		setVar[7] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_BABY) == true and setVar[8] == 0 then
		player:AddCollectible(255,0,true)
		setVar[8] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_EVIL_ANGEL) == true and setVar[9] == 0 then
		setVar[9] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_POOP) == true and setVar[10] == 0 then
		player:DropTrinket(Isaac.GetFreeNearPosition(player.Position, 50),false) --현재 들고있는 부적 드랍
		player:AddTrinket(TrinketType.TRINKET_PETRIFIED_POOP) --t2
		player:UseActiveItem(479, false, true, false, false) --흡수
		player:AddCard(45)
		setVar[10] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_BOOK_WORM) == true and setVar[11] == 0 then
		setVar[11] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_ADULTHOOD) == true and setVar[12] == 0 then
		Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_BOSS, true, Game():GetSeeds():GetNextSeed()), Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		setVar[12] = 1
		Save()
	end
	if player:HasPlayerForm(PlayerForm.PLAYERFORM_SPIDERBABY) == true and setVar[13] == 0 then
		player:AddCollectible(20,0,true)
		setVar[13] = 1
		Save()
	end
	if setVar[14] == 0 then
		for i = 1, #entities do
			if entities[i].Type == 3 and entities[i].Variant == FamiliarVariant.SUPER_BUM then
				player:AddCollectible(241,0,true)
				player:AddCollectible(203,0,true)
				setVar[14] = 1
				Save()
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.SetCheck)