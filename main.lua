RepairMod = RegisterMod("RepairMod",1)
init = require "scripts.init"
func = require "scripts.func"
ban = require "scripts.ban"
setitem = require "scripts.set"
zodiac = require "scripts.zodiac"
greed = require "scripts.greed"
recall = require "scripts.recall"
custom = require "scripts.custom"
trinket = require "scripts.trinket"
pills = require "scripts.pills"
stat = require "scripts.stat"
seed = require "scripts.seed"
extra = require "extracard"
eid = require "eid"
JSON = require "json"

function RepairMod:NewStart(save)
	local player = Isaac.GetPlayer(0); --player에 플레이어 선언
	if save == false then --새로 시작했다면
		--[[
		player:DropTrinket(Isaac.GetFreeNearPosition(player.Position, 50),false) --현재 들고있는 부적 드랍
		player:AddTrinket(TrinketType.TRINKET_SILVER_DOLLAR) --실버달러 소환
		player:UseActiveItem(479, false, true, false, false) --흡수
		player:AddTrinket(TrinketType.TRINKET_BLOODY_CROWN) --블러디 크라운 소환
		player:UseActiveItem(479, false, true, false, false) --흡수
		]]
		if Game().Difficulty ~= Difficulty.DIFFICULTY_GREEDIER then
			Isaac.Spawn(5, 100, Isaac.GetItemIdByName("Hell Mode"), Vector(200,400), Vector(0, 0), player)
			Isaac.Spawn(5, 100, Isaac.GetItemIdByName("Easy Mode"), Vector(440,400), Vector(0, 0), player)
		end
		setVar = {0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		HolyWaterHit = 0
		randomAttack = 0
		randomFamiliar = 0
		hpMaxLimit = 0
		hardModeVar = 0
		inf1_Hit = 0
		lun_Get = 0
		HellDamage = 1
		MacaoVar = 0
		MacaoStage = 0
		PearlLuck = 0
		LuckyFootTime = 0
		randomMultiVar = 0
		PowerBondTime = -1
		LimiterTime = -1
		Collectible455 = 0
		Collectible392 = 0
		Collectible212 = 0
		CollectibleSummang = 0
		DeathNoteVar = 0
		QuickChaosVar = 0
		LudoVar = 0
		PoopVar = false
		violetaVar = false
		prometheusVar = false
		--reincarnationVar = false
		aricooldown = 0
		roomseedisold = 0
		roomiscleared = 1
		Trinket33 = 0
		rng = RNG()
		rng:SetSeed(Game():GetSeeds():GetStartSeed(), 0)
		Save()
	else
		Load()
	end
	player.LaserColor = Color(1,1,1,0.3,0,0,0); --눈물 투명도 -- 코스튬
end

function RepairMod:Megasatan_add(entity)
	if entity.Variant == 0 then
		if type(entity:GetData()["SpawnBBa"]) == type(nil) then
			Isaac.Spawn(212, 0, 0, Vector(55,100), Vector(5, 5), entity)
			Isaac.Spawn(212, 0, 0, Vector(100,55), Vector(5, 5), entity)
			Isaac.Spawn(212, 0, 0, Vector(100,55), Vector(5, 5), entity)
			Isaac.Spawn(212, 0, 0, Vector(100,55), Vector(5, 5), entity)
			entity:GetData()["SpawnBBa"] = "Yes"
		end
	end
end

function RepairMod:CurseRemove(curses) -- 입장 전 저주 제거
	if (Game():GetLevel():GetStage() <= 3 and curses ~= 0) or (curses == LevelCurse.CURSE_OF_DARKNESS and prometheusVar == false) or (curses == LevelCurse.CURSE_OF_THE_UNKNOWN) then
		--Isaac.ConsoleOutput("testok\n") 테스트용 코드
		return 0
	end
end

function RepairMod:PostUpdate()
	local player = Isaac.GetPlayer(0);
	local room = Game():GetRoom()
	if (Game():GetLevel():GetStage() < 4 and Game():GetLevel():GetCurses() ~= 0) or (Game():GetLevel():GetCurses() == LevelCurse.CURSE_OF_DARKNESS and prometheusVar == false) or (Game():GetLevel():GetCurses() == LevelCurse.CURSE_OF_THE_UNKNOWN) then --2미만
	  Game():GetLevel():RemoveCurses() --입장 후 저주제거
	end
	player.LaserColor = Color(1,1,1,0.3,0,0,0); --눈물 투명도

	if hpMaxLimit == 0 and player:GetPlayerType() ~= PlayerType.PLAYER_KEEPER then
		if Game().Difficulty < Difficulty.DIFFICULTY_GREED then
			if Game():GetLevel():GetStage() >= 9 or hardModeVar == 1 then
				while player:GetMaxHearts() > 2 do
					player:AddMaxHearts(-1);
				end
				if Isaac.GetPlayer(0):GetPlayerType() ~= PlayerType.PLAYER_JUDAS then
					while player:GetSoulHearts() > 6 do
						player:AddSoulHearts(-1);
					end
				else
					while player:GetSoulHearts() > 6 do
						player:AddSoulHearts(-1);
					end
				end
				if Isaac.GetPlayer(0):GetPlayerType() ~= PlayerType.PLAYER_THEFORGOTTEN then
					while player:GetBoneHearts() > 0 do
						player:AddBoneHearts(-1)
					end
				else
					while player:GetBoneHearts() > 6 do
						player:AddBoneHearts(-1)
					end
				end
			end
		else
			if Game():GetLevel():GetStage() >= 6 or hardModeVar == 1 then
				while player:GetMaxHearts() > 2 do
					player:AddMaxHearts(-1)
				end
				while player:GetSoulHearts() > 6 do
					player:AddSoulHearts(-1)
				end
			end
		end
	end

	if hardModeVar == 1 then
      if Game():GetFrameCount()%18000 == 0 and HellDamage > 0.5 then
         	HellDamage = HellDamage - 0.1
         	player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
         	player:EvaluateItems()
      end
      if player:HasCollectible(260) then
         player:RemoveCollectible(260)
      end
      while player:GetNumCoins() > 60 do
         player:AddCoins(-1)
      end
      while player:GetNumBombs() > 20 do
         player:AddBombs(-1)
      end
      while player:GetNumKeys() > 20 do
         player:AddKeys(-1)
      end
   end

	if Game():GetFrameCount() % 1800 == 0 then
		if setVar[3] == 1 then
			player:UseCard(12)
		end
	end
	if Game():GetFrameCount() % 900 == 0 then
		if setVar[13] == 1 then
			player:UseActiveItem(288, false, true, false, false) --흡수
		end
	end
	if room:GetBossID() == 55 then
		room:SetBrokenWatchState(2)
	end
end

function RepairMod:onPillGrab(pilleff, pillrgb)
	local player = Isaac.GetPlayer(0)
	if pilleff == 28 or pilleff == 44 or pilleff == 33 or pilleff == 41 then
		repeat
			pilleff = player:GetDropRNG():RandomInt(PillEffect.NUM_PILL_EFFECTS)
		until (pilleff ~= 28 and pilleff ~= 44 and pilleff ~= 33 and pilleff ~= 41)
		return pilleff
	end
end

function RepairMod:onLaserUpdate(laser)
	local player = Isaac.GetPlayer(0)
	if laser.TearFlags&TearFlags.TEAR_LASERSHOT ~= 0 then
		if type(laser:GetData()["DamageUp"]) == type(nil) then
			laser.CollisionDamage = laser.CollisionDamage*1.5
			local tmpcolor = laser:GetColor()
			if tmpcolor.A > 0.3 then
				local tmpRO = math.floor(tmpcolor.RO*255)
				local tmpGO = math.floor(tmpcolor.GO*255)
				local tmpBO = math.floor(tmpcolor.BO*255)
				tmpcolor = Color(tmpcolor.R,tmpcolor.G,tmpcolor.B,0.2,tmpRO,tmpGO,tmpBO) --라샷 투명도
				laser:SetColor(tmpcolor,-1,1,false,false)
			end
			laser:GetData()["DamageUp"] = "Yes"
		end
	end
end

function RepairMod:onEffectRender(effect,offset)
   local tmpcolor = effect:GetColor()
   if tmpcolor.A > 0.3 then
      if effect.Type == 1000 and effect.Variant == 50 and effect.SubType == 2 then
         if effect.Parent.Type == 7 then
            local tmpRO = math.floor(tmpcolor.RO*255)
            local tmpGO = math.floor(tmpcolor.GO*255)
            local tmpBO = math.floor(tmpcolor.BO*255)
            tmpcolor = Color(tmpcolor.R,tmpcolor.G,tmpcolor.B,0.2,tmpRO,tmpGO,tmpBO) --라샷 투명도
            effect:SetColor(tmpcolor,-1,1,false,false)
         end
      end
   end
end

function RepairMod:onTearRender(tear,offset)
	if (tear.SpawnerType == 1) or (tear.SpawnerType == 3) then
		local tmpcolor = tear:GetColor()
		if tmpcolor.A > 0.3 then
			local tmpRO = math.floor(tmpcolor.RO*255)
			local tmpGO = math.floor(tmpcolor.GO*255)
			local tmpBO = math.floor(tmpcolor.BO*255)
			tmpcolor = Color(tmpcolor.R,tmpcolor.G,tmpcolor.B,0.3,tmpRO,tmpGO,tmpBO)
			tear:SetColor(tmpcolor,-1,1,false,false)
		end
	end
end

function RepairMod:VoidRemove()
	if Game().Difficulty < Difficulty.DIFFICULTY_GREED then
		local room = Game():GetRoom()

		if Game():GetLevel():GetStage() ~= 9 then
			for i=1, room:GetGridSize() do
				local gridEnt = room:GetGridEntity(i)
				if gridEnt then
					if gridEnt:GetType() == 17 then
						if gridEnt.Sprite:GetFilename() == "gfx/grid/VoidTrapdoor.anm2" then
							room:RemoveGridEntity(i,0,false)
						end
					end
				end
			end
		end
	end
end

function RepairMod:onDamage(entity, damage, damageFlag, damageSource, DamageCountdownFrames)
	local player = Isaac.GetPlayer(0)
	local boomItem = {52,257,272,273,371,418,526} -- 폭발 면역 아이템 추가

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

	for i=1, #boomItem do
		if player:HasCollectible(boomItem[i]) then
			if damageFlag == DamageFlag.DAMAGE_EXPLOSION then
				return false
			end
		end
	end
	Save()
end

RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.onDamage, EntityType.ENTITY_PLAYER)

