function RepairMod:GreedNewStart(save)
	if Game().Difficulty >= Difficulty.DIFFICULTY_GREED then -- 그리드 모드면
		local player = Isaac.GetPlayer(0); --player에 플레이어 선언
		if save == false then --새로 시작했다면
			if player:GetPlayerType() == PlayerType.PLAYER_MAGDALENA then
				player:AddCollectible(499,0,true)
			end

			if player:GetPlayerType() then
				player:AddCollectible(416,0,true)
			end
		end
	end
end


RepairMod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, RepairMod.GreedNewStart)

function RepairMod:onTear(tear)
	if Game().Difficulty >= Difficulty.DIFFICULTY_GREED then -- 그리드 모드면
		local player = Isaac.GetPlayer(0)
		if tear.Scale>8 then
			tear.Scale = 8
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR , RepairMod.onTear)

function RepairMod:MacaoCreate()	
	if Game().Difficulty >= Difficulty.DIFFICULTY_GREED then
		if Game():GetRoom():GetType() == RoomType.ROOM_GREED_EXIT then
			if MacaoStage < Game():GetLevel():GetStage() then
				local player = Isaac.GetPlayer(0)
				MacaoStage = Game():GetLevel():GetStage()
				Save()
				MacaoVar = rng:RandomInt(2)+1;
				rng:Next()
				Isaac.Spawn(17, 8, 0, Vector(160,400), Vector(0, 0), player)
				Isaac.Spawn(17, 9, 0, Vector(480,400), Vector(0, 0), player)
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, RepairMod.MacaoCreate);

function RepairMod:MacaoEat(entity)
	local player = Isaac.GetPlayer(0)
	if entity.Variant == 8 then
		if ((player.Position.X - entity.Position.X)^2 + (player.Position.Y - entity.Position.Y)^2)^0.5 <= 50 then
			entity:Remove()
			local entities = Isaac.GetRoomEntities()
			for i = 1, #entities do
				if entities[i].Type == 17 and entities[i].Variant == 9 then
					entities[i]:Remove()
				end
			end
			if MacaoVar == 1 then
				player:AddCoins(15)
				player:AnimateHappy()
			else
				player:AddCoins(-5)
				player:AnimateSad()
				player:AddCollectible(Isaac.GetItemIdByName("vlrdjq"),0,true)
			end
		end
	end
	if entity.Variant == 9 then
		if ((player.Position.X - entity.Position.X)^2 + (player.Position.Y - entity.Position.Y)^2)^0.5 <= 50 then
			entity:Remove()
			local entities = Isaac.GetRoomEntities()
			for i = 1, #entities do
				if entities[i].Type == 17 and entities[i].Variant == 8 then
					entities[i]:Remove()
				end
			end
			if MacaoVar == 1 then
				player:AddCoins(-5)
				player:AnimateSad()
				player:AddCollectible(Isaac.GetItemIdByName("vlrdjq"),0,true)
			else
				player:AddCoins(15)
				player:AnimateHappy()
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_NPC_UPDATE, RepairMod.MacaoEat, 17);

function RepairMod:GreedNPCInit(entity)
	if Game().Difficulty >= Difficulty.DIFFICULTY_GREED then
		local player = Isaac.GetPlayer(0)
		if entity:IsVulnerableEnemy() then -- 맞는 엔티티면
			entity.MaxHitPoints = entity.MaxHitPoints*1.05 -- 최대 피통 5배
			entity.HitPoints = entity.MaxHitPoints -- 현재 피통 = 최대 피통
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NPC_INIT, RepairMod.GreedNPCInit)