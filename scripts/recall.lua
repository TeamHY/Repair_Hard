function RepairMod:Recall()
   local player = Isaac.GetPlayer(0)
   if player:HasCollectible(280)==true then
      while player:GetCollectibleNum(280)<3 do
         player:AddCollectible(280,0,true)
      end
   end
   if player:HasCollectible(112)==true then --가엔젤
      while player:GetCollectibleNum(112)<2 do
         player:AddCollectible(112,0,true)
      end
   end
   if player:HasCollectible(bloodtr_item)==true then
      while player:GetCollectibleNum(73)<3 do
         player:AddCollectible(73,0,true)
      end
   end
   if player:HasCollectible(252)==true then
      while player:GetCollectibleNum(75)<1 do
         player:AddCollectible(75,0,true)
      end
   end

   if player:HasCollectible(newStageClicker_item)==true then
      while player:GetCollectibleNum(238)<1 do
         player:AddCollectible(238,0,true)
      end
   end
   if player:HasCollectible(538)==true then
      while player:GetCollectibleNum(538)<2 do
         player:AddCollectible(538,0,true)
      end
   end
   if player:HasCollectible(319)==true then
      while player:GetCollectibleNum(245)<1 do
         player:AddCollectible(245,0,true)
      end
   end
   if player:HasCollectible(52)==true then
      while player:GetCollectibleNum(220)<1 do
         player:AddCollectible(220,0,true)
      end
   end
end

RepairMod:AddCallback(ModCallbacks.MC_POST_UPDATE, RepairMod.Recall)


