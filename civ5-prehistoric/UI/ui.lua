-- Prehistoric
--
-- @author: Carlos F Hernandez (Apshai)
-- @date:   May 21, 2014
--
--


--------------------------------------------------------------------
-- Global Function Defines
--------------------------------------------------------------------

PlayerClass         = getmetatable(Players[0]).__index
LuaEvents.Player    = LuaEvents.Player or function(player) end
LuaEvents.City      = LuaEvents.City or function(city) end



--------------------------------------------------------------------
-- Local From GameDefines
--------------------------------------------------------------------

local gSocietyHandicap    = GameDefines["PREHISTORIC_SOCIETY_HANDICAP"];
local gSocietyEvents      = GameDefines["PREHISTORIC_SOCIETY_EVENTS"];



--------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------


--
-- getSocietyPoints
--
-- @param Player pPlayer - current player
--
-- get and set current society points for player
-- 
function getSocietyPoints( pPlayer )

  return 12
end
LuaEvents.Player.Add( PlayerClass.getSocietyPoints )


--
-- getSocietyTooltip
--
-- @param City pCity - current city
--
-- ?
-- 
function getSocietyTooltip( pCity )

end







