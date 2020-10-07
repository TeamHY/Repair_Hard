function RepairMod:OculusA(player)
  entities = Isaac.GetRoomEntities()
  for i = 1, #entities do
      local ent = entities[i]
      spr = ent:GetSprite()

      if(ent.Type == 1000 and ent.Variant == 981 and ent:GetData().ocuInit == nil)then
        if(ent.SubType == 0)then
          local vor = Isaac.Spawn(1000,981,1,ent.Position,Vector(0,0),ent)
          Isaac.DebugString(tostring(ent.Size))
          spr.Scale = spr.Scale*((ent.Size)^0.25/1.7)
          vor.Size = ent.Size
          spr:Play("Open",true)
          spr:LoadGraphics()
          ent:GetData().ocuInitTime = Game():GetFrameCount()
          ent:GetData().ocuVor = vor
          vor:GetData().ocuParent = ent
        elseif(ent.SubType == 1)then
          spr:Play("Vortex",true)
          spr:LoadGraphics()
          ent:GetData().ocuVvar = true
          ent:GetData().ocuVanim = 0
          ent:GetData().ocuVinitScale = spr.Scale*((ent.Size)^0.25/1.7)
        end

        ent:GetData().ocuInit = true
      end

      if(ent.Type == 1000 and ent.Variant == 981 and ent.SubType == 1)then
        if ent:GetData().ocuParent == nil then
          ent:Remove()
        elseif ent:GetData().ocuParent:IsDead() then
          ent:Remove()
        end
      end

      if(ent.Type == 1000 and ent.Variant == 981 and ent.SubType == 0 and spr:IsPlaying("Open") and spr:GetFrame() == 11) then
        spr:Play("Idle",true)
        spr:LoadGraphics()
      end

      if(ent:GetData().ocuVanim ~= nil and ent:GetData().ocuVvar ~= nil)then
        if(ent:GetData().ocuVvar) then
          spr.Scale = ent:GetData().ocuVinitScale * ent:GetData().ocuVanim
          spr:LoadGraphics()
          ent:GetData().ocuVanim = ent:GetData().ocuVanim + 0.1
          if(ent:GetData().ocuVanim >= 1)then
            ent:GetData().ocuVanim = nil
            ent:GetData().ocuVidle = true
            ent:GetData().ocuVianim = 1
            ent:GetData().ocuVincr = true
          end
        else
          spr.Scale = ent:GetData().ocuVinitScale * ent:GetData().ocuVanim
          spr:LoadGraphics()
          ent:GetData().ocuVanim = ent:GetData().ocuVanim - 0.1
          if(ent:GetData().ocuVanim <= 0)then
            ent:GetData().ocuVanim = nil
            ent:GetData().ocuVrem = true
          end
        end
      end

      if(ent:GetData().ocuVanim == nil and ent:GetData().ocuVidle ~= nil and ent:GetData().ocuVianim ~= nil and ent:GetData().ocuVincr ~= nil)then
        spr.Scale = ent:GetData().ocuVinitScale * ent:GetData().ocuVianim
        spr:LoadGraphics()
        if(ent:GetData().ocuVincr)then
          ent:GetData().ocuVianim = ent:GetData().ocuVianim + 0.01
          if(ent:GetData().ocuVianim > 1.1)then
            ent:GetData().ocuVincr = false
          end
        else
          ent:GetData().ocuVianim = ent:GetData().ocuVianim - 0.01
          if(ent:GetData().ocuVianim <= 1)then
            ent:GetData().ocuVincr = true
          end
        end
      end

      if(ent:GetData().ocuInitTime ~= nil) then
        if(ent:GetData().ocuInitTime+75 <= Game():GetFrameCount()) then
          spr:Play("Close",true)
          spr:LoadGraphics()
          ent:GetData().ocuInitTime = nil
          ent:GetData().ocuEnded = true
          ent:GetData().ocuVor:GetData().ocuVvar = false
          ent:GetData().ocuVor:GetData().ocuVanim = 1
          ent:GetData().ocuVor:GetData().ocuEnded = false
        end
      end

      if(ent:GetData().ocuEnded ~= nil)then
         if(ent:GetData().ocuEnded == true and spr:GetFrame() == 11) then
           ent:Remove()
         elseif (ent:GetData().ocuVrem ~= nil) then
           ent:Remove()
         end
      end
  end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE  , RepairMod.OculusA)

function RepairMod:OculusE(player)
  entities = Isaac.GetRoomEntities()
  for i = 1, #entities do
    local ent = entities[i]

    if(ent.Type == 1000 and ent.Variant == 981 and ent.SubType == 0)then
      for j = 1, #entities do
        local entj = entities[j]
        if(entj:ToPickup() ~= nil or entj:IsVulnerableEnemy() or entj:ToProjectile() ~= nil) and
        ( (entj.Position-ent.Position):Length() < ent.Size*18 ) then
          local veloEase = math.max((entj.Velocity:Length())^0.75,1)
          entj:AddVelocity((ent.Position-entj.Position):Normalized() * 2/veloEase)
          Isaac.DebugString(tostring(entj.Velocity:Length()))
        end

        if(entj:IsVulnerableEnemy() and (ent.Position - entj.Position):Length() < ent.Size*2 + entj.Size and Game():GetFrameCount() % 10 == 0) then
          entj:TakeDamage(5, 0, EntityRef(player), 30)
        end

      end
    end

  end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE  , RepairMod.OculusE)

function RepairMod:OculusI(tear)
  player = Isaac.GetPlayer(0)

  if player:HasCollectible(ocu_item) and (tLuck(9)) then
    tear:GetData().ocuTear = true
    tear:SetColor(Color(0,0,0,1,0,0,0), -1, 1, false, true)
  end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR  , RepairMod.OculusI)

function RepairMod:OculusS(player)
  entities = Isaac.GetRoomEntities()
  for i = 1, #entities do
    local ent = entities[i]

    if ent:GetData().ocuTear ~= nil and ent:IsDead() then
      local newocu = Isaac.Spawn(1000,981,0,ent.Position,Vector(0,0),ent)
      newocu.Size = ent.Size
      ent:GetData().ocuTear = nil
    end

  end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE  , RepairMod.OculusS)

function tLuck(max)
  player = Isaac.GetPlayer(0)
  if( player:GetDropRNG():RandomInt(math.max(max-math.max(0,player.Luck),0)) == 0 ) then
    return true
  else
    return false
  end
end
