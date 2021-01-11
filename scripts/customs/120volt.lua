function RepairMod:voltHit(target, amount, flag, source, cdframe)
    local player = Isaac.GetPlayer(0)
    local entities = Isaac.GetRoomEntities()

    if source.Type == EntityType.ENTITY_TEAR and target:IsVulnerableEnemy() and player:HasCollectible(vlt_item) then
        target:GetData().voltVar = true
        target:GetData().voltIndex = Game():GetFrameCount()
    end
end

RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.voltHit)

function RepairMod:voltUpdate(player)
    entities = Isaac.GetRoomEntities()

    for i = 1, #entities do
        if entities[i]:GetData().voltVar ~= nil then
            if entities[i]:GetData().voltVar == true then
                local hitTarget = false
                for j = 1, #entities do
                    if(entities[j]:IsVulnerableEnemy() and entities[j] ~= entities[i] and (entities[j].Position - entities[i].Position):Length() < 96 and not (entities[j]:GetData().voltVar == false and entities[i]:GetData().voltIndex == entities[j]:GetData().voltIndex)) then

                        local entDis = 0
                        for k = 1, #entities do
                            if(entities[k]:IsVulnerableEnemy() and
                                ((entities[j].Position - entities[i].Position):Length() > (entities[k].Position - entities[i].Position):Length())
                            and entities[k] ~= entities[i]) then
                                entDis = 1
                            end
                        end

                        if(entDis == 0) then
                            local laserLength = (entities[i].Position - entities[j].Position):Length()

                            local laser = player:FireTechLaser( entities[i].Position, - 1, Vector(0, 0), false, false)
                            laser:SetTimeout(1)
                            laser.Angle = (entities[j].Position - entities[i].Position):GetAngleDegrees()
                            laser:SetMaxDistance(laserLength)
                            laser:GetSprite().Color = Color(0, 1, 1, 1, 119, 232, 242)

                            hitTarget = true
                            voltfound = true
                            entities[j]:GetData().voltVar = true
                            entities[j]:GetData().voltIndex = entities[i]:GetData().voltIndex
                        end

                    end
                end

                if( hitTarget == false ) then
                    local laser = player:FireTechLaser( entities[i].Position, - 1, Vector(0, 0), false, false)
                    laser:SetTimeout(1)
                    laser.Angle = Vector(1, 0):Rotated(math.random(360)):GetAngleDegrees();
                    laser:SetMaxDistance(48)
                    laser:GetSprite().Color = Color(0, 1, 1, 1, 119, 232, 242)
                end


                entities[i]:GetData().voltVar = false
            end
        end
    end


end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, RepairMod.voltUpdate)

--[[function RepairMod:voltTear(player)

    entities = Isaac.GetRoomEntities()

    for i = 1, #entities do

        if entities[i]:GetData().treplace ~= nil then
            sprite = entities[i]:GetSprite()

            sprite:ReplaceSpritesheet(0, "gfx/uranusTear.png")
            sprite.Rotation = entities[i].Velocity:GetAngleDegrees()
            sprite:LoadGraphics()


        end

    end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, RepairMod.voltTear)]]
