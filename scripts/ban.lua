function RepairMod:BanItem(newstart)
    local player = Isaac.GetPlayer(0)
    player:DropTrinket(Isaac.GetFreeNearPosition(player.Position, 50),false) --현재 들고있는 부적 드랍
    Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_PAY_TO_WIN)
    Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_BROKEN_REMOTE)
    Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_NO)
    --[[if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_ISAAC then
    end]]
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_MAGDALENA then
        Game():GetItemPool():RemoveCollectible(54);
        Game():GetItemPool():RemoveCollectible(158);
        Game():GetItemPool():RemoveCollectible(215);
        Game():GetItemPool():RemoveCollectible(333);
        Game():GetItemPool():RemoveCollectible(vir_item);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_CAIN then
        Game():GetItemPool():RemoveCollectible(23);
    else
        Game():GetItemPool():RemoveCollectible(188);
        Game():GetItemPool():RemoveCollectible(319);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_JUDAS then
        Game():GetItemPool():RemoveCollectible(10);
        Game():GetItemPool():RemoveCollectible(73);
        Game():GetItemPool():RemoveCollectible(78);
        Game():GetItemPool():RemoveCollectible(83);
        Game():GetItemPool():RemoveCollectible(98);
        Game():GetItemPool():RemoveCollectible(108);
        Game():GetItemPool():RemoveCollectible(112);
        Game():GetItemPool():RemoveCollectible(172);
        Game():GetItemPool():RemoveCollectible(207);
        Game():GetItemPool():RemoveCollectible(213);
        Game():GetItemPool():RemoveCollectible(242);
        Game():GetItemPool():RemoveCollectible(243);
        Game():GetItemPool():RemoveCollectible(265);
        Game():GetItemPool():RemoveCollectible(278);
        Game():GetItemPool():RemoveCollectible(279);
        Game():GetItemPool():RemoveCollectible(292);
        Game():GetItemPool():RemoveCollectible(301);
        Game():GetItemPool():RemoveCollectible(303);
        Game():GetItemPool():RemoveCollectible(335);
        Game():GetItemPool():RemoveCollectible(387);
        Game():GetItemPool():RemoveCollectible(313);
        Game():GetItemPool():RemoveCollectible(393);
        Game():GetItemPool():RemoveCollectible(404);
        Game():GetItemPool():RemoveCollectible(409);
        Game():GetItemPool():RemoveCollectible(423);
        Game():GetItemPool():RemoveCollectible(425);
        Game():GetItemPool():RemoveCollectible(487);
        Game():GetItemPool():RemoveCollectible(503);
        Game():GetItemPool():RemoveCollectible(535);
        Game():GetItemPool():RemoveCollectible(542);
        Game():GetItemPool():RemoveCollectible(549);
        Game():GetItemPool():RemoveCollectible(555);
        Game():GetItemPool():RemoveCollectible(566);
        Game():GetItemPool():RemoveCollectible(588);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_XXX then
        Game():GetItemPool():RemoveCollectible(375);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_EVE then
        Game():GetItemPool():RemoveCollectible(409);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_SAMSON then
        Game():GetItemPool():RemoveCollectible(330);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_AZAZEL then
        Game():GetItemPool():RemoveCollectible(395);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_LAZARUS then
        Game():GetItemPool():RemoveCollectible(54);
        Game():GetItemPool():RemoveCollectible(108);
        Game():GetItemPool():RemoveCollectible(158);
        Game():GetItemPool():RemoveCollectible(301);
        Game():GetItemPool():RemoveCollectible(333);
        Game():GetItemPool():RemoveCollectible(503);
    end
    --[[if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_EDEN then
        Game():GetItemPool():RemoveCollectible(375);
    end]]
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_THELOST then
        Game():GetItemPool():RemoveCollectible(83);
        Game():GetItemPool():RemoveCollectible(108);
        Game():GetItemPool():RemoveCollectible(159);
        Game():GetItemPool():RemoveCollectible(161);
        Game():GetItemPool():RemoveCollectible(178);
        Game():GetItemPool():RemoveCollectible(301);
        Game():GetItemPool():RemoveCollectible(311);
        Game():GetItemPool():RemoveCollectible(332);
        Game():GetItemPool():RemoveCollectible(482);
        Game():GetItemPool():RemoveCollectible(487);
        Game():GetItemPool():RemoveCollectible(527);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_LAZARUS2 then
        Game():GetItemPool():RemoveCollectible(108);
        Game():GetItemPool():RemoveCollectible(301);
        Game():GetItemPool():RemoveCollectible(418);
        Game():GetItemPool():RemoveCollectible(503);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_BLACKJUDAS then
        Game():GetItemPool():RemoveCollectible(375);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_LILITH then
        Game():GetItemPool():RemoveCollectible(329);
        Game():GetItemPool():RemoveCollectible(395);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_KEEPER then
        Game():GetItemPool():RemoveCollectible(83);
        Game():GetItemPool():RemoveCollectible(108);
        Game():GetItemPool():RemoveCollectible(161);
        Game():GetItemPool():RemoveCollectible(223);
        Game():GetItemPool():RemoveCollectible(227);
        Game():GetItemPool():RemoveCollectible(292);
        Game():GetItemPool():RemoveCollectible(311);
        Game():GetItemPool():RemoveCollectible(332);
        Game():GetItemPool():RemoveCollectible(482);
        Game():GetItemPool():RemoveCollectible(498);
        Game():GetItemPool():RemoveCollectible(501);
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_APOLLYON then
        Game():GetItemPool():RemoveCollectible(536);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_THEFORGOTTEN then
        Game():GetItemPool():RemoveCollectible(161);
        Game():GetItemPool():RemoveCollectible(223);
        Game():GetItemPool():RemoveCollectible(311);
        Game():GetItemPool():RemoveCollectible(332);
        Game():GetItemPool():RemoveCollectible(482);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_THESOUL then
        Game():GetItemPool():RemoveCollectible(161);
        Game():GetItemPool():RemoveCollectible(223);
        Game():GetItemPool():RemoveCollectible(311);
        Game():GetItemPool():RemoveCollectible(332);
        Game():GetItemPool():RemoveCollectible(482);
    end

    if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("The Delirious Spirit") then
        player:TryRemoveCollectibleCostume(20, false) --초월
        Game():GetItemPool():RemoveCollectible(161);
    else
        Game():GetItemPool():RemoveCollectible(567);
        Game():GetItemPool():RemoveCollectible(568);
        Game():GetItemPool():RemoveCollectible(596);
        Game():GetItemPool():RemoveCollectible(598);
        Game():GetItemPool():RemoveCollectible(599);
        Game():GetItemPool():RemoveCollectible(600);
        Game():GetItemPool():RemoveCollectible(601);
        Game():GetItemPool():RemoveCollectible(603);
        Game():GetItemPool():RemoveCollectible(604);
        Game():GetItemPool():RemoveCollectible(605);
        Game():GetItemPool():RemoveCollectible(606);
        Game():GetItemPool():RemoveCollectible(607);
        Game():GetItemPool():RemoveCollectible(608);
        Game():GetItemPool():RemoveCollectible(609);
        Game():GetItemPool():RemoveCollectible(610);
        Game():GetItemPool():RemoveCollectible(611);
        Game():GetItemPool():RemoveCollectible(612);
        Game():GetItemPool():RemoveCollectible(613);
        Game():GetItemPool():RemoveCollectible(614);
        Game():GetItemPool():RemoveCollectible(615);
        Game():GetItemPool():RemoveCollectible(616);
        Game():GetItemPool():RemoveCollectible(617);
        Game():GetItemPool():RemoveCollectible(618);
        Game():GetItemPool():RemoveCollectible(619);
        Game():GetItemPool():RemoveCollectible(620);
        Game():GetItemPool():RemoveCollectible(621);
        Game():GetItemPool():RemoveCollectible(622);
        Game():GetItemPool():RemoveCollectible(623);
        Game():GetItemPool():RemoveCollectible(624);
        Game():GetItemPool():RemoveCollectible(625);
        Game():GetItemPool():RemoveCollectible(626);
        Game():GetItemPool():RemoveCollectible(627);
        Game():GetItemPool():RemoveCollectible(628);
        Game():GetItemPool():RemoveCollectible(629);
        Game():GetItemPool():RemoveCollectible(630);
        Game():GetItemPool():RemoveCollectible(631);
        Game():GetItemPool():RemoveCollectible(632);
        Game():GetItemPool():RemoveCollectible(633);
        Game():GetItemPool():RemoveCollectible(634);
        Game():GetItemPool():RemoveCollectible(635);
        Game():GetItemPool():RemoveCollectible(636);
        Game():GetItemPool():RemoveCollectible(637);
        Game():GetItemPool():RemoveCollectible(638);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Hush Child") then
        Game():GetItemPool():RemoveCollectible(161);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Lucifer") then
        Game():GetItemPool():RemoveCollectible(52);
        Game():GetItemPool():RemoveCollectible(68);
        Game():GetItemPool():RemoveCollectible(81);
        Game():GetItemPool():RemoveCollectible(114);
        Game():GetItemPool():RemoveCollectible(118);
        Game():GetItemPool():RemoveCollectible(133);
        Game():GetItemPool():RemoveCollectible(145);
        Game():GetItemPool():RemoveCollectible(152);
        Game():GetItemPool():RemoveCollectible(168);
        Game():GetItemPool():RemoveCollectible(199);
        Game():GetItemPool():RemoveCollectible(395);
        Game():GetItemPool():RemoveCollectible(533);
        Game():GetItemPool():RemoveCollectible(580);
        Game():GetItemPool():RemoveCollectible(sco_item);
        Game():GetItemPool():RemoveCollectible(randomAttack_item);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Midas") then
        player:AddTrinket(TrinketType.TRINKET_SILVER_DOLLAR) --실버달러 소환
        player:UseActiveItem(479, false, true, false, false) --흡수
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_SILVER_DOLLAR)
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_SWALLOWED_PENNY)
        Game():GetItemPool():RemoveCollectible(64);
        Game():GetItemPool():RemoveCollectible(227);
    end
    if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Lamb") then
        Game():GetItemPool():RemoveCollectible(161);
    end
    if Game().Difficulty >= Difficulty.DIFFICULTY_GREED then
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_BLOODY_PENNY)
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_BURNT_PENNY)
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_FLAT_PENNY)
        Game():GetItemPool():RemoveTrinket(TrinketType.TRINKET_COUNTERFEIT_PENNY)
    end
    player:TryRemoveCollectibleCostume(63, false) --배터리
    player:TryRemoveCollectibleCostume(402, false) --카오스
    player:TryRemoveCollectibleCostume(414, false) --옵션
    player:TryRemoveCollectibleCostume(109, false) --머파
    player:TryRemoveCollectibleCostume(380, false) --페이투플레이
end
RepairMod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, RepairMod.BanItem)

function RepairMod:MidasCharAbillity(entity, damage, damageFlag, damageSource, DamageCountdownFrames)
  local player = Isaac.GetPlayer(0)
  if Isaac.GetPlayer(0):GetPlayerType() == Isaac.GetPlayerTypeByName("Midas") then
    player:AddCoins(rangeRandom(1,5)*-1)
  end
end

RepairMod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, RepairMod.MidasCharAbillity, EntityType.ENTITY_PLAYER)
