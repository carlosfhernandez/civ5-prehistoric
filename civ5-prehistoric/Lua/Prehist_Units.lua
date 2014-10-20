--
-- Units.lua
--
-- Utiliy functions and events for Units
-- 
-- @author: Carlos F Hernandez [apshai; carloscodex]
-- @date: 2014-05-25
-- @thanks: Machiavelli



logger.PREFIX = "units"

logger:info( "" )
logger:info( "__FILE__ Units_Pre" )



--[[
                                           


                  ██╗   ██╗███╗   ██╗██╗████████╗███████╗
                  ██║   ██║████╗  ██║██║╚══██╔══╝██╔════╝
                  ██║   ██║██╔██╗ ██║██║   ██║   ███████╗
                  ██║   ██║██║╚██╗██║██║   ██║   ╚════██║
                  ╚██████╔╝██║ ╚████║██║   ██║   ███████║
                   ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝   ╚══════╝


        
                                  ,dM
                                 dMMP
                                dMMM'
                                \MM/
                                dMMm.
                               dMMP'_\---.
                              _| _  p ;88;`.
                            ,db; p >  ;8P|  `.
                           (``T8b,__,'dP |   |
                           |   `Y8b..dP  ;_  |
                           |    |`T88P_ /  `\;
                           :_.-~|d8P'`Y/    /
                            \_   TP    ;   7`\
                 ,,__        >   `._  /'  /   `\_
                 `._ """"~~~~------|`\;' ;     ,'
                    """~~~-----~~~'\__[|;' _.-'  `\
                            ;--..._     .-'-._     ;
                           /      /`~~"'   ,'`\_ ,/
                          ;_    /'        /    ,/
                          | `~-l         ;    /
                          `\    ;       /\.._|
                            \    \      \     \
                            /`---';      `----'
                           (     /            fsc
                            `---'
    
    
--]]




-- ----------------------------------------------------------------------------
--
-- Events
--
-- ----------------------------------------------------------------------------



--
-- SerialEvenUnitCreated_Pre
--
-- @params [[ params from SerialEvenUnitCreated ]]
--
-- Attaches event to *SerialEventUnitCreated* to add additional checks for a 
-- newly created unit. This is used to detected the creation of a NEW UNIT.
--
-- This is typically used as a trigger for a newly created building. Since it
-- seems that there is no trigger detection for a newly created building
-- I worked around it by giving a free dummy unit and using the unit creation
-- trigger. The dummy unit references the building and any other actions.
--
function SerialEvenUnitCreated_Pre(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)

  logger:debug( "[SerialEvenUnitCreated_Pre] " )
  
  -- check to make sure we have a proper unit and not a dead one or one with 
  -- the "newly created flag/promotion" already assigned
  local player = Players[playerID];
  
  if (player == nil) then return end;
  
  local unit = player:GetUnitByID(unitID);
  
  if (unit == nil or unit:IsDead() or unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CREATED"].ID)) then
    return;
  end


  local unitclass = unit:GetUnitClassType()
  local unittype = GameInfo.Units[ unit:GetUnitType() ].Type
  local plot = unit:GetPlot()
  local city = FindCity(plot, 2)





  --
  -- Dummy Units reflect a newly built building (trigger) and perform actions
  -- accordingly. 
  --
  -- All other units will check for things such as if a certain building is
  -- already built in the city and should give them bonuses.
  --
  if unitclass == "UNITCLASS_BUILDING_TRIGGER_" then

    logger:debug( "[SerialEvenUnitCreated_Pre] Unit dummy class" )

    -- Determine link to building and other actions
    --


    -- TODO: Add other checks beyown the simple unit type check in table.
    --
    -- TODO: Add a build table or add to building table: promotion to give, 
    --       unit_class affecteced, and any other action. For now, we keep the 
    --       logic and definitions in here
    --
    -- To easily determine the ID of building the unit came from:
    --    local buildingID = unit.AdvanceStartCost 
    --    HACK: building id is placed in here  



    -- Either :
    -- (1) flag the unit as newly created and do something later or 
    -- (2) just do something now and delete unit


    -- (1)
    -- Flag the unit as NEW (for another path in game mechanics)
    -- Players[playerID]:GetUnitByID(unitID):SetHasPromotion(GameInfo
    --    .UnitPromotions["PROMOTION_CREATED"].ID, true);


    -- (2)
    -- Find city unit came from and its related building, then delete unit
    

    if unittype ==     "UNIT_BUILDING_LOOKOUT_ROCK"     then
      
      pPromotion = GameInfo.UnitPromotions["PROMOTION_CLIMB_AND_LOOK"].ID;
      

      -- TODO: find all units already created by this city
      -- Loop through units meeting criteria
      -- for u in player:Units() do
      --   if not u:IsHasPromotion(pPromotion) and {UNIT_WAS_BUILT_FROM_THIS_CITY_OR_COMES_TO_THIS_CITY} then
      --     u:SetHasPromotion(pPromotion, true);
      --   end
      -- end
    


    elseif unittype == "UNIT_BUILDING_CHERT_DEPOSIT"    then

        


    elseif unittype == "UNIT_BUILDING_LOOKOUT_TREE"     then




    elseif unittype == "UNIT_BUILDING_TREE"             then



      
    elseif unittype == "UNIT_BUILDING_SPRING_SOURCE"    then




    elseif unittype == "UNIT_BUILDING_GOLDEN_PATH"      then




    elseif unittype == "UNIT_BUILDING_STONE_PILE"       then




    end



    -- because I hate dummy units
    unit:Kill()




  -- 
  -- NOT UNITCLASS_BUILDING_TRIGGER
  --
  else 
  
    logger:debug( "[SerialEvenUnitCreated_Pre] *NOT* a unit dummy class" )

    if city == nil then
      logger:debug( "[SerialEvenUnitCreated_Pre] exiting since city was not found within radius" )
      return nil
    end

    logger:debug( "[SerialEvenUnitCreated_Pre] set unit (" .. unittype .. " " .. unitID .. ") home city (" .. city:GetName() .. ")" )
    SetUnitHomeCity(unit, city)



    -- check to see if early founding unit does not take away population
    UnitFoundingException(unit, city)



    -- check for possible promotions
    UnitBuildingPromotion(unit, unittype, city)



  end -- unitclass check for dummy




  -- lazy load and create new event
  LuaEvents.SerialEvenUnitCreated_Pre(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, false)
end
Events.SerialEventUnitCreated.Add(SerialEvenUnitCreated_Pre)

--
-- SerialEventUnitDestroyed_Pre
--
--
--
--
--
--
function SerialEventUnitDestroyed_Pre(playerID, UnitID)

  logger:debug( "[SerialEventUnitDestroyed_Pre] " )

  -- check if this was during early game and player's last unit (AI)
  -- and create new unit




  LuaEvents.SerialEventUnitDestroyed_Pre(playerID, UnitID)
end
Events.SerialEventUnitDestroyed.Add(SerialEventUnitDestroyed_Pre)

--
-- UnitSetXY_Pre
--
--
--
--
-- 
function UnitSetXY_Pre(playerID, unitID, x ,y)

  logger:debug( "[UnitSetXY] Player " .. playerID .. " has moved to (" .. x .. ", " .. y .. ")" ) 

  local player = Players[playerID];
  local playerTeamID = player:GetTeam();

  if (player == nil) then return end;
  
  local unit = player:GetUnitByID(unitID);
  
  if (unit == nil or unit:IsDead()) then return end

  local unitclass = unit:GetUnitClassType()
  local unittype = GameInfo.Units[ unit:GetUnitType() ].Type
  local plot = unit:GetPlot()



  --
  -- Visibility Modifications
  --
  if (unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_PREHISTORIC_MAPPING"].ID)) then

    for neighbor in Neighbors(plot) do
      -- set plot visible

      -- TODO: Check the current effect on game!
      neighbor:SetRevealed(playerTeamID, true)
      neighbor:UpdateFog()

    end


    local r=3 -- temp max range hard-coded
    for dx = -r, r do
      for dy = -r, r do
        
        plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, r);

        if plot then
          local plot_location_debug = "[ " .. x .. " x " .. y .. "   " .. dx .. " x " .. dy .. "]";
          -- logger:debug( "check plot location: " ..  plot_location_debug );
          if plot:IsCity() then
            -- city = plot:GetPlotCity();
            -- break;
          end

        end -- if plot

      end -- for x

      if city then break end;

    end -- for y

  end -- Visibility Modifications






  -- check early founding units not too far away or start losing health
  -- building portable grass shelter will help with this
    -- TODO: AI ... arg ...



end
GameEvents.UnitSetXY.Add(UnitSetXY_Pre)

--
--
--
--
--
--
--
function SerialEventUnitMove_Pre()

  logger:debug( "[SerialEventUnitMove_Pre]" )

end
Events.SerialEventUnitMove.Add(SerialEventUnitMove_Pre)

--
--
--
--
--
--
--
function SerialEventUnitMoveToHex_Pre()

  logger:debug( "[SerialEventUnitMoveToHex_Pre]" )

end
-- Events.SerialEventUnitMoveToHex.Add(SerialEventUnitMoveToHex_Pre)
-- attempt to index field 'SerialEventUnitMoveToHex' (a nil value)








































































-- ----------------------------------------------------------------------------
--
-- Utility Functions
--
-- ----------------------------------------------------------------------------






--
-- UnitFoundingException
--
-- TODO: move this logic to table
--
function UnitFoundingException( unit, unitclass, city )

  -- early founding units
  if unitclass=="UNITCLASS_TRIBE_SPLIT" or unitclass=="UNITCLASS_SETTLER" then

    if not city:IsHasBuilding( "BUILDING_OPEN_SHELTER" ) then -- TODO: or ERA past a certain point
      
      city:SetPopulation( city:GetPopulation() - 1, true )
    end

  end

end


--
-- UnitBuildingPromotion
--
-- @param {Unit} unit - the unit object instance
-- @param {UnitType} unittype - this is the type name (e.g. "UNIT_WARRIOR")
-- @param {City} city - the city object instance
--
-- Checks the custom table, Building_UnitPromotions to see if the unit is 
-- elligible for a promotion based on the existence of a building and the 
-- unit type.
--
function UnitBuildingPromotion(unit, unittype, city)

  logger:debug( "[ubp] f:UnitBuildingPromotion" )

  logger:debug( "[ubp] unitType:" .. unittype )

  for row in GameInfo.Building_UnitPromotions{UnitType=unittype} do
    logger:debug( "[ubp] row building:" .. row.BuildingType .. "   row promo:" .. row.UnitPromotionType )
    local promo = GameInfo.UnitPromotions[row.UnitPromotionType].ID
    logger:debug( "[ubp] promo id: " .. promo )
    if not unit:IsHasPromotion(promo) and city:IsHasBuilding(GameInfo.Buildings[row.BuildingType].ID) then
      logger:debug( "[ubp] setting promotion " .. row.UnitPromotionType .. " for unit " .. unittype .. " with id " .. unit:GetID() )
      unit:SetHasPromotion(promo, true);
    end
  end

end

--
-- SetUnitHomeCity
--
-- @param {Unit} unit
-- @param {City} city
--
-- Remember and save the speciic unit's home city. I am currently finding the
-- closes city upon creation and passing to this function.
--
-- I believe there ia another way to do this and I could not find it. 
--
-- * PLEASE LET ME KNOW IF YOU HAPPEN KNOW ANOTHER AND BETTER WAY TO DO THIS. *
--
function SetUnitHomeCity(unit, city)

  save( unit, "homecity", city ) 




end

-- FindCity
--
-- @param {Plot} plotstart
-- @param {Int} radius
--
-- get home city hack kluge dirty rotten attempt because I can't find the
-- right way to get this. this won't work 100%, either, because I am only
-- checking for the closes city within an X-radius (default=2). 
--
-- THere is potential problem if your city is surrounded by units when the
-- new dummy unit built and gets placed somwhere far away that is closer
-- to another city.
--
-- All this kluging around is ugly. I may try to figure out a way to ensure
-- this unit can stack into the city regardless of what is there.
--
-- TODO: ANY HELP WOULD BE APPRECIATED
--
function FindCity(plotStart, radius)

  local x = plotStart:GetX();
  local y = plotStart:GetY();
  local r = radius;


  local bCity = plotStart:IsCity();

  local bCityRadius = plotStart:IsCityRadius();
  local bCityPlayerRadius = plotStart:IsPlayerCityRadius();
  logger:debug( "IsCityRadius: " .. ( bCityRadius and "true" or "false" ) );
  logger:debug( "IsPlayerCityRadius: " .. ( bCityPlayerRadius and "true" or "false" ) );


  local city = plotStart:GetPlotCity();
  local plot = plotStart;


  if not city then

    for dx = -r, r do
      for dy = -r, r do
        
        plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, r);

        if plot then
          local plot_location_debug = "[ " .. x .. " x " .. y .. "   " .. dx .. " x " .. dy .. "]";
          -- logger:debug( "check plot location: " ..  plot_location_debug );
          if plot:IsCity() then
            city = plot:GetPlotCity();
            break;
          end
        end -- if plot

      end -- for x

      if city then break end;

    end -- for y


  end -- if not city


  -- debug -- lots of debug, some of it to find out what certain function do
  if city then
    logger:debug( "[FindCity] " )
    logger:debug( "[FindCity] city found!" );
    local cityID = city:GetID();
    local player = city:GetOwner();
    local cityPlayerRadiusCount = plot:GetPlayerCityRadiusCount(player);
    local cityRadiusCount = plot:GetCityRadiusCount(player);
    local workingCity = plot:GetWorkingCity();
    logger:debug( "[FindCity] city id: " .. cityID );
    logger:debug( "[FindCity] city owner: " .. player );
    logger:debug( "[FindCity] cityRadiusCount: " .. cityRadiusCount );
    logger:debug( "[FindCity] cityPlayerRadiusCount: " .. cityPlayerRadiusCount );
  else
    logger:debug( "[FindCity] " )
    logger:debug( "[FindCity] city *NOT* found!" )
  end


  return city;

end































