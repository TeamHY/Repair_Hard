function RepairMod:OnPostNewLevel()
	local player = Isaac.GetPlayer(0)
	local game = Game()
	local room = game:GetRoom()
	local level = game:GetLevel()

	if player:HasCollectible(vir_item) then
		if Game().Difficulty < Difficulty.DIFFICULTY_GREED then -- 그리드 모드가 아니면
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_ANGEL, true, player:GetCollectibleRNG(vir_item):GetSeed()), Vector(120, 200), Vector(0, 0), player)
		else
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_GREED_ANGEL, true, player:GetCollectibleRNG(vir_item):GetSeed()), Vector(280, 400), Vector(0, 0), player)
		end
	end

	if player:HasCollectible(amon_item) then
		if Game().Difficulty < Difficulty.DIFFICULTY_GREED then -- 그리드 모드가 아니면
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_CURSE, true, player:GetCollectibleRNG(amon_item):GetSeed()), Vector(120, 260), Vector(0, 0), player)
		else
			Isaac.Spawn(5, 100, Game():GetItemPool():GetCollectible(ItemPoolType.POOL_GREED_CURSE, true, player:GetCollectibleRNG(amon_item):GetSeed()), Vector(360, 400), Vector(0, 0), player)
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, RepairMod.OnPostNewLevel)

function RepairMod:OnUpdate()
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
	local game = Game()
	local room = game:GetRoom()
	local level = game:GetLevel()

	if player:HasCollectible(lun_item) and lun_Get == 0 then
		local tmptrin1 = player:GetTrinket(0)
		local tmptrin2 = player:GetTrinket(1)
		local lunRandom = {76,91,246,445,492}
		player:TryRemoveTrinket(tmptrin1)
		player:TryRemoveTrinket(tmptrin2)
		player:AddTrinket(TrinketType.TRINKET_FRAGMENTED_CARD)
		player:UseActiveItem(479, false, true, false, false) --흡수
		if tmptrin1 ~= 0 then
			player:AddTrinket(tmptrin1)
		end
		if tmptrin2 ~= 0 then
			player:AddTrinket(tmptrin2)
		end
		player:AddCollectible(lunRandom[player:GetCollectibleRNG(lun_item):RandomInt(5)+1],0,true)
		lun_Get = 1
		Save()
	end

	if player:HasCollectible(sat_item) then
		player:UseActiveItem(479, false, true, false, false)
	end

	if player:HasCollectible(mer_item) then
		local enter_door = room:GetDoor(level.EnterDoor)
		if enter_door ~= nil and not enter_door:IsOpen() then
			enter_door:Open()
		end
	end

	if player:HasCollectible(gem_item) then
		for i = 0, DoorSlot.NUM_DOOR_SLOTS-1 do
			local door = room:GetDoor(i)
			if door ~= nil and not door:IsOpen() then
				door:Open()
			end
		end
	end

	if player:HasCollectible(cap_item) then
		player:GetEffects():AddCollectibleEffect(215, false);
	end

	if roomseedisold ~= room:GetDecorationSeed() then
		roomiscleared = 0
		roomseedisold = room:GetDecorationSeed()
	end

	if roomiscleared == 0 then
		for i = 1 , #entities do
			if entities[i]:IsVulnerableEnemy() and player:HasCollectible(lib_item) then
				entities[i]:TakeDamage(entities[i].MaxHitPoints * ((24 - player:GetHearts() - player:GetSoulHearts())/25), 0, EntityRef(player), 1)
			end
			if entities[i]:IsVulnerableEnemy() and player:HasCollectible(leo_item) then
				entities[i]:AddFreeze(EntityRef(player),150)
			end
		end
		roomiscleared = 1
	end

	for i = 1, #entities do
		if entities[i].Type == 17 and entities[i].Variant == 7 then
			if player:HasCollectible(cap_item) then
				entities[i]:Remove()
				Isaac.Spawn(5, 150, 0, entities[i].Position, Vector(0,0), player)
			else
				entities[i]:Remove()
			end
		end
		if entities[i]:IsVulnerableEnemy() and entities[i]:GetData().AquVar == true and Game().TimeCounter % 10 == 0 then
			local splashTear = player:FireTear(entities[i].Position, Vector(player.ShotSpeed*10,0):Rotated(math.random(360)), true,true,false)
			splashTear:ToTear().FallingSpeed = player.TearHeight*.5*(math.random()*.75+.5)
			splashTear:ToTear().FallingAcceleration = 1.3
			splashTear:ToTear().TearFlags = splashTear:ToTear().TearFlags|TearFlags.TEAR_PIERCING
		end
		if entities[i]:IsVulnerableEnemy() and entities[i]:GetData().AquVar2 == true and Game().TimeCounter % 25 == 0 then
			local splashTear = player:FireTear(entities[i].Position, Vector(player.ShotSpeed*10,0):Rotated(math.random(360)), true,true,false)
			splashTear:ToTear().FallingSpeed = player.TearHeight*.5*(math.random()*.75+.5)
			splashTear:ToTear().FallingAcceleration = 1.3
			splashTear:ToTear().TearFlags = splashTear:ToTear().TearFlags|TearFlags.TEAR_PIERCING
		end
		if entities[i].Type == EntityType.ENTITY_PROJECTILE and player:HasCollectible(psc_item) then
			if ((player.Position.X - entities[i].Position.X)^2 + (player.Position.Y - entities[i].Position.Y)^2)^0.5 <= 30 and entities[i]:GetData().Refl ~= true then
				entities[i]:GetData().Refl = true
				reflTear = entities[i]:ToProjectile()
				local angle = reflTear.Velocity:GetAngleDegrees() - (player.Position):GetAngleDegrees()
				reflTear.Velocity = reflTear.Velocity:Rotated(180)
				reflTear.Parent = player
				reflTear.SpawnerEntity = player
				reflTear:AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER | ProjectileFlags.ANY_HEIGHT_ENTITY_HIT | ProjectileFlags.HIT_ENEMIES)
			end
		end

		if player:HasCollectible(tau_item) and player:HasFullHearts() and entities[i].Type == 5 and entities[i].Variant == 10 then
			if ((player.Position.X - entities[i].Position.X)^2 + (player.Position.Y - entities[i].Position.Y)^2)^0.5 <= 30 then
				if entities[i].SubType == 1 then
					entities[i]:Remove()
					player:AddSoulHearts(2)
					player:AnimateHappy()
				elseif entities[i].SubType == 2 then
					entities[i]:Remove()
					player:AddSoulHearts(1)
					player:AnimateHappy()
				elseif entities[i].SubType == 5 then
					entities[i]:Remove()
					player:AddSoulHearts(4)
					player:AnimateHappy()
				elseif entities[i].SubType == 9 then
					entities[i]:Remove()
					player:AddSoulHearts(2)
					player:AnimateHappy()
				end
			end
		end
	end

	if player:HasCollectible(ven_item) then
		for i = 1, #entities do
			if entities[i]:IsVulnerableEnemy() then
				if entities[i].Type ~= 411 then
					if ((player.Position.X - entities[i].Position.X)^2 + (player.Position.Y - entities[i].Position.Y)^2)^0.5 <= 180 then
						entities[i]:AddCharmed(1)
					end
				end
			end
		end
	end

	if Game():GetFrameCount()%1350 == 0 then
		if player:HasCollectible(cor_item) then
			Isaac.Spawn(3, 15, 0, Isaac.GetFreeNearPosition(player.Position, 5), Vector(0, 0), player)
		end
		if player:HasCollectible(cet_item) then
			Isaac.Spawn(5, 10, 3, Isaac.GetFreeNearPosition(player.Position, 50), Vector(0, 0), player)
		end
	end

	if Game():GetFrameCount()%600 == 0 then
		if player:HasCollectible(bel_item) then
			player:UseActiveItem(34, false, true, false, false)
		end
	end

	if Game():GetFrameCount()%450 == 0 then
		if player:HasCollectible(cyg_item) then
			player:UseActiveItem(160, false, true, false, false)
			player:UseActiveItem(160, false, true, false, false)
		end
	end
	if Game():GetFrameCount()%450 == 0 then
		if player:HasCollectible(469) then
			player:UseActiveItem(160, false, true, false, false)
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.OnUpdate);

