--
-- Units.lua
--
-- Utiliy functions and events for Units
-- 
-- @author: Carlos F Hernandez [apshai; carloscodex]
-- @date: 2014-05-25
-- @thanks: Machiavelli




--[[                             Units                                     --]]




--
-- SerialEvenUnitCreated_Pre
--
-- Attaches event to *SerialEventUnitCreated* to add additional checks for a 
-- newly created unit. This is used to detected the creation of a NEW UNIT.
--
-- @param [[ see SerialEventUnitCreated ]]
--
--
function SerialEvenUnitCreated_Pre(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)

  -- check to make sure we have a proper unit and not a dead one or one with 
  -- the "newly created flag/promotion" already assigned
  if(Players[playerID] == nil or
    Players[playerID]:GetUnitByID(unitID) == nil or
    Players[playerID]:GetUnitByID(unitID):IsDead() or
    Players[playerID]:GetUnitByID(unitID):IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CREATED"].ID)) then
    return;
  end

  -- Flag the unit as NEW (for another path in game mechanics)
  -- Players[playerID]:GetUnitByID(unitID):SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_CREATED"].ID, true);


  -- OR --


  -- Determine link to building and other actions
  --
  -- TODO: Add a build table or add to building table: promotion to give, 
  --       unit_class affecteced, and any other action. For now, we keep the 
  --       logic and definitions in here
  local pUnit = Players[playerID]:GetUnitByID(unitID)
  
  -- To easily determine the ID of building the unit came from:
  -- local buildingID = pUnit.AdvanceStartCost -- HACK: building id 
  --                                                    is placed in here


  -- get home city hack kluge dirty rotten attempt because I can't find the
  -- right way to get this. this won't work 100%, either, because I am only
  -- checking for immediate 1-space radius
  local pCity = nil;



  if unitType ==     "UNIT_BUILDING_LOOKOUT_ROCK"     then
    pPromotion = GameInfo.UnitPromotions["PROMOTION_CLIMB_AND_LOOK"].ID;
    
    -- loop through units in this city
    if not qUnit:IsHasPromotion(pPromotion) then
      qUnit:SetHasPromotion(pPromotion, true);
    end


  elseif unitType == "UNIT_BUILDING_SPRING_SOURCE"    then



  elseif unitType == "UNIT_BUILDING_GOLDEN_PATH"      then



  elseif unitType == "UNIT_BUILDING_STONE_PILE"       then





  end


  -- because I hate dummy units
  pUnit:Kill();


  -- lazy load and create new event
  LuaEvents.SerialEvenUnitCreated_Pre(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, false)
end
Events.SerialEventUnitCreated.Add(SerialEvenUnitCreated_Pre);