function RepairMod:HardModeStatue()
	local player = Isaac.GetPlayer(0);
	local entities = Isaac.GetRoomEntities();
	local diffCheck = false
	local ChampVar = 0

	if hardModeVar ~= 0 then -- 헬모드 썼으면
		diffCheck = true
	elseif Game().Difficulty < Difficulty.DIFFICULTY_GREED and Game():GetLevel():GetStage() > 9 then -- 그리디어 아니고 9스테이지 이상
		diffCheck = true
	elseif Game().Difficulty >= Difficulty.DIFFICULTY_GREED and Game():GetLevel():GetStage() > 2 then -- 그리디어고 2스테이지 이상
		diffCheck = true
	end

	if diffCheck == true then
		for i = 1, #entities do
			if violetaVar == false or (entities[i].Type == 274 and entities[i].Type == 412 or entities[i].Type == 406) then
				if entities[i]:IsVulnerableEnemy() then
					if entities[i]:GetData().changeVar == nil then
						if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_MAGDALENA or
						Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_JUDAS or
						Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_LAZARUS or
						Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("The Delirious Spirit") then
							ChampVar = 19
						else
							repeat
								ChampVar = entities[i]:GetDropRNG():RandomInt(24)
							until ChampVar ~= 6
						end
						entities[i]:ToNPC():Morph(entities[i].Type, entities[i].Variant, entities[i].SubType, ChampVar)
						entities[i].HitPoints = entities[i].MaxHitPoints
						if player:HasCollectible(gun_item) then
							if entities[i].Type == 274 then
								entities[i].HitPoints = entities[i].HitPoints - (entities[i].MaxHitPoints*0.2)
							elseif entities[i].Type == 275 then
								entities[i].HitPoints = entities[i].HitPoints - (entities[i].MaxHitPoints*0.25)
							end
						end
						entities[i]:GetData().changeVar = true
					else
						break
					end
				end
			end
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.HardModeStatue)

