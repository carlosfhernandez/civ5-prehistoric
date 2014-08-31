--[[
●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●

TurnsRemaining

@author:        Carlos F Hernandez
@mod:           Prehistoric
@date-created:  2014-08-15


●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
]]--


ContextPtr:SetUpdate(function()

  -- (Taken from DLC 1066)
  -- If the game core is busy, exit, the AI is processing and we don't want to access a half processed state
  if (IsGameCoreBusy()) then
    return;
  end

  if (Game.GetGameState() == GameplayGameStateTypes.GAMESTATE_ON) then

    local iTurnsRemaining = 999999;

  else

    ContextPtr:ClearUpdate(); 
    ContextPtr:SetHide( true );

  end

end);




