--local Replace = false

--[[function RepairMod:MarsNewStage()
    local player = Isaac.GetPlayer(0)
    local level = Game():GetLevel()

    Isaac.DebugString("Cursed! on "..tostring(level:GetStage()))
    if player:HasCollectible(mars_item) then
        player:GetData()._Replace = true
    end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, RepairMod.MarsNewStage)]]

function RepairMod:MarsStageUpdate()
    local player = Isaac.GetPlayer(0)
    local room = Game():GetRoom()
    local level = Game():GetLevel()
	Isaac.DebugString("before mars check... on "..tostring(level:GetStage()))
	Isaac.DebugString("and operation... with "..tostring(player:GetData()._Replace).." and "..tostring((level:GetStage() <= 8 or level:GetStage() == 10)))
    if player:HasCollectible(mars_item) and (level:GetStage() <= 8 or level:GetStage() == 10) then
		Isaac.DebugString("getting started... on "..tostring(level:GetStage()))
        local CurRoom = level:GetCurrentRoomIndex()
        local rooms = level:GetRooms()
        local reseed = true;

        local rCurseRoomIndex = level:QueryRoomTypeIndex(RoomType.ROOM_CURSE, false, RNG())
        local rCurseRoom = level:GetRoomByIdx(rCurseRoomIndex)
        local baseCurseroomData = rCurseRoom.Data


        if baseCurseroomData.Type == RoomType.ROOM_CURSE then


            rCurseRoom.DisplayFlags = 7

            local EndRooms = {}

            for i = 0, 169 do
                local roomCount = level:GetRoomByIdx(i)
                if i ~= 84 and EndRoomCheck(i) then
                    table.insert(EndRooms, roomCount)
                end
            end

            if #EndRooms ~= 0 then
                for i = 1, #EndRooms do
                    Isaac.DebugString(tostring(EndRooms[i].SafeGridIndex))
                end
                local rngIndex = math.random(1, #EndRooms)
                EndRooms[rngIndex].Data = baseCurseroomData
                EndRooms[rngIndex].DisplayFlags = 7
                reseed = false
            end
        end

		Isaac.DebugString("we got this... on "..tostring(level:GetStage()).." with "..tostring(reseed))
        level:UpdateVisibility()
        if (reseed == true) then
            if (player:GetData()._reseeded == nil) then
                player:GetData()._reseeded = 1
            else
                player:GetData()._reseeded = player:GetData()._reseeded + 1
            end
			Isaac.DebugString("reseeded is ... "..tostring(player:GetData()._reseeded))
			Isaac.DebugString("about to reseed... on "..tostring(level:GetStage()))
            Isaac.ExecuteCommand("reseed")
            return
        end
    end

	Isaac.DebugString("the story ends... on "..tostring(level:GetStage()))
    --player:GetData()._Replace = nil

end

RepairMod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, RepairMod.MarsStageUpdate)

function EndRoomCheck(index)
    local level = Game():GetLevel()
    local CurrentRoom = level:GetRoomByIdx(index)

    if CurrentRoom.Data ~= nil then
        if CurrentRoom.Data.Type == RoomType.ROOM_DEFAULT and CurrentRoom.Data.Shape == RoomShape.ROOMSHAPE_1x1 then
            local nearbyCount = 0

            if (index == 71 or index == 83 or index == 85 or index == 97) then
                return false
            end

            if (index%13 ~= 0 and level:GetRoomByIdx(index - 1).Data ~= nil) then
                if (level:GetRoomByIdx(index - 1).Data.Type ~= RoomType.ROOM_SECRET) then
                    nearbyCount = nearbyCount + 1
                end
            end

            if (index%13 ~= 12 and level:GetRoomByIdx(index + 1).Data ~= nil) then
                if (level:GetRoomByIdx(index + 1).Data.Type ~= RoomType.ROOM_SECRET) then
                    nearbyCount = nearbyCount + 1
                end
            end

            if (index >= 13 and level:GetRoomByIdx(index - 13).Data ~= nil) then
                if (level:GetRoomByIdx(index - 13).Data.Type ~= RoomType.ROOM_SECRET) then
                    nearbyCount = nearbyCount + 1
                end
            end

            if (index <= 155 and level:GetRoomByIdx(index + 13).Data ~= nil) then
                if (level:GetRoomByIdx(index + 13).Data.Type ~= RoomType.ROOM_SECRET) then
                    nearbyCount = nearbyCount + 1
                end
            end

            if (nearbyCount <= 1) then
                return true
            else
                return false
            end

        end
    end
end
