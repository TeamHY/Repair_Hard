function RepairMod:OnCache(player, cacheFlag)
	if cacheFlag == CacheFlag.CACHE_DAMAGE then
		if player:HasCollectible(prometheus_item) then
			player.Damage = player.Damage * 1.3
		end
		if player:HasCollectible(violeta_item) then
			player.Damage = player.Damage * 1.1
		end
		if player:HasCollectible(ocu_item) then
			player.Damage = player.Damage + 1
		end
		if player:HasCollectible(doveb_item) then
			player.Damage = player.Damage + 9.99
		end
		if player:GetData()._platinumVar ~= nil then
			player.Damage = player.Damage + player:GetData()._platinumVar
		end
		if player:HasCollectible(oath_item) then
			player.Damage = player.Damage + (1.8 - (player:GetHearts() * 0.09))
		end
		if player:HasCollectible(ithurts_item) then
			player.Damage = (player.Damage + 1) * 1.3
		end
		if player:HasCollectible(icar_item) then
			player.Damage = player.Damage * 1.35
		end
		if player:HasCollectible(Absguppy_item) then
			player.Damage = player.Damage * 0.75
		end
		if player:HasCollectible(amon_item) then
			player.Damage = player.Damage * 0.8
		end
		if player:HasCollectible(summangguppy_item) then
			player.Damage = player.Damage * 0.75
		end
		if player:HasCollectible(spect_item) then
			player.Damage = player.Damage * 0.5
		end
		if player:HasCollectible(spi_item) then
			player.Damage = player.Damage * 1.4
		end
		if player:HasCollectible(ra_H_item) then
			player.Damage = player.Damage * 0.65
		end
		if player:HasCollectible(chu35_item) then
			player.Damage = player.Damage + 3.5
		end
		if player:HasCollectible(cor_item) then
			player.Damage = player.Damage * 1.15
		end
		if player:HasCollectible(152) then
			player.Damage = player.Damage * 1.54
		end
		if player:HasCollectible(188) then
			player.Damage = player.Damage * 1.2
		end
		if player:HasCollectible(180) then
			player.Damage = player.Damage + 2.22
		end
		if player:HasCollectible(275) then
			player.Damage = player.Damage * 1.1
		end
		if player:HasCollectible(470) then
			player.Damage = player.Damage * 1.1
		end
		if player:HasCollectible(randomAttack_item) then
			player.Damage = player.Damage * 1.25
		end
		if player:HasCollectible(519) then
			player.Damage = player.Damage * 1.1
		end
		if player:HasCollectible(randomMulti_item) then
			player.Damage = player.Damage * randomMultiVar
		end
		if PowerBondTime > 0 then
			player.Damage = player.Damage * 4
		end
		if LimiterTime > 0 then
			player.Damage = player.Damage * 2
		end
		if player:HasCollectible(eyes_item) then
			player.Damage = player.Damage * (math.max(1,1+(math.floor(player.Luck)/20)))
		end
		if DeathNoteVar ~= 0 then
			player.Damage = player.Damage * 1.35
		end
		if LudoVar > 0 then
			player.Damage = player.Damage*(LudoVar*2.0)
		end
	    if hardModeVar == 1 then
        	player.Damage = player.Damage * HellDamage
        end
    	if player:GetData()._BCvar ~= nil then
			player.Damage = player.Damage * player:GetData()._BCmult
		end
	end

	if cacheFlag == CacheFlag.CACHE_LUCK then
		if player:HasCollectible(355) then
			player.Luck = player.Luck - 3
			player.Luck = player.Luck + PearlLuck
		end
		if player:HasCollectible(46) then
			player.Luck = player.Luck + math.floor((Game():GetFrameCount() - LuckyFootTime)/5400)
		end
	end

	if cacheFlag == CacheFlag.CACHE_SPEED then
		if player:HasCollectible(ithurts_item) then
			player.MoveSpeed = player.MoveSpeed + 0.3
		end
		if player:HasCollectible(socks_item) then
			player.MoveSpeed = player.MoveSpeed + 0.3
		end
		if player:HasCollectible(ura_item) then
			player.MoveSpeed = player.MoveSpeed + 0.3
		end
		if player:HasCollectible(mer_item) then
			player.MoveSpeed = player.MoveSpeed + 0.15
		end
		if player:HasCollectible(ven_item) then
			player.MoveSpeed = player.MoveSpeed + 0.15
		end
		if player:HasCollectible(ter_item) then
			player.MoveSpeed = player.MoveSpeed + 0.15
		end
		if player:HasCollectible(337) then
			player.MoveSpeed = player.MoveSpeed + 0.3
		end
		if player:HasCollectible(mars_item) then
			player.MoveSpeed = player.MoveSpeed + 0.3
		end
	end

	if cacheFlag == CacheFlag.CACHE_RANGE then
		if player:HasCollectible(Ash_item) then
			player.TearHeight = player.TearHeight * 1.3
		end
		if player:HasCollectible(229) then
			player.TearHeight = player.TearHeight * 1.2
		end
		if player:GetData()._libraVar ~= nil then
			player.TearHeight = player.TearHeight - player:GetData()._libraVar
		end
		if player:GetPlayerType() == 7 then
			player.TearHeight = player.TearHeight - player.TearHeight * 0.35
		end
	end

	if (cacheFlag == CacheFlag.CACHE_SHOTSPEED) then
		if player:HasCollectible(329) then
			player.ShotSpeed = player.ShotSpeed + 0.5
		end
	end

	if cacheFlag == CacheFlag.CACHE_FIREDELAY then
		if player:HasCollectible(2) then
			player.MaxFireDelay = player.MaxFireDelay - 2
		end
		if player:HasCollectible(68) then
			player.MaxFireDelay = player.MaxFireDelay - 2
		end
		if player:HasCollectible(118) then -- 혈사포
			player.MaxFireDelay = player.MaxFireDelay - 5
		end
		if player:HasCollectible(153) then -- 쿼드
			player.MaxFireDelay = player.MaxFireDelay - 2
		end
		if player:HasCollectible(169) then -- 싸클
			player.MaxFireDelay = player.MaxFireDelay - 3
		end
		if player:HasCollectible(233) then
			player.MaxFireDelay = player.MaxFireDelay - 1
		end
		if player:HasCollectible(317) then
			player.MaxFireDelay = player.MaxFireDelay - 1
		end
		if player:HasCollectible(368) then
			player.MaxFireDelay = player.MaxFireDelay - 1
		end
		if player:HasCollectible(394) then
			player.MaxFireDelay = player.MaxFireDelay - 1
		end
		if player:HasCollectible(440) then
			player.MaxFireDelay = player.MaxFireDelay - 2
		end
		if player:HasCollectible(540) then
			player.MaxFireDelay = player.MaxFireDelay - 1
		end
		if player:HasCollectible(531) then
			player.MaxFireDelay = (player.MaxFireDelay - (player.MaxFireDelay % 2)) / 2
		end
		if player:HasCollectible(gal_item) then
			player.MaxFireDelay = player.MaxFireDelay - 1
		end
    if player:GetData()._PHvar ~= nil then
      player.MaxFireDelay = player.MaxFireDelay - player:GetData()._PHmult
    end
	end

	if (cacheFlag == CacheFlag.CACHE_TEARFLAG) then
		if player:HasCollectible(spect_item) then
			player.TearFlags = player.TearFlags|TearFlags.TEAR_LIGHT_FROM_HEAVEN
		end
		if player:HasCollectible(toid100_item) then
			player.TearFlags = player.TearFlags|TearFlags.TEAR_EGG
		end
		if player:HasCollectible(329) then
			player.TearFlags = player.TearFlags|TearFlags.TEAR_HOMING
		end
		if player:HasCollectible(68) then
			player.TearFlags = player.TearFlags|TearFlags.TEAR_PIERCING
		end
		if player:HasCollectible(cor_item) then
			player.TearFlags = player.TearFlags|TearFlags.TEAR_PIERCING
		end
		if player:HasCollectible(68) then
			player.TearFlags = player.TearFlags|TearFlags.TEAR_SPECTRAL
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, RepairMod.OnCache)
