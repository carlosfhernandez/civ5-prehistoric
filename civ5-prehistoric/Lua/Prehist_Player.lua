--[[


╔═════════════════════════════════════════════════════════════════════════════
║
║  PLAYER
║  
╠═════════════════════════════════════════════════════════════════════════════
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║
║ RIGHTS
║
║ Release under GPLV3 as per some of the original GPLV3 code
║
║
║
║
╚═════════════════════════════════════════════════════════════════════════════


player:Cities()



--]]



logger.PREFIX = "player"

logger:info( "" )
logger:info( "__FILE__ Player_Pre" )





data = {}




GameEvents.PlayerDoTurn.Add(function(iPlayer) 
  local subprefix = "[PlayerDoTurn] "
  logger:debug( "" )
  logger:debug( subprefix )


  local pPlayer =     Players[iPlayer]
  local bIsHuman =    pPlayer:IsHuman()
  local iHappiness =  pPlayer:GetExcessHappiness()
  local iTotalGold =  pPlayer:GetGold()
  local pCapital =    pPlayer:GetCapitalCity()

  local iTurn =       Game:GetGameTurn()

  logger:debug( subprefix .. "player:" .. pPlayer:GetName() )
  logger:debug( subprefix .. "turn:" .. iTurn )

  if ( iTurn == 5 ) then -- TODO: remove hard-coded number into global options
    logger:debug( subprefix .. "Add free unit:UNIT_TMP_TREE_SETTLERETTLER" )
    pPlayer:AddFreeUnit(GameInfo.Units["UNIT_TMP_TREE_SETTLER"].ID, UNITAI_SETTLE)

  end

  -- return ? 

end); -- PlayerDoTurn







--
-- PlayerLoop
--
-- (Thank you IGE -- took most of funtion from IGE "SetPlayersData")
--
function PlayerInfoLoop( options )
  if data.playersByID then return end
  data.playersByCivType = {}
  data.playersByID =      {}
  data.minorPlayers =     {}
  data.majorPlayers =     {}
  data.allPlayers =       {}

  for i = 0, GameDefines.MAX_CIV_PLAYERS, 1 do
    local player = Players[i]
    if player:IsEverAlive() then -- Must check it to prevent a crash
      -- player.info = {}
      local player_info =       {}
      local player_civ =        {}
      player_info.civ_type =    player:GetCivilizationType()
      player_info.civ =         GameInfo.Civilizations[player_info.civ_type]
      player_info.civname =     player_info.civ.ShortDescription

      if player.isCityState then

        -- todo

      else -- not city state
        player_info.name =        player:GetName()
        player_info.type =        player:GetLeaderType();
        player_info.leaderType =  player:GetLeaderType();
        player_info.isBarbarian = (i == GameDefines.MAX_CIV_PLAYERS)


      end -- city state test

    end
  end


end




--
-- PlayerIsCityState
--
function PlayerIsCityState( pPlayer )

  pPlayer.isCityState = (i >= GameDefines.MAX_MAJOR_CIVS) and (i < GameDefines.MAX_CIV_PLAYERS);

end


-- SAVE DATA
-- save(pPlayer,{"table key"},"value");
   -- for k,v in pairs(load(pPlayer)) do

