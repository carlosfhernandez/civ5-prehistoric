--
-- Era_pre.lua
--
-- 
-- 
-- @author: Carlos F Hernandez [apshai; carloscodex]
-- @date: 2014-08-25
-- @thanks: 
--
--
--


logger.PREFIX = "era"

logger:info( "" )
logger:info( "__FILE__ Era_Pre" )





--
-- SerialEventEraChanged_Pre
--
-- int arg0
-- PlayerID currPlayer
--
function SerialEventEraChanged_Pre( arg0, currPlayer )

  logger:debug( "[SerialEventEraChanged_Pre]")
  logger:debug( "arg0:" .. arg0 )

  -- set option for not complete kills off after certain era unless player
  -- initially set this value
  -- Game.SetOption(9, false)


  local e = arg0
  local era = GameInfo.Eras[e].Type


  if     era == "ERA_PREHISTORIC"         then

    logger:debug( "set era prehistoric option full kill true" )
    Game.SetOption(9, true)

  elseif era == "ERA_LOWER_PALEOLITHIC"   then

    logger:debug( "set era lower paleolithic option full kill true" )
    Game.SetOption(9, true)

  elseif era == "ERA_PALEOLITHIC"         then

    logger:debug( "set era paleolithic option full kill true" )
    Game.SetOption(9, true)

  elseif era == "NEOLITHIC"               then

    logger:debug( "set era neolithic option full kill true" )
    Game.SetOption(9, false)

  end


  LuaEvents.SerialEventEraChanged_Pre( arg0, currPlayer )
end
Events.SerialEventEraChanged.Add( SerialEventEraChanged_Pre )



