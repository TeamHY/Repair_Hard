function RepairMod:usePillOrigin(pills)
	local player = Isaac.GetPlayer(0); --player에 플레이어 선언
	local randomVar = 0
	
	if pills == PillEffect.PILLEFFECT_AMNESIA then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_AMNESIA):RandomInt(100)+1
		if randomVar <= 50 then
			if Game():GetLevel():GetCurses() ~= 0 then
				Game():GetLevel():RemoveCurses() --저주제거
			end
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_QUESTIONMARK then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_QUESTIONMARK):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_SEE_FOREVER then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_SEE_FOREVER):RandomInt(100)+1
		if randomVar <= 75 then
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_PARALYSIS then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_PARALYSIS):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(510,false,true,false,false)
			player:UseActiveItem(510,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_POWER then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_POWER):RandomInt(100)+1
		if randomVar <= 75 then
			player:UseActiveItem(160,false,true,false,false)
			player:UseActiveItem(160,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_WIZARD then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_WIZARD):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(160,false,true,false,false)
			player:UseActiveItem(160,false,true,false,false)
			player:UseActiveItem(192,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_X_LAX then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_X_LAX):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(291,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_SOMETHINGS_WRONG then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_SOMETHINGS_WRONG):RandomInt(100)+1
		if randomVar <= 75 then
			player:UseActiveItem(291,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_PHEROMONES then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_PHEROMONES):RandomInt(100)+1
		if randomVar <= 100 then
			player:UseActiveItem(510,false,true,false,false)
			player:UseActiveItem(510,false,true,false,false)
			player:UseActiveItem(510,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_HEMATEMESIS then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_HEMATEMESIS):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(536,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_RETRO_VISION then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_RETRO_VISION):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_LARGER then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_LARGER):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(515,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_PUBERTY then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_PUBERTY):RandomInt(100)+1
		if randomVar <= 40 then
			player:UseActiveItem(297,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_BAD_TRIP then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_BAD_TRIP):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(515,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_INFESTED_QUESTION then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_INFESTED_QUESTION):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(145,false,true,false,false)
			player:UseActiveItem(145,false,true,false,false)
			player:UseActiveItem(145,false,true,false,false)
			player:UseActiveItem(145,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_INFESTED_EXCLAMATION then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_INFESTED_EXCLAMATION):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(288,false,true,false,false)
			player:UseActiveItem(288,false,true,false,false)
			player:UseActiveItem(288,false,true,false,false)
			player:UseActiveItem(288,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_I_FOUND_PILLS then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_I_FOUND_PILLS):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(324,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_IM_EXCITED then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_IM_EXCITED):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(516,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_RELAX then
		randomVar = player:GetPillRNG(PillEffect.PILLEFFECT_RELAX):RandomInt(100)+1
		if randomVar <= 50 then
			player:UseActiveItem(291,false,true,false,false)
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_USE_PILL, RepairMod.usePillOrigin)