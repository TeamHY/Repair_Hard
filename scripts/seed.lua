local seedShown = false

--Scale multiplier, 1 = 100%, 1.25 = 125% etc.
local fontScale = 1

--Position
local posX = 16
local posY = 240

--Color
local Red = 255
local Green = 255
local Blue = 255
local Alpha = 1

--Replaces the space between 2 strings with whatever you want. I don't know why would you want to do that tho.  
local replaceSpace = false
local replaceSpaceWith = "-"

--Manly stuff ahead. Keep out. 
function RepairMod:PostPlayerInit()
	if not seedShown then
		RepairMod:ShowSeed()
	end
end

function RepairMod:ShowSeed()
	local seed = Game():GetSeeds():GetStartSeedString()
	
	if not replaceSpace then
		Isaac.RenderScaledText(seed, posX, posY, fontScale, fontScale, Red/255, Green/255, Blue/255, Alpha)
		
	else
		local seedReplaced = string.gsub(seed, " ", replaceSpaceWith)
		Isaac.RenderScaledText(seedReplaced, posX, posY, fontScale, fontScale, Red/255, Green/255, Blue/255, Alpha)
	end
	seedShown = true
end

RepairMod:AddCallback(ModCallbacks.MC_POST_RENDER, RepairMod.ShowSeed)
RepairMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, RepairMod.PostPlayerInit)