function RepairMod:onTear(tear)
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
	if player:HasCollectible(sco_item) then
		tear:SetColor(Color(0.2, 0.4, 1, 1, 0, 0, 0), -1, 1, false, true)
		tear:Remove()
		Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BLUE_FLY, 2, player.Position, Vector(0, 0), player)
	end
	if player:HasCollectible(sgr_item) and ((math.random(1,100) <= 15 and player.Luck > 10) or (math.random(1,100) <= (5 + player.Luck) and player.Luck <= 10))  then
		for i=1, #entities do
			if entities[i]:IsVulnerableEnemy() then
				local entDis = 0
				for j=1, #entities do
					if entities[j]:IsVulnerableEnemy() and (entities[i].Position:Distance(player.Position) > entities[j].Position:Distance(player.Position)) then
						entDis = 1
					end
				end
				if entDis == 0 and entities[i]:ToNPC():IsBoss() then
					entities[i]:TakeDamage(player.Damage*20, 0, EntityRef(player), 1)
					tear:Remove()
				elseif entDis == 0 then
					entities[i]:Kill()
					tear:Remove()
				end
			end
		end
	end
	if player:HasCollectible(ura_item) then
		tear.TearFlags = tear.TearFlags|TearFlags.TEAR_FREEZE
	end
	if player:HasCollectible(ter_item) then
		tear.TearFlags = tear.TearFlags|TearFlags.TEAR_ACID
	end
	if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Hush Child") then
		tear.TearFlags = tear.TearFlags|TearFlags.TEAR_CONTINUUM
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR , RepairMod.onTear)