function Save()
	local player = Isaac.GetPlayer(0);
	local data = {}

	data.HolyWaterHit = HolyWaterHit
	data.inf1_Hit = inf1_Hit
	data.lun_Get = lun_Get
	data.randomAttack = randomAttack
	data.randomFamiliar = randomFamiliar
	data.setVar = setVar
	data.MacaoStage = MacaoStage
	data.PoopVar = PoopVar
	data.PearlLuck = PearlLuck
	data.LuckyFootTime = LuckyFootTime
	data.randomMultiVar = randomMultiVar
	data.PowerBondTime = PowerBondTime
	data.LimiterTime = LimiterTime
	data.DeathNoteVar = DeathNoteVar
	data.QuickChaosVar = QuickChaosVar
	data.Collectible455 = Collectible455
	data.Collectible392 = Collectible392
	data.Collectible212 = Collectible212
	data.CollectibleSummang = CollectibleSummang
	data.Trinket33 = Trinket33

	for key,value in pairs(player:GetData()) do
		data[key] = value
	end

	local encoded = JSON.encode(data)
	if encoded ~= nil and #encoded > 0 then
		RepairMod:SaveData(encoded)
	end
end

function Load()
	local player = Isaac.GetPlayer(0);
	local raw = RepairMod:LoadData()
	if #raw ~= 0 then
		local data = JSON.decode(raw)
		if data.HolyWaterHit ~= nil then
			data.HolyWaterHit = HolyWaterHit
		end
		if data.inf1_Hit ~= nil then
			data.inf1_Hit = inf1_Hit
		end
		if data.lun_Get ~= nil then
			data.lun_Get = lun_Get
		end
		if data.randomAttack ~= nil then
			data.randomAttack = randomAttack
		end
		if data.randomFamiliar ~= nil then
			data.randomFamiliar = randomFamiliar
		end
		if data.setVar ~= nil then
			data.setVar = setVar
		end
		if data.MacaoStage ~= nil then
			data.MacaoStage = MacaoStage
		end
		if data.PoopVar ~= nil then
			data.PoopVar = PoopVar
		end
		if data.PearlLuck ~= nil then
			data.PearlLuck = PearlLuck
		end
		if data.LuckyFootTime ~= nil then
			data.LuckyFootTime = LuckyFootTime
		end
		if data.randomMultiVar ~= nil then
			data.randomMultiVar = randomMultiVar
		end
		if data.PowerBondTime ~= nil then
			data.PowerBondTime = PowerBondTime
		end
		if data.LimiterTime ~= nil then
			data.LimiterTime = LimiterTime
		end
		if data.DeathNoteVar ~= nil then
			data.DeathNoteVar = DeathNoteVar
		end
		if data.QuickChaosVar ~= nil then
			data.QuickChaosVar = QuickChaosVar
		end
		if data.Collectible455 ~= nil then
			data.Collectible455 = Collectible455
		end
		if data.Collectible392 ~= nil then
			data.Collectible392 = Collectible392
		end
		if data.Collectible212 ~= nil then
			data.Collectible212 = Collectible212
		end
		if data.CollectibleSummang ~= nil then
			data.CollectibleSummang = CollectibleSummang
		end
		if data.Trinket33 ~= nil then
			data.Trinket33 = Trinket33
		end

		for key,value in pairs(data) do
			if key:sub(1,1) == "_" then
				player:GetData()[key] = value
			end
		end
	end
