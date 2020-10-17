function RepairMod:usePillOrigin(pills)
	local player = Isaac.GetPlayer(0); --player에 플레이어 선언
	local randomVar = 0
	
	if pills == PillEffect.PILLEFFECT_AMNESIA then
		if player:GetPillRNG(PillEffect.PILLEFFECT_AMNESIA):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			if Game():GetLevel():GetCurses() ~= 0 then
				Game():GetLevel():RemoveCurses() --저주제거
			end
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_QUESTIONMARK then
		if player:GetPillRNG(PillEffect.PILLEFFECT_QUESTIONMARK):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_SEE_FOREVER then
		if player:GetPillRNG(PillEffect.PILLEFFECT_SEE_FOREVER):RandomInt(10) < (7 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_PARALYSIS then
		if player:GetPillRNG(PillEffect.PILLEFFECT_PARALYSIS):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(510,false,true,false,false)
			player:UseActiveItem(510,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_POWER then
		if player:GetPillRNG(PillEffect.PILLEFFECT_POWER):RandomInt(10) < (7 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(160,false,true,false,false)
			player:UseActiveItem(160,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_WIZARD then
		if player:GetPillRNG(PillEffect.PILLEFFECT_WIZARD):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(160,false,true,false,false)
			player:UseActiveItem(160,false,true,false,false)
			player:UseActiveItem(192,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_X_LAX then
		if player:GetPillRNG(PillEffect.PILLEFFECT_X_LAX):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(291,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_SOMETHINGS_WRONG then
		if player:GetPillRNG(PillEffect.PILLEFFECT_SOMETHINGS_WRONG):RandomInt(10) < (7 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(291,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_PHEROMONES then
		if player:GetPillRNG(PillEffect.PILLEFFECT_PHEROMONES):RandomInt(10) < (10 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(510,false,true,false,false)
			player:UseActiveItem(510,false,true,false,false)
			player:UseActiveItem(510,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_HEMATEMESIS then
		if player:GetPillRNG(PillEffect.PILLEFFECT_HEMATEMESIS):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(536,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_RETRO_VISION then
		if player:GetPillRNG(PillEffect.PILLEFFECT_RETRO_VISION):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(287,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_LARGER then
		if player:GetPillRNG(PillEffect.PILLEFFECT_LARGER):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(515,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_PUBERTY then
		if player:GetPillRNG(PillEffect.PILLEFFECT_PUBERTY):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(297,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_BAD_TRIP then
		if player:GetPillRNG(PillEffect.PILLEFFECT_BAD_TRIP):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(515,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_INFESTED_QUESTION then
		if player:GetPillRNG(PillEffect.PILLEFFECT_INFESTED_QUESTION):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(145,false,true,false,false)
			player:UseActiveItem(145,false,true,false,false)
			player:UseActiveItem(145,false,true,false,false)
			player:UseActiveItem(145,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_INFESTED_EXCLAMATION then
		if player:GetPillRNG(PillEffect.PILLEFFECT_INFESTED_EXCLAMATION):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(288,false,true,false,false)
			player:UseActiveItem(288,false,true,false,false)
			player:UseActiveItem(288,false,true,false,false)
			player:UseActiveItem(288,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_I_FOUND_PILLS then
		if player:GetPillRNG(PillEffect.PILLEFFECT_I_FOUND_PILLS):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(324,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_IM_EXCITED then
		if player:GetPillRNG(PillEffect.PILLEFFECT_IM_EXCITED):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(516,false,true,false,false)
		end
	elseif pills == PillEffect.PILLEFFECT_RELAX then
		if player:GetPillRNG(PillEffect.PILLEFFECT_RELAX):RandomInt(10) < (5 + player.Luck) then --0부터 9 / 4 + 럭 미만
			player:UseActiveItem(291,false,true,false,false)
		end
	end
end

RepairMod:AddCallback(ModCallbacks.MC_USE_PILL, RepairMod.usePillOrigin)