function RepairMod:OnDamage(entity, damage, damageFlag, damageSource, DamageCountdownFrames)
	local player = Isaac.GetPlayer(0)

	if player:HasCollectible(ari_item) then
		if aricooldown <= Game():GetFrameCount() then
			aricooldown = Game():GetFrameCount() + (40 * 30)
			player:UseActiveItem(58, false, true, false, false)
			return false
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.OnDamage, EntityType.ENTITY_PLAYER)

function RepairMod:ChangeHP(entity)
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(470) and entity.Type == 407 then
		entity.HitPoints = entity.HitPoints - (entity.MaxHitPoints*0.15)
	end
	if player:HasCollectible(519) and entity.Type == 412 then
		entity.HitPoints = entity.HitPoints - (entity.MaxHitPoints*0.15)
	end
	if player:HasCollectible(gun_item) then
		if entity.Type == 274 then
			entity.HitPoints = entity.HitPoints - (entity.MaxHitPoints*0.2)
		elseif entity:IsVulnerableEnemy() then
			entity.HitPoints = entity.HitPoints - (entity.MaxHitPoints*0.25)
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NPC_INIT, RepairMod.ChangeHP)

function RepairMod:NpcHit(dmg_target, dmg_amount, dmg_source, dmg_dealer)
    local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
    local flag = false

	if player:HasCollectible(ura_item) and dmg_target:IsVulnerableEnemy() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR and dmg_target:ToNPC():IsBoss() == false then
			dmg_target:Kill()
		end
	end

	if player:HasCollectible(aqr_item) and dmg_target:IsVulnerableEnemy() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR or dmg_source & DamageFlag.DAMAGE_LASER == DamageFlag.DAMAGE_LASER or dmg_dealer.Type == EntityType.ENTITY_KNIFE then
			dmg_target:GetData().AquVar = true
		end
	end

	if player:HasCollectible(308) and dmg_target:IsVulnerableEnemy() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR or dmg_source & DamageFlag.DAMAGE_LASER == DamageFlag.DAMAGE_LASER or dmg_dealer.Type == EntityType.ENTITY_KNIFE then
			dmg_target:GetData().AquVar2 = true
		end
	end

	if player:HasCollectible(cor_item) and dmg_target:IsVulnerableEnemy() and not dmg_target:ToNPC():IsBoss() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR or dmg_source & DamageFlag.DAMAGE_LASER == DamageFlag.DAMAGE_LASER or dmg_dealer.Type == EntityType.ENTITY_KNIFE then
			if dmg_target:GetData().Splitted == nil and dmg_target:ToNPC().ParentNPC == nil and dmg_target.Type ~= EntityType.ENTITY_SWARM then
				if dmg_target:GetData().Splits == nil then
					local OrgHP = dmg_target.HitPoints
					dmg_target:Remove()
					if dmg_target:ToNPC().ChildNPC ~= nil then
						dmg_target:ToNPC().ChildNPC:Kill()
					end
					dmg_target:GetData().Splitted = true
					local spl = Isaac.Spawn(dmg_target.Type, dmg_target.Variant, dmg_target.SubType, Isaac.GetFreeNearPosition(dmg_target.Position, 1), Vector(-5,0), nil)
					spl:GetData().Splits = 1
					spl:ToNPC().Scale = spl:ToNPC().Scale / 1.4
					spl.HitPoints = OrgHP / 3 --HP 조정
					local spl = Isaac.Spawn(dmg_target.Type, dmg_target.Variant, dmg_target.SubType, Isaac.GetFreeNearPosition(dmg_target.Position, 1), Vector(5,0), nil)
					spl:GetData().Splits = 1
					spl:ToNPC().Scale = spl:ToNPC().Scale / 1.4
					spl.HitPoints = OrgHP / 3 --HP 조정
				end
			end
		end
	end

	if player:HasCollectible(cnc_item) and dmg_target:IsVulnerableEnemy() then
		if dmg_dealer.Type == EntityType.ENTITY_TEAR or dmg_source & DamageFlag.DAMAGE_LASER == DamageFlag.DAMAGE_LASER or dmg_dealer.Type == EntityType.ENTITY_KNIFE then
			for i = 1 , #entities do
				if entities[i]:IsVulnerableEnemy() then
					entities[i]:TakeDamage(dmg_amount/5, 0, EntityRef(player), 1)
				end
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.NpcHit)

--[[function RepairMod:UseItem(collectible, rng)
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
end

RepairMod:AddCallback(ModCallbacks.MC_USE_ITEM, RepairMod.UseItem)]]

--[[function RepairMod:Render()
	local player = Isaac.GetPlayer(0)
	local game = Game()
	local room = game:GetRoom()
end

RepairMod:AddCallback(ModCallbacks.MC_POST_RENDER, RepairMod.Render);]]