end

function RepairMod:prePickUpColl(pickup,entity,low)
   if Game():GetLevel():GetStage() >= 9 or hardModeVar == 1 then
      if pickup.Type == 5 and entity.Type == 1 then
      local player = Isaac.GetPlayer(0)
         if pickup.Variant == 10 then
            if pickup.SubType == 3 or pickup.SubType == 6  or pickup.SubType == 8 then
               if player:GetSoulHearts() >= 8 then
                  return false
               end
            elseif pickup.SubType == 10 then
               if player:GetHearts() >= player:GetMaxHearts() and player:GetSoulHearts() >= 8 then
                  return false
               end
			elseif pickup.SubType == 11 then
				return false
			end
         end
      end
   end
end

function RepairMod:AutoSave(contable)
	Save()
end

RepairMod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, RepairMod.NewStart)
RepairMod:AddCallback(ModCallbacks.MC_NPC_UPDATE, RepairMod.Megasatan_add, 275)
RepairMod:AddCallback(ModCallbacks.MC_POST_CURSE_EVAL, RepairMod.CurseRemove)
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.PostUpdate)
RepairMod:AddCallback(ModCallbacks.MC_GET_PILL_EFFECT, RepairMod.onPillGrab)
RepairMod:AddCallback(ModCallbacks.MC_POST_TEAR_RENDER, RepairMod.onTearRender)
RepairMod:AddCallback(ModCallbacks.MC_POST_EFFECT_RENDER, RepairMod.onEffectRender)
RepairMod:AddCallback(ModCallbacks.MC_POST_LASER_UPDATE, RepairMod.onLaserUpdate)
RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.VoidRemove)
RepairMod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, RepairMod.prePickUpColl)
RepairMod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, RepairMod.AutoSave)
