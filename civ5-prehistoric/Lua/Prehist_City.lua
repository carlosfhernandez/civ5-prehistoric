--
--
--
--
--
--
--
--
--


logger.PREFIX = "city"

logger:info( "" )
logger:info( "__FILE__ City_Pre" )



-- TODO: change initial city ART to ruins or camp




--
-- OnCityFounded
--
-- iPlayer
-- iCityX
-- iCityY
--
function OnCityFounded2(iPlayer, iCityX, iCityY)

  logger:debug( "[OnCityFounded] " )
  logger:debug( "player:" .. iPlayer .. " city-x:" .. iCityX .. " city-y:" .. iCityY )

  -- Add free buildings based on our current era
  --for tBuilding in GameInfo.Buildings() do
  --  if (IsBuildingFreeInEra(tBuilding, iEra)) then
  --    AddBuilding(pCity, tBuilding);
  --  end
  --end

  -- Add extra population based on our current era
  --AddPopulation(pCity, GetNumFreeCitizensInEra(iEra));


end
GameEvents.PlayerCityFounded.Add( OnCityFounded2 );




--
-- SerialEventCityCreated_Pre
--
-- Vector2 vHexPos
-- PlayerID player
-- CityID cityID
-- ArtStyleType artStyleType
-- EraType eraType
-- int continent
-- int populationSize
-- int size
-- int fogState
--
function SerialEventCityCreated_Pre( vHexPos, player, cityID, artStyleType, eraType, continent, populationSize, size, fogState )
  logger:debug( "" )
  logger:debug( "[SerialEventCityCreated_Pre] " )
  logger:debug( " city:" .. cityID )
  logger:debug( " player:" .. player )
  logger:debug( " era:" .. eraType )
  logger:debug( " popsize:" .. populationSize )
  logger:debug( " size:" .. size )
  logger:debug( "" )

  local p = player
  local e = eraType
  local c = cityID
  local v = vHexPos
  local player = Players[p]
  local city = player:GetCityByID(c)
  local era = GameInfo.Eras[e].Type
  logger:debug( "era:" .. era )

  -- Limit maximum growth based on era
  if     era == "ERA_PREHISTORIC"         then

    logger:debug( "set city prehistoric limit to 0" )
    city:SetHighestPopulation(0)

    LimitCityVisibility(city, 1)


  elseif era == "ERA_LOWER_PALEOLITHIC"   then

    logger:debug( "set city lower paleolithic limit to 1" )
    city:SetHighestPopulation(1)

  elseif era == "ERA_PALEOLITHIC"         then

    logger:debug( "set city paleolithic limit to 2" )
    city:SetHighestPopulation(2)

  elseif era == "NEOLITHIC"               then

    logger:debug( "set city neolithic limit to 3" )
    city:SetHighestPopulation(3)

  end


  LuaEvents.SerialEventCityCreated_Pre( v, p, c, artStyleType, e, continent, populationSize, size, fogState )
end
Events.SerialEventCityCreated.Add( SerialEventCityCreated_Pre )




--
-- SerialEventCityDestroyed_Pre
--
-- Vector2 hexPos
-- PlayerID player
-- int cityID
-- PlayerID newPlayer
--
function SerialEventCityDestroyed_Pre( hexPos, player, cityID, newPlayer )
  logger:debug( "" )
  logger:debug( "[SerialEventCityDestroyed_Pre]" )
  logger:debug( "player:" .. player )
  logger:debug( "city:" .. cityID )
  logger:debug( "player2:" .. newPlayer )



  LuaEvents.SerialEventCityDestroyed_Pre( hexPos, player, cityID, newPlayer )
end
Events.SerialEventCityDestroyed.Add( SerialEventCityDestroyed_Pre )





function AddPopulation(pCity, iPopulation)

  if (pCity == nil) then return; end

  pCity:ChangePopulation(iPopulation, true);

end


function LimitCityVisibility( cityID, iLimit )

  


  


end

-- City.ConscriptMinCityPopulation (Civ5 API)













