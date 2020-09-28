----------
--CONFIG--
----------


--REPENTANCE--
-- Original effect: Simply rerolls collectibles like the D6.
-- Changed effect: Also rerolls pickups into those of the same type.

-- Change this to true to make it act like the original repentance card.
LostCardsMod.OriginalRepentance = false


--CORRUPTION--
-- Original effect: Always teleports to the error room.
-- Changed effect: Triggers the Undefined effect, which teleports to random special rooms with a chance to teleport to the error room.

-- Change this to true to make it act like the original corruption card.
LostCardsMod.OriginalCorruption = false


--COLD--
-- Original effect: Slows all enemies in the room
-- Our effect: Adds a much greater slowdown with a blue color, making the enemies appear "chilled" and can turn them into frosty variants from Revelations if you have it enabled.

-- Change this to true to make it act like the original cold card.
LostCardsMod.OriginalCold = false



  --DO NOT EDIT THIS--
  LostCardsMod:ForceError() --this function doesn't exist, we do this to cause an error intentionally
