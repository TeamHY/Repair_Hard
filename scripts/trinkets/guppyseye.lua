TrinketType.TRINKET_GUPPYS_EYE = Isaac.GetTrinketIdByName("Guppy's Eye")

local options = {-1, -13, 1, 13}

local function DoGuppysEye(m)
	local t = {}
	local room = Game():GetRoom()
	local level = Game():GetLevel()

	for i = 0, 7 do
		local d = room:GetDoor(i)
		if d and d.TargetRoomType ~= RoomType.ROOM_SECRET and d.TargetRoomType ~= RoomType.ROOM_SUPERSECRET then
			r = level:GetRoomByIdx(d.TargetRoomIndex)
			t[#t+1] = r.SafeGridIndex
			local s = r.Data.Shape

			if s == 4 or s == 5 then
				t[#t+1] = r.SafeGridIndex + 13
			elseif s == 6 or s == 7 then
				t[#t+1] = r.SafeGridIndex + 1
			elseif s == 8 then
				t[#t+1] = r.SafeGridIndex + 1
				t[#t+1] = r.SafeGridIndex + 13
				t[#t+1] = r.SafeGridIndex + 14
			elseif s == 9 then
				t[#t+1] = r.SafeGridIndex + 12
				t[#t+1] = r.SafeGridIndex + 13
			elseif s == 10 then
				t[#t+1] = r.SafeGridIndex + 13
				t[#t+1] = r.SafeGridIndex + 14
			elseif s == 11 then
				t[#t+1] = r.SafeGridIndex + 1
				t[#t+1] = r.SafeGridIndex + 14
			elseif s == 12 then
				t[#t+1] = r.SafeGridIndex + 1
				t[#t+1] = r.SafeGridIndex + 13
			end
		end
	end

	for _, i in pairs(t) do
		for _, v in pairs(options) do
			local d = level:GetRoomByIdx(i + v)
			if d and d.Data and d.Data.Type ~= RoomType.ROOM_SECRET and d.Data.Type ~= RoomType.ROOM_SUPERSECRET then
				if m then
					d.DisplayFlags = d.DisplayFlags | 5
				else
					d.DisplayFlags = d.DisplayFlags | 1
				end
			end
		end
	end

	level:UpdateVisibility()
end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
	local player = Isaac.GetPlayer(0)
	local eye = false
	local momsbox = false
	if player:HasTrinket(TrinketType.TRINKET_GUPPYS_EYE) then
		eye = true
		if player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX) then
			momsbox = true
		end
	end

	if eye then
		DoGuppysEye(momsbox)
	end
end)
